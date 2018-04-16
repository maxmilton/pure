function __pure_git_dirty_callback
  set -g __pure_git_last_dirty_check_timestamp (__pure_timestamp)
  set -l dirty_files_count $argv[1]

  if test $dirty_files_count -gt 0
    set -g __pure_git_is_dirty
  else
    set -e __pure_git_is_dirty
  end

  __pure_update_prompt
end
