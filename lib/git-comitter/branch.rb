module GitComitter
  def branch_is_in(*branches)
    short_branch = branch.split("/").last
    branches.include? short_branch
  end
end
