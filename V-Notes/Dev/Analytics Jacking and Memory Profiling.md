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

Profile memory
```javascript
Array.from(document.querySelectorAll('*'))
  .reduce(function(pre, dom){
    var evtObj = getEventListeners(dom)
    Object.keys(evtObj).forEach(function (evt) {
      if (typeof pre[evt] === 'undefined') {
        pre[evt] = 0
      }
      pre[evt] += evtObj[evt].length
    })
    return pre
  }, {})
```
