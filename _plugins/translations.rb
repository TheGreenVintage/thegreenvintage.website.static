module Translations
  def self.load_translations
    if I18n.backend.send(:translations).empty?
      I18n.available_locales = [:en, :es ,:ca]
      I18n.backend.load_translations '_locales/en.yml'
      I18n.backend.load_translations '_locales/es.yml'
      I18n.backend.load_translations '_locales/ca.yml'
      I18n.config.enforce_available_locales = false
      I18n.locale = LOCALE
    end
  end
end
