$LOAD_PATH << '.'
require 'match_json'

class Fish
  LIST_URL = 'http://animalcrossing.wikia.com/wiki/Fish_(New_Leaf)'.freeze
end

MatchJSON.new(
  list_url: Fish::LIST_URL,
  list_parser: DefaultListParser.new,
  matcher: DefaultMatcher.new,
  info_parser: FishInfoParser.new
).find
