module Jekyll

  class ActivityPage < Page
    def initialize(site, base, dir, activity, locale, activities)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'activity_index.html')
      self.data['activities'] = activities
      self.data['activity'] = activity
      self.data['locale'] = locale
      self.data['title'] = activity['title'][locale]
    end
  end

  class ActivityPageGenerator < Generator
    include Utils

    safe true

    def generate(site)
      Translations.load_translations

      if site.layouts.key? 'activity_index'
        site.config['locales'].each do |locale_array|
          locale = locale_array.first
          dir = slugify(I18n.t('teambuilding.title', locale: locale), mode: 'latin')
          activities = site.data['activities']
          activities.each do |activity|
            name = slugify(activity['title'][locale], mode: 'latin')
            site.pages << ActivityPage.new(site, site.source, File.join(locale, dir, name), activity, locale, activities)
          end
        end
      end
    end
  end

end
