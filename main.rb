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
  title:        name,
  subtitle:     "#{data['Personality']}",
  uid:          'animalcrossing',
  arg:          'http://animalcrossing.wikia.com/wiki/' + name,
  autocomplete: 'AC',
  icon:         {
    type:       'filetype',
    name:       'icon.png'
  }
)

puts feedback.to_xml
