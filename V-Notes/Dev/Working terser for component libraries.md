```ts
terser({
	module: true,
	output: { comments: 'all', preserve_annotations: true },
	compress: { side_effects: false },
	mangle: false,
}),

```