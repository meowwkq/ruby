require 'nokogiri'
require 'open-uri'
require 'csv'
require 'net/http'

# Parsing the main link
main_link = URI.parse('https://www.hospitalsafetygrade.org/all-hospitals')
write_data = []

# Using Net::HTTP to fetch HTML content
response = Net::HTTP.get_response(main_link)
doc = Nokogiri::HTML(response.body)

# Extracting hospital links
doc.css('#BlinkDBContent_849210 > ul > li > a').each_with_index do |link, i|
  # Using URI.join to determine the absolute URL
  location_link = URI.join(main_link, link["href"])
  location_document = Nokogiri::HTML(Net::HTTP.get(location_link))

  data = [i, link.content.strip]

  # Extracting hospital location
  location = location_document.css("#SearchResults > div.resultsList > div > div.detailWrapper > div.address")

  if location
    address_text = location.text.strip
    address_lines = address_text.split("\n")
    address = address_lines[0..1].join(" ")
    data << address
  else
    puts "Error during processing"
    data << "Address not found"
  end

  write_data << data
  break if i == 20
  sleep(2)
end

# Writing data to a CSV file
CSV.open("myfile2.csv", "w") do |csv|
  csv << ["ID", "Name", "Location"]
  write_data.each do |data|
    csv << data
  end
end
