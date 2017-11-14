require_relative 'base_info_parser'

class VillagerInfoParser < BaseInfoParser
  def parse(url)
    super
  end

  private

  def horz_header_indices
    [4]
  end

  def vert_header_indices
    (6..15)
  end
end
