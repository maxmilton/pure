function __pure_update_git_last_pwd
  set -l working_tree $argv[1]
  if not set -q __pure_git_last_pwd
    set -g __pure_git_last_pwd $working_tree
    return 0
  end

  if test "$__pure_git_last_pwd" = $working_tree
    return 0
  end

  # reset git dirty state on directory change
  set -g __pure_git_last_pwd $working_tree
  set -e __pure_git_is_dirty
  set -e __pure_git_last_dirty_check_timestamp

  # mask any failed set calls
  return 0
end
