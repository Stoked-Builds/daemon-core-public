#!/usr/bin/env bash
#
# export-repo.sh — Export repository content as a clean zip file with screenshots
#
# Usage: ./tools/export-repo.sh [output-name] [--no-screenshots]
#
# Creates a zip archive in ./code-export/<datetime>/ excluding build artefacts,
# system files, and other irrelevant content. Also generates screenshots of
# website pages.

set -euo pipefail

# Configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
REPO_NAME="$(basename "$REPO_ROOT")"
TIMESTAMP="$(date -u +%Y-%m-%dT%H%M%SZ)"
EXPORT_DIR="$REPO_ROOT/code-export/$TIMESTAMP"
OUTPUT_NAME="${1:-$REPO_NAME}"
ZIP_FILE="$EXPORT_DIR/$OUTPUT_NAME.zip"
SCREENSHOTS_DIR="$EXPORT_DIR/screenshots"
SCREENSHOTS_ZIP="$EXPORT_DIR/screenshots.zip"
SKIP_SCREENSHOTS=false

# Parse arguments
for arg in "$@"; do
    case $arg in
        --no-screenshots)
            SKIP_SCREENSHOTS=true
            ;;
    esac
done

# Website configuration
WEBSITE_DIR="$REPO_ROOT/website"
WEBSITE_PORT=4321
SERVER_PID=""

# Pages to screenshot (relative paths from site root)
PAGES=(
    "/"
    "/early-access"
    "/media-kit"
    "/daemon"
    "/daemon/overview"
    "/daemon/what-it-is"
    "/daemon/what-it-isnt"
    "/daemon/why-different"
    "/daemon/architecture"
    "/daemon/comparisons"
    "/daemon/faq"
    "/daemon/blog"
    "/daemon/blog/hello-world"
)

# Patterns to exclude from export
EXCLUDE_PATTERNS=(
    # macOS
    ".DS_Store"
    "._*"
    ".AppleDouble"
    ".LSOverride"
    ".Spotlight-V100"
    ".Trashes"

    # Windows
    "Thumbs.db"
    "ehthumbs.db"
    "Desktop.ini"

    # Linux
    "*~"
    ".directory"

    # Version control
    ".git"
    ".gitignore"
    ".gitattributes"
    ".svn"
    ".hg"

    # Node.js / JavaScript
    "node_modules"
    "npm-debug.log*"
    "yarn-debug.log*"
    "yarn-error.log*"
    ".npm"
    ".yarn"
    ".pnpm-store"

    # Build outputs
    "dist"
    "build"
    "out"
    ".next"
    ".nuxt"
    ".output"
    ".turbo"
    ".vercel"
    ".netlify"

    # Caches
    ".cache"
    ".parcel-cache"
    ".eslintcache"
    ".stylelintcache"
    "*.tsbuildinfo"

    # Python
    "__pycache__"
    "*.pyc"
    "*.pyo"
    "*.pyd"
    '*.class'
    ".Python"
    "*.egg-info"
    ".eggs"
    "*.egg"
    ".venv"
    "venv"
    "env"
    ".env"
    ".env.local"
    ".env.*.local"

    # IDE / Editor
    ".idea"
    ".vscode"
    "*.swp"
    "*.swo"
    "*.swn"
    "*~"

    # Testing / Coverage
    "coverage"
    ".nyc_output"
    ".coverage"
    "htmlcov"

    # Logs
    "*.log"
    "logs"

    # Temporary files
    "tmp"
    "temp"
    "*.tmp"
    "*.temp"

    # This export folder itself
    "code-export"
)

# Build zip exclude arguments
build_exclude_args() {
    local args=()
    for pattern in "${EXCLUDE_PATTERNS[@]}"; do
        args+=("-x" "$pattern" "-x" "*/$pattern" "-x" "*/$pattern/*")
    done
    echo "${args[@]}"
}

# Cleanup function
cleanup() {
    if [[ -n "$SERVER_PID" ]] && kill -0 "$SERVER_PID" 2>/dev/null; then
        echo "Stopping preview server (PID: $SERVER_PID)..."
        kill "$SERVER_PID" 2>/dev/null || true
        wait "$SERVER_PID" 2>/dev/null || true
    fi
}

trap cleanup EXIT

# Check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Wait for server to be ready
wait_for_server() {
    local url="$1"
    local max_attempts=30
    local attempt=0

    echo "Waiting for server at $url..."
    while [[ $attempt -lt $max_attempts ]]; do
        if curl -s -o /dev/null -w "%{http_code}" "$url" | grep -q "200\|304"; then
            echo "Server is ready!"
            return 0
        fi
        attempt=$((attempt + 1))
        sleep 1
    done

    echo "Error: Server did not become ready in time" >&2
    return 1
}

