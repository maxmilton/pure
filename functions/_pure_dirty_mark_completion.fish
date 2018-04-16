function _pure_dirty_mark_completion
  set -g _pure_git_last_dirty_check_timestamp (_pure_timestamp)
  set -l dirty_files_count $argv[1]

  if test $dirty_files_count -gt 0
    set -g _pure_git_is_dirty
  else
    set -e _pure_git_is_dirty
  end

  _pure_update_prompt
end
