module GitComitter
  class Always
    def evaluate_match
      true
    end
  end

  def accept(condition = Always.new)
    _accept if condition.evaluate_match
  end

  def deny(condition = Always.new)
    _deny if condition.evaluate_match
  end
end
