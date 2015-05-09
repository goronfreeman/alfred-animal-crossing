require_relative './lib/nokogiri'
require 'open-uri'

lastName = ARGV.first
doc = Nokogiri::HTML(open('http://animalcrossing.wikia.com/wiki/' + lastName))

table = doc.css('#WikiaArticle table')

rows = table.css('tr')

data = {}

rows.each do |r|
  columns = r.css('td')
  if columns.length == 2
    data[columns[0].content.strip] = columns[1].content.strip
  end
end

print data
