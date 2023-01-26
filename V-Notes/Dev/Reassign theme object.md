```ts
export const createTheme = (
  theme: any,
  obj: any,
  cssObj: any,
  themeString: any,
  parentKey?: any
) => {
  for (const [key, value] of Object.entries(theme)) {
    if (!value) return;
    if (typeof value === 'object') {
      console.log('its an o', `${key}: ${value}`);
      console.log({ value });
      createTheme(value, obj, cssObj, themeString, key);
    }

    if (typeof value === 'string') {
      if (parentKey) {
        cssObj[`--${themeString}-${parentKey}-${key}`] = value;
        obj[parentKey][key] = `var(--${themeString}-${parentKey}-${key})`;
        console.log({ parentKey });
      } else {
        cssObj[`--${themeString}-${key}`] = value;
        obj[parentKey] = `var(--${themeString}-${key})`;
        console.log('its an s', `${key}: ${value}`);
      }
    }
  }
};
```

```ts
export const themeCss = {};
const darkTheme = { ...dark };
createTheme(dark, darkTheme, themeCss, 'dark');

const lightTheme = { ...light };
createTheme(light, lightTheme, themeCss, 'light');

const neutralTheme = { ...neutral };
createTheme(neutral, neutralTheme, themeCss, 'neutral');

console.log({ dark });
```