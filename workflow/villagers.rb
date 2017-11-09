require 'open-uri'

module AlfredAC
  module Villagers
    class << self
      def info
        rows = table_rows
        names = names(rows)
        urls = urls(rows)
        images = images(rows)
        info_hash = {}

        names.each.with_index do |name, i|
          info_hash[name] = {
            'url' => urls[i],
            'image' => images[i],
          }
        end

        info_hash
      end

      private

      def names(rows)
        rows.map { |row| row.at_css('td a').inner_text }
      end

      def urls(rows)
        rows.map { |row| row.at_css('td a')['href'] }
      end

      def images(rows)
        rows.map { |row| row.css('td')[1].at_css('a')['href'] }
      end

      def table_rows
        doc = Nokogiri::HTML(open('http://animalcrossing.wikia.com/wiki/Villager_list_(New_Leaf)'))
        table = doc.css('.WikiaArticle table').last
        # Table does not have thead or tbody, so skip the headers.
        table.css('tr').drop(1)
      end
    end
  end
end
