`terminus drush purina-h20.dev -- sdc node 10052` set dc
`terminus drush purina-h20.dev cr ` clear cache


```
const MountedAccordionContent = React.forwardRef<
  React.ElementRef<typeof AccordionPrimitive.Content>,
  React.ComponentPropsWithoutRef<typeof AccordionPrimitive.Content>
>(({ className, children, ...props }, ref) => {
  const stylesTv = pdsTv({ base: 'pds-pb-4 pds-pt-0' });
  const innerRef = React.useRef<HTMLDivElement>(null);
  const itemValue = innerRef.current?.parentElement?.parentElement?.getAttribute('data-value');
  const context = React.useContext(AccordionContext);
  const isOpen = itemValue === context.isOpen;

  const accordionContentTv = pdsTv({
    base: 'pds-overflow-hidden pds-text-body-md pds-transition-all',
    variants: {
      forceMount: {
        // true: '',
        true: 'data-[state=closed]:pds-max-h-0 data-[state=open]:pds-max-h-[--radix-accordion-content-height]',
      },
    },
  });
  return (
    <AccordionPrimitive.Content
      ref={ref}
      forceMount={true}
      style={{ height: isOpen ? innerRef.current?.clientHeight : 0 }}
      className={accordionContentTv()}
      {...props}
    >
      <div ref={innerRef} className={stylesTv({ className })}>
        {children}
      </div>
    </AccordionPrimitive.Content>
  );
});

```