# Generate screenshots using Puppeteer
generate_screenshots() {
    echo ""
    echo "=== Generating Screenshots ==="

    # Check for required tools
    if ! command_exists node; then
        echo "Warning: Node.js not found. Skipping screenshots."
        return 1
    fi

    if ! command_exists npx; then
        echo "Warning: npx not found. Skipping screenshots."
        return 1
    fi

    # Check if website directory exists
    if [[ ! -d "$WEBSITE_DIR" ]]; then
        echo "Warning: Website directory not found at $WEBSITE_DIR. Skipping screenshots."
        return 1
    fi

    # Build the website
    echo "Building website..."
    cd "$WEBSITE_DIR"

    if [[ ! -d "node_modules" ]]; then
        echo "Installing dependencies..."
        npm install --silent
    fi

    npm run build --silent

    # Start preview server
    echo "Starting preview server on port $WEBSITE_PORT..."
    npm run preview -- --port "$WEBSITE_PORT" &
    SERVER_PID=$!

    # Wait for server to be ready
    if ! wait_for_server "http://localhost:$WEBSITE_PORT"; then
        return 1
    fi

    # Create screenshots directory
    mkdir -p "$SCREENSHOTS_DIR"

    # Create the Puppeteer screenshot script
    local screenshot_script="$EXPORT_DIR/.screenshot-generator.mjs"
    cat > "$screenshot_script" << 'PUPPETEER_SCRIPT'
import puppeteer from 'puppeteer';
import { mkdir } from 'fs/promises';
import { dirname } from 'path';

const baseUrl = process.argv[2];
const outputDir = process.argv[3];
const pagesJson = process.argv[4];

const pages = JSON.parse(pagesJson);

async function captureScreenshots() {
    const browser = await puppeteer.launch({
        headless: 'new',
        args: ['--no-sandbox', '--disable-setuid-sandbox']
    });

    const page = await browser.newPage();

    // Set viewport for consistent screenshots
    await page.setViewport({
        width: 1440,
        height: 900,
        deviceScaleFactor: 2
    });

    for (const pagePath of pages) {
        const url = `${baseUrl}${pagePath}`;
        const filename = pagePath === '/' ? 'home' : pagePath.replace(/^\//, '').replace(/\//g, '-');
        const outputPath = `${outputDir}/${filename}.png`;

        console.log(`Capturing: ${url} -> ${filename}.png`);

        try {
            await page.goto(url, {
                waitUntil: 'networkidle0',
                timeout: 30000
            });

            // Wait a bit for any animations
            await new Promise(r => setTimeout(r, 500));

            // Capture full page screenshot
            await page.screenshot({
                path: outputPath,
                fullPage: true
            });

            console.log(`  ✓ Saved ${filename}.png`);
        } catch (error) {
            console.error(`  ✗ Failed to capture ${pagePath}: ${error.message}`);
        }
    }

    await browser.close();
    console.log('\nScreenshot capture complete!');
}

captureScreenshots().catch(console.error);
PUPPETEER_SCRIPT

    # Install puppeteer temporarily and run the script
    echo "Installing Puppeteer..."
    cd "$EXPORT_DIR"
    npm init -y --silent 2>/dev/null
    npm install puppeteer --silent

    echo "Capturing screenshots..."
    local pages_json
    pages_json=$(printf '%s\n' "${PAGES[@]}" | jq -R . | jq -s .)

    node "$screenshot_script" "http://localhost:$WEBSITE_PORT" "$SCREENSHOTS_DIR" "$pages_json"

    # Cleanup temporary files
    rm -f "$screenshot_script"
    rm -f "$EXPORT_DIR/package.json"
    rm -f "$EXPORT_DIR/package-lock.json"
    rm -rf "$EXPORT_DIR/node_modules"

    # Create screenshots zip
    if [[ -d "$SCREENSHOTS_DIR" ]] && [[ -n "$(ls -A "$SCREENSHOTS_DIR" 2>/dev/null)" ]]; then
        echo ""
        echo "Creating screenshots archive..."
        cd "$EXPORT_DIR"
        zip -r "$SCREENSHOTS_ZIP" screenshots -x "*.DS_Store" 2>/dev/null

        local screenshots_size
        screenshots_size=$(du -h "$SCREENSHOTS_ZIP" | cut -f1)
        local screenshots_count
        screenshots_count=$(ls -1 "$SCREENSHOTS_DIR" | wc -l | tr -d ' ')

        echo "Screenshots archive created!"
        echo "  Location: $SCREENSHOTS_ZIP"
        echo "  Size: $screenshots_size"
        echo "  Screenshots: $screenshots_count"
    fi

    # Stop the preview server
    cleanup
    SERVER_PID=""

    return 0
}

# Export repository
export_repository() {
    echo ""
    echo "=== Exporting Repository ==="

    # Change to repo root for relative paths in zip
    cd "$REPO_ROOT"

    # Create zip with exclusions
    echo "Creating archive..."

    # Build exclude arguments
    EXCLUDE_ARGS=($(build_exclude_args))

    # Create the zip file
    zip -r "$ZIP_FILE" . "${EXCLUDE_ARGS[@]}" -x "*.zip" 2>/dev/null || true

    # Report results
    if [[ -f "$ZIP_FILE" ]]; then
        local zip_size
        zip_size=$(du -h "$ZIP_FILE" | cut -f1)
        local file_count
        file_count=$(unzip -l "$ZIP_FILE" 2>/dev/null | tail -1 | awk '{print $2}')

        echo ""
        echo "Repository export complete!"
        echo "  Location: $ZIP_FILE"
        echo "  Size: $zip_size"
        echo "  Files: $file_count"
    else
        echo "Error: Failed to create zip file" >&2
        exit 1
    fi
}

# Main
main() {
    echo "========================================"
    echo "  Repository Export Tool"
    echo "========================================"
    echo ""
    echo "Repository: $REPO_NAME"
    echo "Timestamp:  $TIMESTAMP"
    echo "Output:     $EXPORT_DIR"

    # Create export directory
    mkdir -p "$EXPORT_DIR"

    # Generate screenshots (unless skipped)
    if [[ "$SKIP_SCREENSHOTS" == "false" ]]; then
        if ! generate_screenshots; then
            echo ""
            echo "Warning: Screenshot generation failed or was skipped."
        fi
    else
        echo ""
        echo "Skipping screenshots (--no-screenshots flag)"
    fi

    # Export repository
    export_repository

    echo ""
    echo "========================================"
    echo "  Export Summary"
    echo "========================================"
    echo ""
    echo "Output directory: $EXPORT_DIR"
    echo ""
    ls -lh "$EXPORT_DIR"/*.zip 2>/dev/null || echo "No zip files created"
    echo ""
    echo "Done!"
}

main "$@"
