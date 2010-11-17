module GitComitter
  def all_authors_match(*patterns)    
    emails = commits.map{|c| c.author.email}
    return emails.all? {|email| patterns.any?{ |pattern| email.match pattern } }
  end
end
