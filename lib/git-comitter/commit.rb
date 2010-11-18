module GitComitter
  class PatternMatcher
    def initialize(patterns, &block)
      @patterns = patterns
      @commit_property = block
    end

    def match(commits)
      messages = commits.map{|c| @commit_property.call c}
      return messages.all? {|message| @patterns.any?{ |pattern| message =~ pattern } }
    end
  end

  def matches_email(*patterns)    
    PatternMatcher.new(patterns) {|c| c.author.email}
  end

  def matches_message(*patterns)
    PatternMatcher.new(patterns) {|c| c.message}
  end
end
