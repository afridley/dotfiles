## Questions

* Can we get an root order id that has order id for each location so we. can group a single order and retrieve it by an id.
* Is Our Adobe search using open search fast api's.
* Not seeing all the options appear in facets.
* Can salable qty be on the bundle as well with inventory flags.
* Not all options seem to be showing up in facets.


CS-FLFL-NI-PR-C0326-W33-S
CS-FLFL-NI-PR-C0326-W33-S

```
	return (
		<form className="w-[500px]" onSubmit={sub}>
			<ComboBox
				testId="combo"
				onKeyDown={(k) => {
					if (k.key === "Enter") {
						hiddenSubRef.current?.click();
					}
				}}
				onSelectionChange={(v) => {
					if (!v) return;

					const selectedItem = bundles?.find((b) => {
						return b.product.sku === v;
					});

					// TODO: throw an error
					if (!selectedItem) return;

					flushSync(() => {
						setPhrase(selectedItem.product.name);
					});
					hiddenSubRef.current?.click();
				}}
				inputValue={phrase}
				onInputChange={(v) => {
					setPhrase(v);
				}}
				allowsCustomValue
				className="text-surface-950"
				items={bundles?.map((item) => ({
					id: item.product.sku,
					name: item.product.name,
				}))}
			>
				{(item) => <ListBoxItem>{item.name}</ListBoxItem>}
			</ComboBox>
			<button type="submit" ref={hiddenSubRef} />
		</form>
	);
}

```


## Stock status indicator 
* does not seem to be aware of inventory in other carts