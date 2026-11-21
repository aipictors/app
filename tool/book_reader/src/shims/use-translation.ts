/** アプリの言語設定（Flutter から渡す）に合わせる。日本語以外は英語 */
export const isEnglish = () =>
  (window as unknown as { __aipLang?: string }).__aipLang === "en"

export const useTranslation = () => (ja: string, en?: string) =>
  isEnglish() && en !== undefined ? en : ja
