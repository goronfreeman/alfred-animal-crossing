# frozen_string_literal: true

require_relative 'base_matcher'

class SoftMatcher < BaseMatcher
  def match(query, list)
    super
  end

  private

  def find_matches(query, list)
    list.keys.select { |name| name =~ Regexp.new(query, Regexp::IGNORECASE) }
  end
end
