# frozen_string_literal: true

require_relative 'base_info_parser'

class CreatureInfoParser < BaseInfoParser
  def parse(url)
    super
  end

  private

  def header_ranges
    [[6, 8, 10], (12..16)]
  end

  def data_ranges
    [[7, 9, 11], (12..16)]
  end
end
