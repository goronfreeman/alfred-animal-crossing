class DefaultMatcher
  def match(query, list)
    return query if exact_match?(query, list)
    results = find_matches(query, list)
    return results if results.any?
    false
  end

  private

  def exact_match?(query, list)
    list.keys.include?(query)
  end

  def find_matches(query, list)
    list.keys.select { |name| name.start_with?(query) }
  end
end
