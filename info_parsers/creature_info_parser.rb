require_relative 'base_info_parser'

class CreatureInfoParser < BaseInfoParser
  def parse(url)
    super
  end

  private

  def horz_header_indices
    [6, 8, 10]
  end

  def vert_header_indices
    (12..16)
  end
end
