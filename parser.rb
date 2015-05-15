require_relative './nokogiri-master/lib/nokogiri'
require 'open-uri'

module Parser
  def self.parse(villager)
    doc = Nokogiri::HTML(open('http://animalcrossing.wikia.com/wiki/' + villager))

    table = doc.css('#WikiaArticle table')
    rows = table.css('tr')
    @data = {}

    rows.each do |r|
      columns = r.css('td')
      if columns.length == 2
        key = columns[0].content.lstrip.rstrip

        if key == 'Appearances'
          rval = []
          appearances = columns[1].css('a')
          appearances.each do |appearance|
            rval << (appearance.content.lstrip.rstrip)
          end

          @data[key] = rval

        elsif key == 'Regional names'
          @data[key] = {}
          countries = columns[1].css('a')
          names = columns[1].children
          children_index = 2
          countries.each do |country|
            country_name = country['title'].to_s
            name = names[children_index].to_s
            children_index += 4

            @data[key][country_name.lstrip.rstrip] = name.lstrip.rstrip
          end

        else
          @data[key] = columns[1].content.lstrip.rstrip
        end
      end
    end
    @data
  end
end
