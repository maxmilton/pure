function _pure_update_git_last_pwd
  set -l working_tree $argv[1]
  if not set -q _pure_git_last_pwd
    set -g _pure_git_last_pwd $working_tree
    return 0
  end

  if test "$_pure_git_last_pwd" = $working_tree
    return 0
  end

  # reset git dirty state on directory change
  set -g _pure_git_last_pwd $working_tree
  set -e _pure_git_is_dirty
  set -e _pure_git_last_dirty_check_timestamp

  # mask any failed set calls
  return 0
end
