#!/bin/ruby

require 'csv'
require 'yaml'

master = 'ca'
locales = Dir['_locales/*.yml'].map do |f|
  YAML.load_file(f)
end

master_locale = locales.select do |locale|
  !locale[master].nil?
end.first

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

process_hash(translations, '', master_locale[master])

csv_string = CSV.generate do |csv|
  # Header
  row = locales.map do |locale|
    locale.keys.first
  end

  row.unshift('key')
  csv << row

  # Values
  translations.each do |key, value|
    row = locales.map do |locale|
      name = locale.keys.first
      trols = {}
      process_hash(trols, '', locale[name]) # This is insane, I know...
      trols[key]
    end

    row.unshift(key)
    csv << row
  end
end

File.open("ca.csv", 'w') do |f|
  f.write csv_string
end
