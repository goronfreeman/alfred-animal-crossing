require_relative './nokogiri-master/lib/nokogiri'
require 'open-uri'

module Parser
  def self.parse(villagerName)
    doc = Nokogiri::HTML(open('http://animalcrossing.wikia.com/wiki/' + villagerName))

    table = doc.css('#WikiaArticle table')
    rows = table.css('tr')
    @data = {}

    rows.each do |r|
      columns = r.css('td')
      if columns.length == 2
        key = columns[0].content.lstrip.chomp

        if key == 'Appearances'
          rval = []
          appearances = columns[1].css('a')
          appearances.each do |appearance|
            rval << (appearance.content.lstrip.chomp)
          end

          @data[key] = rval

        # elsif key == 'Regional names'
        #   rval = []
        #   names = columns[1].css('[title~=France]')
        #   names.each do |name|
        #     rval << (name.content.lstrip.chomp)
        #   end
        #
        #   @data[key] = rval

        else
          @data[key] = columns[1].content.lstrip.chomp
        end
      end
    end
    @data
  end
end
