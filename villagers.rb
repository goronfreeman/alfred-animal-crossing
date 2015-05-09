require_relative './nokogiri-master/lib/nokogiri'
require 'open-uri'
load 'alfred_feedback.rb'

villager = ARGV.first
doc = Nokogiri::HTML(open('http://animalcrossing.wikia.com/wiki/' + villager))

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
  uid:          'gender',
  arg:          'http://animalcrossing.wikia.com/wiki/' + villager,
  autocomplete: 'AC',
  icon:         {
    type:       'filetype',
    name:       'icon.png'
  }
)

feedback.add_item(
  title:        'Personality',
  subtitle:     "#{data['Personality']}",
  uid:          'personality',
  arg:          'http://animalcrossing.wikia.com/wiki/' + "#{data['Personality']}",
  autocomplete: 'AC',
  icon:         {
    type:       'filetype',
    name:       'icon.png'
  }
)

feedback.add_item(
  title:        'Species',
  subtitle:     "#{data['Species']}",
  uid:          'species',
  arg:          'http://animalcrossing.wikia.com/wiki/' + "#{data['Species']}",
  autocomplete: 'AC',
  icon:         {
    type:       'filetype',
    name:       'icon.png'
  }
)

feedback.add_item(
  title:        'Birthday',
  subtitle:     "#{data['Birthday']}",
  uid:          'birthday',
  arg:          'http://animalcrossing.wikia.com/wiki/' + "#{data['Birthday'].split.at(0)}",
  autocomplete: 'AC',
  icon:         {
    type:       'filetype',
    name:       'icon.png'
  }
)

feedback.add_item(
  title:        'Star sign',
  subtitle:     "#{data['Star sign']}",
  uid:          'star',
  arg:          'http://animalcrossing.wikia.com/wiki/' + "#{data['Star sign']}",
  autocomplete: 'AC',
  icon:         {
    type:       'filetype',
    name:       'icon.png'
  }
)

feedback.add_item(
  title:        'Initial phrase',
  subtitle:     "#{data['Initial phrase'].capitalize}",
  uid:          'phrase',
  arg:          'http://animalcrossing.wikia.com/wiki/' + villager,
  autocomplete: 'AC',
  icon:         {
    type:       'filetype',
    name:       'icon.png'
  }
)

feedback.add_item(
  title:        'Initial clothes',
  subtitle:     "#{data['Initial clothes']}",
  uid:          'clothes',
  arg:          'http://animalcrossing.wikia.com/wiki/' + villager,
  autocomplete: 'AC',
  icon:         {
    type:       'filetype',
    name:       'icon.png'
  }
)

feedback.add_item(
  title:        'Skill',
  subtitle:     "#{data['Skill']}",
  uid:          'skill',
  arg:          'http://animalcrossing.wikia.com/wiki/' + villager,
  autocomplete: 'AC',
  icon:         {
    type:       'filetype',
    name:       'icon.png'
  }
)

feedback.add_item(
  title:        'Goal',
  subtitle:     "#{data['Goal']}",
  uid:          'goal',
  arg:          'http://animalcrossing.wikia.com/wiki/' + villager,
  autocomplete: 'AC',
  icon:         {
    type:       'filetype',
    name:       'icon.png'
  }
)

feedback.add_item(
  title:        'Coffee',
  subtitle:     "#{data['Coffee'].split(',').at(0) + ' beans, '}" \
                "#{data['Coffee'].downcase.split(',').at(1) + ', and '}" \
                "#{data['Coffee'].downcase.split(',').at(2) + '.'}",
  uid:          'coffee',
  arg:          'http://animalcrossing.wikia.com/wiki/' + villager,
  autocomplete: 'AC',
  icon:         {
    type:       'filetype',
    name:       'icon.png'
  }
)

feedback.add_item(
  title:        'Style',
  subtitle:     "#{data['Style']}",
  uid:          'style',
  arg:          'http://animalcrossing.wikia.com/wiki/Clothing_Styles#' + "#{data['Style']}",
  autocomplete: 'AC',
  icon:         {
    type:       'filetype',
    name:       'icon.png'
  }
)

feedback.add_item(
  title:        'Favorite song',
  subtitle:     "#{data['Favorite song']}",
  uid:          'song',
  arg:          'http://animalcrossing.wikia.com/wiki/' + "#{data['Favorite song']}",
  autocomplete: 'AC',
  icon:         {
    type:       'filetype',
    name:       'icon.png'
  }
)

feedback.add_item(
  title:        'Appearances',
  subtitle:     # FIX THESE
                "#{data['Appearances'].split(',').at(0)}" + ', ' \
                "#{data['Appearances'].split(',').at(1)}" + ', ' \
                "#{data['Appearances'].split(',').at(2)}" + ', ',
  uid:          'appearances',
  arg:          'http://animalcrossing.wikia.com/wiki/Animal_Crossing_(series)#Games',
  autocomplete: 'AC',
  icon:         {
    type:       'filetype',
    name:       'icon.png'
  }
)

feedback.add_item(
  title:        'Regional names',
  subtitle:     # FIX THESE
                'France: ' + "#{data['Regional names'].split.at(0)}" + ', ' \
                'Germany: ' + "#{data['Regional names'].split.at(1)}" + ', ' \
                'Spain: ' + "#{data['Regional names'].split.at(2)}" + ', ' \
                'Italy: ' + "#{data['Regional names'].split.at(3)}",
  uid:          'names',
  arg:          'http://animalcrossing.wikia.com/wiki/' + villager,
  autocomplete: 'AC',
  icon:         {
    type:       'filetype',
    name:       'icon.png'
  }
)

puts feedback.to_xml
