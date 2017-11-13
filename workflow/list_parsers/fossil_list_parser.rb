# frozen_string_literal: true

require_relative 'base_list_parser'

class FossilListParser < BaseListParser
  def parse(list_url)
    super
  end

  private

  def table(doc)
    doc.css('#mw-content-text table')
  end

  def headers
    # Fossils are split into two tables and have multiple headers.
    [22, 26, 29, 33, 39, 42, 46, 49, 53, 57, 61, 65, 69, 72, 76, 80, 84, 88, 92] + (0..4).to_a + (15..18).to_a + (95..102).to_a
  end
end
