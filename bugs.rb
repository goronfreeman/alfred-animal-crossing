require_relative './nokogiri-master/lib/nokogiri'
require 'open-uri'
load 'alfred_feedback.rb'

bug = ARGV.first
doc = Nokogiri::HTML(open('http://animalcrossing.wikia.com/wiki/' + bug))

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
  arg:          'http://animalcrossing.wikia.com/wiki/' + bug,
  autocomplete: 'AC',
  icon:         {
    type:       'filetype',
    name:       'icon.png'
  }
)

feedback.add_item(
  title:        'Family',
  subtitle:     "#{data['Family']}",
  uid:          'gender',
  arg:          'http://animalcrossing.wikia.com/wiki/' + bug,
  autocomplete: 'AC',
  icon:         {
    type:       'filetype',
    name:       'icon.png'
  }
)

feedback.add_item(
  title:        'Time of year',
  subtitle:     "#{data['Time of year']}",
  uid:          'gender',
  arg:          'http://animalcrossing.wikia.com/wiki/' + bug,
  autocomplete: 'AC',
  icon:         {
    type:       'filetype',
    name:       'icon.png'
  }
)

feedback.add_item(
  title:        'Time of day',
  subtitle:     "#{data['Time of day']}",
  uid:          'gender',
  arg:          'http://animalcrossing.wikia.com/wiki/' + bug,
  autocomplete: 'AC',
  icon:         {
    type:       'filetype',
    name:       'icon.png'
  }
)

feedback.add_item(
  title:        'Location',
  subtitle:     "#{data['Location']}",
  uid:          'gender',
  arg:          'http://animalcrossing.wikia.com/wiki/' + "#{data['Location']}",
  autocomplete: 'AC',
  icon:         {
    type:       'filetype',
    name:       'icon.png'
  }
)

feedback.add_item(
  title:        'Size',
  subtitle:     "#{data['Size']}",
  uid:          'gender',
  arg:          'http://animalcrossing.wikia.com/wiki/' + bug,
  autocomplete: 'AC',
  icon:         {
    type:       'filetype',
    name:       'icon.png'
  }
)

feedback.add_item(
  title:        'Catch size',
  subtitle:     "#{data['Catch size']}",
  uid:          'gender',
  arg:          'http://animalcrossing.wikia.com/wiki/' + bug,
  autocomplete: 'AC',
  icon:         {
    type:       'filetype',
    name:       'icon.png'
  }
)

feedback.add_item(
  title:        'Shadow size',
  subtitle:     "#{data['Shadow size']}",
  uid:          'gender',
  arg:          'http://animalcrossing.wikia.com/wiki/' + bug,
  autocomplete: 'AC',
  icon:         {
    type:       'filetype',
    name:       'icon.png'
  }
)

feedback.add_item(
  title:        'Rarity',
  subtitle:     "#{data['Rarity']}",
  uid:          'gender',
  arg:          'http://animalcrossing.wikia.com/wiki/' + bug,
  autocomplete: 'AC',
  icon:         {
    type:       'filetype',
    name:       'icon.png'
  }
)

feedback.add_item(
  title:        'Sale price',
  subtitle:     "#{data['Sale price']}",
  uid:          'gender',
  arg:          'http://animalcrossing.wikia.com/wiki/' + bug,
  autocomplete: 'AC',
  icon:         {
    type:       'filetype',
    name:       'icon.png'
  }
)

puts feedback.to_xml
