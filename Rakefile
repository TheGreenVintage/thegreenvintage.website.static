require 'open-uri'

I18N_FILE = "https://docs.google.com/spreadsheets/d/e/2PACX-1vSSl8MxVlbv1b9IbkQXcHVmyGFNMFzFEMKk4cabvb0qIcBkBro3Vg2Wfslwg8DlRYZdltb9FYo3DHl7/pub?gid=0&single=true&output=csv"
DATA_FILES = {
  destinations: "https://docs.google.com/spreadsheets/d/1DXPTtb1tN-4HCwsLhMGICMxQrg8b28w1CnMAhT90rFo/pub?gid=1539468359&single=true&output=csv",
  activities: "https://docs.google.com/spreadsheets/d/1DXPTtb1tN-4HCwsLhMGICMxQrg8b28w1CnMAhT90rFo/pub?gid=802183433&single=true&output=csv",
  employees: "https://docs.google.com/spreadsheets/d/1DXPTtb1tN-4HCwsLhMGICMxQrg8b28w1CnMAhT90rFo/pub?gid=261678603&single=true&output=csv",
  home: "https://docs.google.com/spreadsheets/d/1DXPTtb1tN-4HCwsLhMGICMxQrg8b28w1CnMAhT90rFo/pub?gid=125310584&single=true&output=csv",
}

def download(url, path)
  open(url) {|f|
    File.open(path,"wb") do |file|
      file.puts f.read.gsub(/\r\n/, "\n")
    end
  }
end

task :i18n do
  puts "Downloading i18n files..."

  open(I18N_FILE) do |file|
    puts file.read
  end
end

task :data do
  puts "Downloading data files..."
  DATA_FILES.each do |key, value|
    download(value, "_data/#{key}.csv")
  end
end
