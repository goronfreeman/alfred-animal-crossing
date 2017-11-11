$LOAD_PATH << '.'
require 'base_info_parser'

class SongInfoParser < BaseInfoParser
  def parse(url)
    super
  end

  private

  def find_table(url)
    # Select table by text content because there is no other good way.
    fetch_document(url).at_css('.WikiaArticle table:contains("Games")')
  end

  def find_columns(rows)
    {}.tap do |hash|
      rows.each do |row|
        columns = row.css('td')
        next unless columns.size == 2
        table_info(columns, hash)
      end
    end
  end
end
