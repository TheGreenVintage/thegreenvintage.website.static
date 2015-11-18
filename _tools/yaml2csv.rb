#!/bin/ruby

require 'csv'
require 'yaml'

yml = YAML.load_file('./ca.yml')
translations = {}

def process_hash(translations, current_key, hash)
  hash.each do |new_key, value|
    combined_key = [current_key, new_key].delete_if { |k| k == '' }.join(".")
    if value.is_a?(Hash)
      process_hash(translations, combined_key, value)
    else
      translations[combined_key] = value
    end
  end
end

process_hash(translations, '', yml['ca'])

csv_string = CSV.generate do |csv|
  csv << ["key", "ca", "es", "en"]
  translations.each do |key, value|
    csv << [key, value]
  end
end

File.open("ca.csv", 'w') do |f|
  f.write csv_string
end
