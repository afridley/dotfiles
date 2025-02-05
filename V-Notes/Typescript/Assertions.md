```ts
/**
 * We assert that on offer pages the is_purina_perks is a boolean and not undefined
 **/
const isPurinaPerksAssertion: (isPurinaPerks: unknown) => asserts isPurinaPerks is boolean = (
  isPurinaPerks: unknown,
): asserts isPurinaPerks is boolean => {
  if (typeof isPurinaPerks !== 'boolean') {
    throw new Error(
      'Offer has been misconfigured or gql is no longer returning a required attribute and is missing the boolean is_purina_perks',
    );
  }
};

const OfferTemplate: React.FC<PageProps<DataProps>> = function ({ data: { node, translations } }) {
  const helmetProps = getHelmetPropsFromMetatagProps(node.metatag);
  const schemaMarkup = getJsonFromMetatagProps(node.metatag);
  // We assert in the case of offers that purina_perks is a boolean not undefined or we throw a misconfig error.
  isPurinaPerksAssertion(node.settings.is_purina_perks);

```