$LOAD_PATH << '.'
require 'base_info_parser'

class FossilInfoParser < BaseInfoParser
  def parse(url)
    super
  end

  private

  def horz_range
    []
  end

  def vert_range
    (3..7)
  end
end
