require_relative 'base_list_parser'

class ArtListParser < BaseListParser
  def parse(list_url)
    super
  end

  private

  def table(doc)
    doc.css('#mw-content-text .wikitable')
  end

  def headers
    # Paintings & sculptures are in two separate tables.
    [0, 24]
  end
end
