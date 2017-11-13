$LOAD_PATH << '.'
require 'default_list_parser'

class SongListParser < DefaultListParser
  def parse(list_url)
    super
  end

  private

  # This is actually an unordered list.
  def table_rows(list_url)
    doc  = Nokogiri::HTML(open(list_url))
    list = doc.at_css('#mw-content-text ol')

    list.css('li')
  end

  def names(rows)
    rows.map { |row| extract_text(row) }
  end

  def urls(rows)
    rows.map { |row| row.at_css('a')['href'] }
  end

  def images(_rows)
    []
  end
end
