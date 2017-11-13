$LOAD_PATH << '.'
require 'default_list_parser'

class ArtListParser < DefaultListParser
  def parse(list_url)
    super
  end

  private

  def table_rows(list_url)
    doc   = Nokogiri::HTML(open(list_url))
    table = doc.css('#mw-content-text .wikitable')

    # Paintings & sculptures are in two separate tables.
    # Tables do not have thead or tbody, so skip the headers.
    table.css('tr').reject.with_index { |_el, i| [0, 24].include?(i) }
  end

  def images(_rows)
    []
  end
end
