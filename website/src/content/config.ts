import { defineCollection, z } from 'astro:content';

const docsCollection = defineCollection({
  type: 'content',
  schema: z.object({
    title: z.string(),
    description: z.string(),
    order: z.number().optional(),
    draft: z.boolean().optional().default(false),
    publishedAt: z.date().optional(),
    updatedAt: z.date().optional(),
  }),
});

export const collections = {
  docs: docsCollection,
};
