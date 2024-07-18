```ts
const originalPush = dataLayer.push
dataLayer.push = function(event) {
    // notify here
    console.log('dataLayer.push was called');
    console.log(event)
    
    originalPush(event);
}
```
```ts
const originalBeacon = navigator.sendBeacon
navigator.sendBeacon = function(url, data) {
    console.log("Hooked sendBeacon", { url, data });
    return originalSendBeacon.apply(this, arguments);
};
```
