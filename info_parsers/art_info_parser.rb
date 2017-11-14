require_relative 'base_info_parser'

class ArtInfoParser < BaseInfoParser
  def parse(url)
    super
  end

  private

  def horz_header_indices
    []
  end

  def vert_header_indices
    (2..5)
  end
end
