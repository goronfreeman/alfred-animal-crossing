require_relative './nokogiri-master/lib/nokogiri'
require 'open-uri'
load 'alfred_feedback.rb'

painting = ARGV.first
doc = Nokogiri::HTML(open('http://animalcrossing.wikia.com/wiki/' + painting))

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
  title:        'Real name',
  subtitle:     "#{data['Real name']}",
  uid:          'gender',
  arg:          'http://animalcrossing.wikia.com/wiki/' + painting,
  autocomplete: 'AC',
  icon:         {
    type:       'filetype',
    name:       'icon.png'
  }
)

feedback.add_item(
  title:        'Artist',
  subtitle:     "#{data['Artist']}",
  uid:          'gender',
  arg:          'http://animalcrossing.wikia.com/wiki/' + painting,
  autocomplete: 'AC',
  icon:         {
    type:       'filetype',
    name:       'icon.png'
  }
)

feedback.add_item(
  title:        'Appearances',
  subtitle:     "#{data['Appearances']}",
  uid:          'gender',
  arg:          'http://animalcrossing.wikia.com/wiki/Animal_Crossing_(series)#Games',
  autocomplete: 'AC',
  icon:         {
    type:       'filetype',
    name:       'icon.png'
  }
)

puts feedback.to_xml
