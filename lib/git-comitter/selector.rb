module GitComitter
  def all_commits(matcher)
    matcher.match(commits)
  end

  def latest_commit(matcher)
    matcher.match([commits.last])
  end

  def first_commit(matcher)
    matcher.match([commits.first])
  end
end
