$LOAD_PATH << '.'
require 'match_json'

class Fossils
  LIST_URL = 'http://animalcrossing.wikia.com/wiki/Fossils_(New_Leaf)'.freeze
end

MatchJSON.new(
  list_url: Fossils::LIST_URL,
  list_parser: DefaultListParser.new,
  matcher: DefaultMatcher.new,
  info_parser: FossilInfoParser.new
).find
