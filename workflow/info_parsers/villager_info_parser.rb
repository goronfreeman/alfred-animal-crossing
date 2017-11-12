$LOAD_PATH << '.'
require 'base_info_parser'

class VillagerInfoParser < BaseInfoParser
  def parse(url)
    super
  end

  private

  def header_ranges
    [(4..4), (6..15)]
  end

  def data_ranges
    [(5..5), (6..15)]
  end
end
