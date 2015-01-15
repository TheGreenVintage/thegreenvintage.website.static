
module Jekyll
  module FolderFilter

    def walk(input, pattern="*")
      full_path = File.join(@context.registers[:site].config['source'], input)
      Dir.glob("#{full_path}/#{pattern}").map do |e|
	File.join(input, File.basename(e)) if File.file? e
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::FolderFilter)
