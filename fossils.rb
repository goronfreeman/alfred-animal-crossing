require_relative './nokogiri-master/lib/nokogiri'
require 'open-uri'
load 'alfred_feedback.rb'

fossil = ARGV.first
doc = Nokogiri::HTML(open('http://animalcrossing.wikia.com/wiki/' + fossil))

table = doc.css('#WikiaArticle table')
rows = table.css('tr')
data = {}

rows.each do |r|
  columns = r.css('td')
  if columns.length == 2
    data[columns[0].content.lstrip.chomp] = columns[1].content.lstrip.chomp
  end
end

feedback = Feedback.new
feedback.add_item(
  title:        'Scientific name',
  subtitle:     "#{data['Scientific name']}",
  uid:          'gender',
  arg:          'http://animalcrossing.wikia.com/wiki/' + fossil,
  autocomplete: 'AC',
  icon:         {
    type:       'filetype',
    name:       'icon.png'
  }
)

feedback.add_item(
  title:        'Period',
  subtitle:     "#{data['Period']}",
  uid:          'gender',
  arg:          'http://animalcrossing.wikia.com/wiki/' + fossil,
  autocomplete: 'AC',
  icon:         {
    type:       'filetype',
    name:       'icon.png'
  }
)

feedback.add_item(
  title:        'Sections',
  subtitle:     "#{data['Sections']}",
  uid:          'gender',
  arg:          'http://animalcrossing.wikia.com/wiki/' + fossil,
  autocomplete: 'AC',
  icon:         {
    type:       'filetype',
    name:       'icon.png'
  }
)

feedback.add_item(
  title:        'Length',
  subtitle:     "#{data['Length']}",
  uid:          'gender',
  arg:          'http://animalcrossing.wikia.com/wiki/' + fossil,
  autocomplete: 'AC',
  icon:         {
    type:       'filetype',
    name:       'icon.png'
  }
)

feedback.add_item(
  title:        'Price',
  subtitle:     "#{data['Price']}",
  uid:          'gender',
  arg:          'http://animalcrossing.wikia.com/wiki/' + fossil,
  autocomplete: 'AC',
  icon:         {
    type:       'filetype',
    name:       'icon.png'
  }
)

puts feedback.to_xml
