function __pure_git_update_workdir
  set -l working_tree $argv[1]
  if not set -q __pure_git_workdir
    set -g __pure_git_workdir $working_tree
    return 0
  end

  if test "$__pure_git_workdir" = $working_tree
    return 0
  end

  # reset git dirty state on directory change
  set -g __pure_git_workdir $working_tree
  set -e __pure_git_is_dirty
  set -e __pure_git_last_dirty_check

  # mask any failed set calls
  return 0
end
