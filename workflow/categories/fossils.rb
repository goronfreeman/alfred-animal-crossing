# frozen_string_literal: true

require_relative '../match_json'

class Fossils
  LIST_URL = 'http://animalcrossing.wikia.com/wiki/Fossils_(New_Leaf)'
end

MatchJSON.new(
  list_url: Fossils::LIST_URL,
  list_parser: FossilListParser.new,
  matcher: DefaultMatcher.new,
  info_parser: FossilInfoParser.new
).find
