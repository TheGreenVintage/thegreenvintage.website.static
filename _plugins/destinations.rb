module Jekyll

  class DestinationPage < Page
    def initialize(site, base, dir, destination, locale, destinations)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'destination_index.html')
      self.data['destinations'] = destinations
      self.data['destination'] = destination
      self.data['locale'] = locale
      self.data['title'] = destination['name'][locale]
    end
  end

  class DestinationPageGenerator < Generator
    safe true

    def generate(site)
      if site.layouts.key? 'destination_index'
        dir = site.config['destination_dir'] || 'destinations'
        site.config['locales'].each do |locale_array|
          locale = locale_array.first
          destinations = site.data['destinations']
          destinations.each do |destination|
            name = Utils.slugify(destination['name'][locale])
            site.pages << DestinationPage.new(site, site.source, File.join(locale, dir, name), destination, locale, destinations)
          end
        end
      end
    end
  end

end
