module Jekyll
  module FolderFilter

    def walk(input, pattern="*")
      full_path = File.join(@context.registers[:site].config['source'], input)
      files = Dir.glob("#{full_path}/#{pattern}").map do |e|
        File.join(input, File.basename(e)) if File.file? e
      end.sort_by { |x| x[/\d+/].to_i }
      puts "Searching files in: '#{full_path}'... (found: #{files.size} items)"
      files
    end
  end
end

Liquid::Template.register_filter(Jekyll::FolderFilter)
