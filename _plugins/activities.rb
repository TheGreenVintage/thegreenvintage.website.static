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
      self.data['title'] = activity["title_#{locale}"]
    end
  end

  class ActivityPageGenerator < Generator
    safe true

    def generate(site)
      if site.layouts.key? 'activity_index'
        dir = site.config['activity_dir'] || 'activities'
        site.config['locales'].each do |locale_array|
          locale = locale_array.first
          activities = site.data['activities']
          activities.each do |activity|
            name = Utils.slugify(activity["title_#{locale}"])
            site.pages << ActivityPage.new(site, site.source, File.join(locale, dir, name), activity, locale, activities)
          end
        end
      end
    end
  end

end
