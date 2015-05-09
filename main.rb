require_relative './nokogiri-master/lib/nokogiri'
require 'open-uri'
load 'alfred_feedback.rb'

name = ARGV.first
# exit 1 unless code_from_user.length == 4
doc = Nokogiri::HTML(open('http://animalcrossing.wikia.com/wiki/' + name))

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
  title:        'Gender',
  subtitle:     "#{data['Gender']}",
  uid:          'animalcrossing',
  arg:          'http://animalcrossing.wikia.com/wiki/' + name,
  autocomplete: 'AC',
  icon:         {
    type:       'filetype',
    name:       'gender.png'
  }
)

feedback.add_item(
  title:        'Personality',
  subtitle:     "#{data['Personality']}",
  uid:          'animalcrossing',
  arg:          'http://animalcrossing.wikia.com/wiki/' + name,
  autocomplete: 'AC',
  icon:         {
    type:       'filetype',
    name:       'icon.png'
  }
)

feedback.add_item(
  title:        'Species',
  subtitle:     "#{data['Species']}",
  uid:          'animalcrossing',
  arg:          'http://animalcrossing.wikia.com/wiki/' + name,
  autocomplete: 'AC',
  icon:         {
    type:       'filetype',
    name:       'icon.png'
  }
)

feedback.add_item(
  title:        'Birthday',
  subtitle:     "#{data['Birthday']}",
  uid:          'animalcrossing',
  arg:          'http://animalcrossing.wikia.com/wiki/' + name,
  autocomplete: 'AC',
  icon:         {
    type:       'filetype',
    name:       'birthday.png'
  }
)

feedback.add_item(
  title:        'Star sign',
  subtitle:     "#{data['Star sign']}",
  uid:          'animalcrossing',
  arg:          'http://animalcrossing.wikia.com/wiki/' + name,
  autocomplete: 'AC',
  icon:         {
    type:       'filetype',
    name:       'icon.png'
  }
)

feedback.add_item(
  title:        'Initial phrase',
  subtitle:     "#{data['Initial phrase']}",
  uid:          'animalcrossing',
  arg:          'http://animalcrossing.wikia.com/wiki/' + name,
  autocomplete: 'AC',
  icon:         {
    type:       'filetype',
    name:       'icon.png'
  }
)

feedback.add_item(
  title:        'Initial clothes',
  subtitle:     "#{data['Initial clothes']}",
  uid:          'animalcrossing',
  arg:          'http://animalcrossing.wikia.com/wiki/' + name,
  autocomplete: 'AC',
  icon:         {
    type:       'filetype',
    name:       'icon.png'
  }
)

feedback.add_item(
  title:        'Skill',
  subtitle:     "#{data['Skill']}",
  uid:          'animalcrossing',
  arg:          'http://animalcrossing.wikia.com/wiki/' + name,
  autocomplete: 'AC',
  icon:         {
    type:       'filetype',
    name:       'icon.png'
  }
)

feedback.add_item(
  title:        'Goal',
  subtitle:     "#{data['Goal']}",
  uid:          'animalcrossing',
  arg:          'http://animalcrossing.wikia.com/wiki/' + name,
  autocomplete: 'AC',
  icon:         {
    type:       'filetype',
    name:       'icon.png'
  }
)

feedback.add_item(
  title:        'Coffee',
  subtitle:     "#{data['Coffee']}",
  uid:          'animalcrossing',
  arg:          'http://animalcrossing.wikia.com/wiki/' + name,
  autocomplete: 'AC',
  icon:         {
    type:       'filetype',
    name:       'icon.png'
  }
)

feedback.add_item(
  title:        'Style',
  subtitle:     "#{data['Style']}",
  uid:          'animalcrossing',
  arg:          'http://animalcrossing.wikia.com/wiki/' + name,
  autocomplete: 'AC',
  icon:         {
    type:       'filetype',
    name:       'icon.png'
  }
)

feedback.add_item(
  title:        'Favorite song',
  subtitle:     "#{data['Favorite song']}",
  uid:          'animalcrossing',
  arg:          'http://animalcrossing.wikia.com/wiki/' + name,
  autocomplete: 'AC',
  icon:         {
    type:       'filetype',
    name:       'icon.png'
  }
)

feedback.add_item(
  title:        'Appearances',
  subtitle:     "#{data['Appearances']}",
  uid:          'animalcrossing',
  arg:          'http://animalcrossing.wikia.com/wiki/' + name,
  autocomplete: 'AC',
  icon:         {
    type:       'filetype',
    name:       'icon.png'
  }
)

feedback.add_item(
  title:        'Regional names',
  subtitle:     "#{data['Regional names']}",
  uid:          'animalcrossing',
  arg:          'http://animalcrossing.wikia.com/wiki/' + name,
  autocomplete: 'AC',
  icon:         {
    type:       'filetype',
    name:       'icon.png'
  }
)

puts feedback.to_xml

# puts data

# Gender
# Personality
# Species
# Birthday
# Star sign
# Initial phrase
# Initial clothes
# Skill
# Goal
# Coffee
# Style
# Favorite song
# Appearances
# Regional names
