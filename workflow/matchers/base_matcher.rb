# frozen_string_literal: true

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

  def find_matches(_query, _list)
    raise NotImplementedError, 'Not implemented in child class'
  end
end
