function useProductInventory(
	opts: Parameters<typeof useProductsInventoryQuery>[0],
) {
	const { data, isPending, isError } = useQuery({
		...useProductsInventoryQuery(opts),
		enabled: R.hasAtLeast(opts.skus, 1),
	});

	const inventoryMap = new Map();
	data?.getInventoryData.inventory_data.forEach((item) => {
		const { stock_status, salable_qty } = item;
		inventoryMap.set(item.sku, { stock_status, salable_qty });
	});



	return {
		inventory: inventoryMap,
		isPending,
		isError,
	};
}


	// console.group();
	// console.log(
	// 	"ARRR",
	// 	Array.from(productMap.values()).slice(testObjectKeys.length),
	// );
	//
	// console.log(
	// 	product.details,
	// 	product.sku,
	// 	{ productMap },
	// 	{ testObjectKeys },
	// 	{ stores },
	// );
	// console.groupEnd();


				{/* style={{ */}
				{/* 	// width: "calc(100dw - var(--scroll-bar-width))", */}
				{/* 	width: "calc(100dvw - 17px)", */}
				{/* }} */}
				
```ts
											const pmap = new Map(
												segment.bundles.flatMap((bundle) =>
													bundle.products.map((product) => {
														return [product.sku, product];
													}),
												),
											);

```

```ts
export function useProductsInventoryQuery<T>(opts?: {
	select?: (res: InventoryMap) => T;
}) {
	const g = useCommerceClient();
	const { data: bundles = [] } = useProductSearchItems();
	const skus = processSimpleSkusFromBundle(bundles);
	const { data: inventory } = useQuery(
		useCartInventoryQuery({
			select: useCallback((m) => m.customerCart, [skus]),
		}),
	);



	const cartInventoryMap = new Map(
		inventory?.shipping_addresses.flatMap((address) => {
			if (address.cart_items_v2) {
				return address.cart_items_v2.map((product) => [
					product.product.sku,
					product,
				]);
			}
			return [];
		}),
	);
	console.log({ inventory });

	return queryOptions({
		queryKey: ["products", "inventory", skus],
		queryFn: async () => {
			const res = await g.graffle.gql(GetInventoryDataQuery).send({
				skus,
			});

			const parsed = v.parse(ProductInventoryResponseSchema, res);

			const inventoryMap: InventoryMap = new Map();
			parsed.getInventoryData.inventory_data.forEach((item) => {
				const { stock_status, salable_qty } = item;
				const inventoryInCart = cartInventoryMap.get(item.sku);
				console.log(item.sku);
				console.log({ cartInventoryMap });
				console.log({ salable_qty });
				console.log({ inventoryInCart });
				inventoryMap.set(item.sku, {
					stock_status,
					salable_qty: salable_qty - (inventoryInCart?.quantity ?? 0),
				});
			});

			return inventoryMap;
		},
		select: opts?.select,
		enabled: useAuthenticatedOptions().enabled && R.hasAtLeast(skus, 1),
	});
}

```


```ts
import config, { generateRootColors } from "./tailwind.config.ts";

const c = config;

console.dir(c, { colors: true, depth: Infinity });

console.log("gen", generateRootColors("dark"));

```