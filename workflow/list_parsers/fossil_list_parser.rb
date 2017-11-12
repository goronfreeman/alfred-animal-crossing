$LOAD_PATH << '.'
require 'default_list_parser'

class FossilListParser < DefaultListParser
  def parse(list_url)
    super
  end

  private

  def table_rows(list_url)
    doc   = Nokogiri::HTML(open(list_url))
    table = doc.css('#mw-content-text table')

    # Table does not have thead or tbody, so skip the headers.
    indexes = [22, 26, 29, 33, 39, 42, 46, 49, 53, 57, 61, 65, 69, 72, 76, 80, 84, 88, 92] +
                (0..4).to_a + (15..18).to_a + (95..102).to_a
    table.css('tr').reject.with_index { |_el, i| indexes.include?(i) }
  end
end
