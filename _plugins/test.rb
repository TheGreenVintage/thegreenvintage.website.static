module Jekyll
  class RemoteDataGenerator < Generator
    safe true

    def generate(site)
      dir = File.join('.', '_data')
      entries = Dir.chdir(dir) do
        Dir['*.{ini}'] + Dir['*'].select { |fn| File.directory?(fn) }
      end

      inis = entries.map { |e| File.join('_data', e) }

      ini_files = inis.map do |ini|
        ::IniParse.parse( File.read(ini) )
      end

      puts ini_files

      return
      site.config['remotes'].each do |key, url|
        puts "Fetching remote data for '#{url}' datasource..."
        res = open(url)

        if res.content_type == 'text/csv'
          data = CSV.new(res.body.force_encoding("utf-8").to_s, :headers => true).to_a.map {|row| row.to_hash }
        elsif res.content_type == 'text/yaml'

        end

        site.data[key] = data
      end
    end

    def open(url)
      Net::HTTP::get_response(URI.parse(url))
    end
  end
end
