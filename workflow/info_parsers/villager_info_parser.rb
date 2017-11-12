$LOAD_PATH << '.'
require 'base_info_parser'

class VillagerInfoParser < BaseInfoParser
  def parse(url)
    super
  end

  private

  def horz_range
    [4]
  end

  def vert_range
    (6..15)
  end
end
