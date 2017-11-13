# frozen_string_literal: true

require_relative 'base_list_parser'

class DefaultListParser < BaseListParser
  def parse(list_url)
    super
  end

  private

  def table(doc)
    doc.css('#mw-content-text table')[2]
  end

  def rows(table)
    # Table does not have thead or tbody, so skip the headers.
    table.css('tr').drop(1)
  end
end
