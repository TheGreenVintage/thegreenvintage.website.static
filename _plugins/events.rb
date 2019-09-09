module Jekyll

  class EventPage < Page
    def initialize(site, base, dir, event, locale, events)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'event_index.html')
      self.data['events'] = events
      self.data['event'] = event
      self.data['locale'] = locale
      self.data['title'] = event['title'][locale]
    end
  end

  class EventPageGenerator < Generator
    include Utils

    safe true

    def generate(site)
      if site.layouts.key? 'event_index'
        dir = site.config['event_dir'] || 'events'
        site.config['locales'].each do |locale_array|
          locale = locale_array.first
          events = site.data['events']
          events.each do |event|
            name = slugify(event['title'][locale], mode: 'latin')
            site.pages << EventPage.new(site, site.source, File.join(locale, dir, name), event, locale, events)
          end
        end
      end
    end
  end

end
