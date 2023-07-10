export const getBVLocale = (locale: string) => {
  const locals: Record<string, string> = {
    en: 'en_US',
    es: 'es_US',
  };

  return locals[locale] || 'en_US';
};
