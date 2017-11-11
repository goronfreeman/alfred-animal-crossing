$LOAD_PATH << '.'
require 'match_json'

class Bugs
  LIST_URL = 'http://animalcrossing.wikia.com/wiki/Bugs_(New_Leaf)'.freeze
end

MatchJSON.new(
  list_url: Bugs::LIST_URL,
  list_parser: DefaultListParser.new,
  matcher: DefaultMatcher.new,
  info_parser: BugInfoParser.new
).find
