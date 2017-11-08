$LOAD_PATH << 'lib/nokogiri'
require 'nokogiri'

$LOAD_PATH << 'lib/alfred-workflow-ruby'
require 'alfred-3_workflow'

$LOAD_PATH << '.'
require 'villagers'

require 'open-uri'

module AlfredAC
  class Search
    include AlfredAC::Villagers

    attr_reader :villager, :category

    def initialize
      @villager = ARGV[0]
      @category = ARGV[1]
    end

    def search
      find_matches(villager).each do |villager|
        workflow.result
                .title(villager)
      end
    end

    private

    def find_matches(query)
      Regexp.new(query) =~ @@villager_names
    end
  end
end

AlfredAC::Search.new.search
