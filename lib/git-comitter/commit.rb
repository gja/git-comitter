module GitComitter
  class EmailMatcher
    def initialize(patterns)
      @patterns = patterns
    end

    def match(commits) 
      emails = commits.map{|c| c.author.email}
      return emails.all? {|email| @patterns.any?{ |pattern| email.match pattern } }
    end
  end

  def matches_email(*patterns)    
    EmailMatcher.new(patterns)
  end
end
