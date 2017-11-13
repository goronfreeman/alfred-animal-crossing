# frozen_string_literal: true

require_relative 'base_info_parser'

class ArtInfoParser < BaseInfoParser
  def parse(url)
    super
  end

  private

  def horz_range
    []
  end

  def vert_range
    (2..5)
  end
end
