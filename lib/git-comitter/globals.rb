module GitComitter
  attr_reader :full_branch, :old_sha, :new_sha

  def setup_globals(git, full_branch, old_sha, new_sha)
    @git = git
    @full_branch = full_branch
    @old_sha = old_sha
    @new_sha = new_sha
  end

  def branch
    full_branch.split("/").last
  end

  def commits
    @git.log.between(old_sha, new_sha).to_a
  end
end
