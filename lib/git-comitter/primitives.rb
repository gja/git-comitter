module GitComitter
  class Always
    def evaluate_match
      true
    end
  end

  def accept(args = {})
    print(args[:message]) if args[:message]
    _accept
  end

  def deny(args = {})
    print(args[:message]) if args[:message]
    _deny
  end
end
