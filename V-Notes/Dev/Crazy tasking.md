```ts
export function serial<T, E>(tasks: Array<task.Task<T, E>>, timer: task.Timer) {
	return tasks.reduce<task.Task<Array<T>, E>>((acc, t) => {
		return acc.andThen((x) => {
			return timer.andThen(() => {
				return t.map((res) => [...x, res]);
			});
		});
	}, task.resolve([]));
}

export function serial2<T, E>(
	tasks: Array<() => task.Task<T, E>>,
	timer: number,
	trailing: boolean = true,
) {
	let pipe: task.Task<Array<T>, E> = task.resolve([]);
	for (const t of tasks) {
		pipe = pipe.andThen((acc) => {
			if (trailing) {
				return t()
					.map((t) => [...acc, t])
					.orElse((err) => {
						logger.error(err as string);
						return task.resolve(acc);
					})
					.andThen((acc) => task.timer(timer).map(() => acc));
			} else {
				return task
					.timer(timer)
					.andThen(t)
					.map((t) => [...acc, t])
					.orElse((err) => {
						logger.error(err as string);
						return task.resolve(acc);
					});
			}
		});
	}
	return pipe;
}

export function findNewPackages(
	activePackages: Parameters<typeof findUniqueProductIdTags>[0],
) {
	const uniqueProductIdTags = findUniqueProductIdTags(activePackages);
	const x = [];
	
	// Option 1 piping
	let pipe = task.resolve([] as Array<Package>);

	for (const [productIdTag, packs] of uniqueProductIdTags) {
		pipe = pipe.andThen((previousePacks) =>
			task.timer(1_000).andThen(() => {
				return (
					getItemReceiptByFilterTask({
						query: { filter: `productIdTag eq "${productIdTag}"` },
					})
						// TODO: add .andThen with a parserFor to prevent the non-null assertion
						.map((final) => {
							const itemReceiptArray = final.data!;
							// If the entire tag was not found push all products as new
							if (itemReceiptArray.length === 0) {
								logger.info(
									`Info plus has no itemReciepts with productIdTag ${productIdTag}, adding all in batch`,
								);
								return packs;
							}

							// If the product id tag exists in IP,
							// one product in this batch might exist in IP, so check for presence
							const batchMap = new Map<string, ItemReceipt>();
							for (const prod of itemReceiptArray) {
								if (prod.prodLot) {
									batchMap.set(prod.prodLot, prod);
								}
							}

							const newPacks = [];
							for (const pack of packs) {
								if (!pack.Label) continue;

								// TODO: Consider if logging can be externalized with .inspect
								logger.info(`Checking if ${pack.Label} exists in info-plus`);
								const found = batchMap.get(pack.Label);

								if (!found) {
									logger.info(`adding new package ${pack.Label}`);
									newPacks.push(pack);
								}
							}
							return [...previousePacks, ...newPacks];
						})
						.orElse((err) => {
							logger.error(err);
							return task.resolve(previousePacks);
						})
				);
			}),
		);
	}

// option to push to task array
	for (const [productIdTag, packs] of uniqueProductIdTags) {
		x.push(() =>
			getItemReceiptByFilterTask({
				query: { filter: `productIdTag eq "${productIdTag}"` },
			})
				// TODO: add .andThen with a parserFor to prevent the non-null assertion
				.map((final) => {
					const itemReceiptArray = final.data!;
					// If the entire tag was not found push all products as new
					if (itemReceiptArray.length === 0) {
						logger.info(
							`Info plus has no itemReciepts with productIdTag ${productIdTag}, adding all in batch`,
						);
						return packs;
					}

					// If the product id tag exists in IP,
					// one product in this batch might exist in IP, so check for presence
					const batchMap = new Map<string, ItemReceipt>();
					for (const prod of itemReceiptArray) {
						if (prod.prodLot) {
							batchMap.set(prod.prodLot, prod);
						}
					}

					const newPacks = [];
					for (const pack of packs) {
						if (!pack.Label) continue;

						// TODO: Consider if logging can be externalized with .inspect
						logger.info(`Checking if ${pack.Label} exists in info-plus`);
						const found = batchMap.get(pack.Label);

						if (!found) {
							logger.info(`adding new package ${pack.Label}`);
							newPacks.push(pack);
						}
					}
					return newPacks;
				}),
		);
	}

	
	const c = serial2(x, 1000, false);
	const z = serialAllSettled2(x, 1000, false);
	const y = serialAllSettled(x, 1000, false);

	logger.error("Lets nuke");
	return y;
}

// MORE FUNCS
export const delay = async (ms: number): Promise<void> =>
	new Promise((resolve) => {
		setTimeout(resolve, ms);
	});

export function serialAllSettled2<T, E>(
	tasks: Array<() => task.Task<T, E>>,
	ms: number,
	/**
	 * @description
	 */
	trailing = true,
) {
	// eslint-disable-next-line @typescript-eslint/no-misused-promises
	return new task.Task<Array<T>, E>(async (res) => {
		const settled: Array<T> = [];

		for (const makeTask of tasks) {
			if (!trailing) {
				await delay(ms);
			}

			const curr = makeTask();
			const res = await curr;

			if (res.isOk) {
				settled.push(res.value);
			}

			if (trailing) {
				await delay(ms);
			}
		}

		res(settled);
	});
}

export function serialAllSettled<T, E>(
	tasks: Array<() => task.Task<T, E>>,
	ms: number,
	/**
	 * @description
	 */
	trailing = true,
): task.Task<Array<task.Task<T, E>>, never> {
	const total = tasks.length;
	const settled = Array.from<ReturnType<(typeof tasks)[number]>>({
		length: total,
	});

	// eslint-disable-next-line @typescript-eslint/no-misused-promises
	return new task.Task(async (res) => {
		for (const [index, t] of tasks.entries()) {
			if (trailing) {
				settled[index] = await t();
				await delay(ms);
			} else {
				await delay(ms);
				settled[index] = await t();
			}
		}
		res(settled);
	});
}

```

Ex