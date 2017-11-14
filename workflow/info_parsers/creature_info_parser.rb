# frozen_string_literal: true

require_relative 'base_info_parser'

class CreatureInfoParser < BaseInfoParser
  def parse(url)
    super
  end

  private

  def horz_range
    [6, 8, 10]
  end

  def vert_range
    (12..16)
  end
end
