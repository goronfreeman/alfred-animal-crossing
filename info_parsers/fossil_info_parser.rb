require_relative 'base_info_parser'

class FossilInfoParser < BaseInfoParser
  def parse(url)
    super
  end

  private

  def horz_header_indices
    []
  end

  def vert_header_indices
    (3..7)
  end
end
