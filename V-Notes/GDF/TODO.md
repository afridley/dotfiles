- [ ] look back into W33D-777 and gather info for crimson.
---
Methodology.
inputs should be scope required to what we currently do then expanded.
outputs should be mapped to the output.


		"storybook": "concurrently \"npm run dev\" \"storybook dev -p 6006\"",


```
import type { Preview } from "@storybook/react-vite";
import "../dist/output.css";
import React from "react";

const preview: Preview = {
	parameters: {
		controls: {
			matchers: {
				color: /(background|color)$/i,
				date: /Date$/i,
			},
		},

		a11y: {
			// 'todo' - show a11y violations in the test UI only
			// 'error' - fail CI on a11y violations
			// 'off' - skip a11y checks entirely
			test: "todo",
		},
	},
	globalTypes: {
		theme: {
			description: "Global theme for components",
			toolbar: {
				title: "Theme",
				icon: "circlehollow",
				items: ["light", "dark"],
				dynamicTitle: true,
			},
		},
	},
	initialGlobals: {
		theme: "light",
	},
	decorators: [
		(Story, context) => {
			const theme = context.globals.theme || "light";
			console.log({ theme, Story, context });
			return <Story />;
		},
	],
};

export default preview;

```

Catsy is the PIM
Hoodie Administers the PIM the actual PIM? Does this mean CATSY.

The Master sku is a product

Is there a way to change the master skus still or are they disseminated

-1 is a marketing object because dutchie does not have scoping

infoPlus needed -b -p so that these did not get selected by infoPlus during fulfillment so we don't send out budtender or partials to customers expecting more quantity.

product sku should be the primary key in 2 tables.
table one has the primary sku.
table 2 has non primary with a parent sku foreign key of the primary sku product sku.


masterSku not used for the sku sku.
productSku_batchId
