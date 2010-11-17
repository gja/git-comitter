module GitComitter
  attr_reader :branch, :old_sha, :new_sha

  def setup_globals(directory, branch, old_sha, new_sha)
    @git = Git.open(directory)
    @branch = branch
    @old_sha = old_sha
    @new_sha = new_sha
  end

  def commits
    @git.log.between(old_sha, new_sha)
  end
end
