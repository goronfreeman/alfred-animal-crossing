require_relative 'base_matcher'

class DefaultMatcher < BaseMatcher
  def match(query, list)
    super
  end

  private

  def find_matches(query, list)
    list.keys.select { |name| name.start_with?(query) }
  end
end
