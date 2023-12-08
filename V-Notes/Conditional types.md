here is a simpler solution. No need to rely on [`any`](https://www.typescriptlang.org/docs/handbook/2/everyday-types.html#any) or complex [conditional types](https://www.typescriptlang.org/docs/handbook/2/conditional-types.html) [(see answer)](https://stackoverflow.com/a/49725198/5669456):

> 1. Is there a way to require component or click to be set? _(Inclusive `OR`)_

```javascript
type MenuItemOr = {
    title: string;
    icon: string;
} & ({ component: object } | { click: boolean }) 
// brackets are important here: "&" has precedence over "|"

let testOr: MenuItemOr;
testOr = { title: "t", icon: "i" } // error, none are set
testOr = { title: "t", icon: "i", component: {} } // ✔
testOr = { title: "t", icon: "i", click: true } // ✔
testOr = { title: "t", icon: "i", click: true, component: {} } // ✔
```

A [union type](https://www.typescriptlang.org/docs/handbook/2/everyday-types.html#union-types) (`|`) corresponds to inclusive `OR`. It is [intersected](https://www.typescriptlang.org/docs/handbook/2/objects.html#intersection-types) with the non-conditional properties.

Use the [`in`](https://www.typescriptlang.org/docs/handbook/2/narrowing.html#the-in-operator-narrowing) operator to [narrow](https://www.typescriptlang.org/docs/handbook/2/narrowing.html) the value back to one of the constituents:

```javascript
if ("click" in testOr) testOr.click // works 
```

> 2. Is there a way to require that both properties can't be set? _(Exclusive `OR` / `XOR`)_

```javascript
type MenuItemXor = {
    title: string;
    icon: string;
} & (
        | { component: object; click?: never }
        | { component?: never; click: boolean }
    )

let testXor: MenuItemXor;
testXor = { title: "t", icon: "i" } // error, none are set
testXor = { title: "t", icon: "i", component: {} } // ✔
testXor = { title: "t", icon: "i", click: true } // ✔
testXor = { title: "t", icon: "i", click: true, component: {} } //error,both set
```

Basically _either_ `component` _or_ `click` can be set, the other should [never 1](https://www.typescriptlang.org/docs/handbook/basic-types.html#never) be added at the same time. TS can make a [discriminated union type](https://www.typescriptlang.org/docs/handbook/advanced-types.html#discriminated-unions) out of `MenuItemXor`, which corresponds to `XOR`.

This `XOR` condition for `MenuItemXor` is not possible with [accepted answer](https://stackoverflow.com/a/40510700/5669456).




## Very useful what ive done
```ts
export enum TokenTypes {
  id = 'id',
  access = 'access',
  refresh = 'refresh'
}

type OType<T> =
  T extends TokenTypes.id ? ICognitoIDUser :
  T extends TokenTypes.access ? {[key: string]: any} :
  any

export async function getToken<T extends TokenTypes>(type: T): Promise<OType<T>> {
  const session = await Auth.currentSession()
  if (type === TokenTypes.id) return session.getIdToken().payload as OType<T>
  if (type === TokenTypes.access) return session.getAccessToken().payload as OType<T>
  return session.getRefreshToken() as OType<T>
}


```
Used below
```ts
getToken(TokenTypes.id).then((res) => getPets(res?.ansiraId))
```
