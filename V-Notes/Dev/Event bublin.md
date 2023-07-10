```ts
window.addEventListener(
  'click',
  function (event) {
    if (event.target?.classList?.contains('js-track') || event.target?.closest('.js-track')) {
      const eventTarget = event.target as HTMLAnchorElement;
      const stopPoints: IStopPoint[] = [];
      const keyTarget = eventTarget?.classList?.contains('js-track')
        ? eventTarget
        : eventTarget.closest('.js-track');
      let el: any = eventTarget.closest('.js-track-stop-point');

      while (el) {
        if (el?.classList?.contains('js-track-stop-point')) {
          const type = el.getAttribute('data-type') || ''; // page, module, component
          const pageType = el.getAttribute('data-page-type') || '';
          const typeLabel = el.getAttribute('data-type-label') || '';
          const label = el.getAttribute('data-label') || ''; // Component Testing for Analytics, 'Page title component'
          const title = el.getAttribute('data-title') || '';
          const siblingArray = Array.from(el.parentNode?.children || []);
          const index = siblingArray.indexOf(el);
          const totalSiblings = siblingArray.length;

          stopPoints.push({
            type: type as 'page' | 'module' | 'component',
            label,
            typeLabel,
            title,
            pageType,
            index,
            totalSiblings,
          });
        }
        el = el.parentNode;
      }

      // console.group('GA event test logging');
      // console.log({ event });
      // console.log({ eventTarget });
      // console.log({ stopPoints });
      // console.log({ keyTarget });
      // console.log({ el });
      // console.groupEnd();
      generateGaEvent(stopPoints, keyTarget);
    }
  },

  true
);

```