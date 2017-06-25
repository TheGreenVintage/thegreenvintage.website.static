require "dato"
require "pp"
require "csv"
require "jekyll"

def transform(localized, ignored, booleanized, floatized, data)
  locales = %w(es en ca)

  data.map do |item|
    localized.each do |field|

      item[field] = {}

      locales.each do |locale|
        item[field][locale] = item["#{field}_#{locale}"]
        item.delete("#{field}_#{locale}")
      end
    end

    booleanized.each do |field|
      item[field] = item[field].present?
    end

    floatized.each do |field|
      item[field] = item[field].to_f
    end

    item.except(*ignored)
  end
end

client = Dato::Site::Client.new(ENV['DATO_API_TOKEN'])

pp client.item_types.all


employees = CSV.read('./_data/employees.csv', {
  :headers  => true,
  :encoding => Jekyll.configuration["encoding"],
}).map(&:to_hash)

#transform(%w(skills description), %w(photo), employees).each do |item|
#  dato = item.merge(item_type: "11289")
#
#  client.items.create(dato)
#end

activities = CSV.read('./_data/activities.csv', {
  :headers  => true,
  :encoding => Jekyll.configuration["encoding"],
}).map(&:to_hash)

# photo1,photo2,photo3,tag,duration,pax,price,language,accesibility,destination,selected,title_ca,description_ca,localization_ca,included_ca,not_included_ca,title_es,description_es,localization_es,included_es,not_included_es,title_en,description_en,localization_en,included_en,not_included_en,contact_ca,contact_es,contact_en
# transform(%w(title description localization included not_included contact), %w(photo1 photo2 photo3), %w(selected), %w(duration), activities).each do |item|
#   dato = item.merge(item_type: "11375")
# 
#   puts dato
# 
#   client.items.create(dato)
# end

destinations = CSV.read('./_data/destinations.csv', {
  :headers  => true,
  :encoding => Jekyll.configuration["encoding"],
}).map(&:to_hash)

#venues_title_ca,venues_title_es,venues_title_en,venues_description_ca,venues_description_es,venues_description_en,activities_title_ca,activities_title_es,activities_title_en,activities_description_ca,activities_description_es,activities_description_en,video,message_short_ca,message_short_es,message_short_en,brochure_file_ca,brochure_file_es,brochure_file_en,download_brochure_ca,download_brochure_es,download_brochure_en

#transform(%w(name intro title description venues_title venues_description activities_title activities_description brochure_file download_brochure message message_short), %w(photo key), destinations).each do |item|
#  dato = item.merge(item_type: "11374")
#
#  client.items.create(dato)
#end
