require 'byebug'

module Jekyll

  class LandingPage < Page
    def initialize(site, base, dir, landing, locale)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'landing_index.html')
      self.data['landing'] = landing
      self.data['title'] = landing['main_title']
      self.data['locale'] = locale
    end
  end

  class LandingPageGenerator < Generator
    include Utils

    safe true

    def generate(site)
      if site.layouts.key? 'landing_index'
        landings = site.data['landings']
        landings.each do |landing|
          locale = 'es' # TODO
          name = slugify(landing['main_title'], mode: 'latin')
          site.pages << LandingPage.new(site, site.source, File.join(locale, name), landing, locale)
        end
      end
    end
  end

end
