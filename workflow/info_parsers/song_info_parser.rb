# frozen_string_literal: true

require_relative 'base_info_parser'

class SongInfoParser < BaseInfoParser
  def parse(url)
    super
  end

  private

  def find_table(url)
    # Select table by text content because there is no other good way.
    fetch_document(url).at_css('.WikiaArticle table:contains("Games")')
  end

  def horz_range
    []
  end

  def vert_range
    (2..5)
  end
end
