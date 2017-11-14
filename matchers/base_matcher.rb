# Child classes are expected to define #find_matches.
#
# Returns an Array containing all matching results.
# def find_matches(query, list)
#   list.keys.select { |name| name.start_with?(query) }
# end

class BaseMatcher
  def match(query, list)
    return query if exact_match?(query, list)
    return list.keys if list_all?(query)
    results = find_matches(query, list)
    return results if results.any?
    false
  end

  private

  def list_all?(query)
    query == 'list'
  end

  def exact_match?(query, list)
    list.keys.include?(query)
  end
end
