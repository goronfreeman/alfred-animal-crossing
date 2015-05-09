require_relative './nokogiri-master/lib/nokogiri'
require 'open-uri'
load 'alfred_feedback.rb'

music = ARGV.first
doc = Nokogiri::HTML(open('http://animalcrossing.wikia.com/wiki/' + music))

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
  title:        'Games',
  subtitle:     "#{data['Games']}",
  uid:          'gender',
  arg:          'http://animalcrossing.wikia.com/wiki/Animal_Crossing_(series)#Games',
  autocomplete: 'AC',
  icon:         {
    type:       'filetype',
    name:       'icon.png'
  }
)

feedback.add_item(
  title:        'Mood',
  subtitle:     "#{data['Mood']}",
  uid:          'gender',
  arg:          'http://animalcrossing.wikia.com/wiki/' + music,
  autocomplete: 'AC',
  icon:         {
    type:       'filetype',
    name:       'icon.png'
  }
)

feedback.add_item(
  title:        'Time',
  subtitle:     "#{data['Time']}",
  uid:          'gender',
  arg:          'http://animalcrossing.wikia.com/wiki/' + music,
  autocomplete: 'AC',
  icon:         {
    type:       'filetype',
    name:       'icon.png'
  }
)

feedback.add_item(
  title:        'Instruments',
  subtitle:     "#{data['Instruments']}",
  uid:          'gender',
  arg:          'http://animalcrossing.wikia.com/wiki/' + music,
  autocomplete: 'AC',
  icon:         {
    type:       'filetype',
    name:       'icon.png'
  }
)

feedback.add_item(
  title:        'Owned by',
  subtitle:     "#{data['Owned by']}",
  uid:          'gender',
  arg:          'http://animalcrossing.wikia.com/wiki/' + music,
  autocomplete: 'AC',
  icon:         {
    type:       'filetype',
    name:       'icon.png'
  }
)

puts feedback.to_xml
