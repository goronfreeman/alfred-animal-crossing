# frozen_string_literal: true

require_relative '../match_json'

class Art
  LIST_URL = 'http://animalcrossing.wikia.com/wiki/Art_(New_Leaf)'
end

MatchJSON.new(
  list_url: Art::LIST_URL,
  list_parser: ArtListParser.new,
  matcher: DefaultMatcher.new,
  info_parser: ArtInfoParser.new
).find
