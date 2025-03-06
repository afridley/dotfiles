```ts
const [, updateState] = React.useState();
const forceUpdate = React.useCallback(() => updateState({}), []);
```


```ts
const [, forceUpdate] = useReducer(x => x + 1, 0);
```
