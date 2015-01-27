module Jekyll
  module CdnFilter
    def cdn(input)
      site = @context.registers[:site]
      site.config['env'] = ENV['JEKYLL_ENV'] || 'development'
      server = ''
      server = site.config['cdn'] if site.config['env'] == 'production'
      server = "//#{server}" unless server.empty?
      "#{server}/#{input}"
    end
  end
end

Liquid::Template.register_filter(Jekyll::CdnFilter)
