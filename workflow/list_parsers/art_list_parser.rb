# frozen_string_literal: true

require_relative 'base_list_parser'

class ArtListParser < BaseListParser
  def parse(list_url)
    super
  end

  private

  def table(doc)
    doc.css('#mw-content-text .wikitable')
  end

  def rows(table)
    # Paintings & sculptures are in two separate tables.
    # Tables do not have thead or tbody, so skip the headers.
    table.css('tr').reject.with_index { |_el, i| [0, 24].include?(i) }
  end

  def images(_rows)
    []
  end
end
