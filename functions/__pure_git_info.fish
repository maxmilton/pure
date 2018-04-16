function __pure_git_info
  if not set -q __pure_git_last_dirty_check_timestamp
    set -g __pure_git_last_dirty_check_timestamp 0
  end

  set -l working_tree $argv[1]
  set -l current_timestamp (__pure_timestamp)
  set -l time_since_last_dirty_check (math "$current_timestamp - $__pure_git_last_dirty_check_timestamp")

  pushd $working_tree
  if test $time_since_last_dirty_check -gt 10
    set -l cmd "command git status -unormal --porcelain --ignore-submodules 2>/dev/null | wc -l"
    __pure_run_async "__pure_checking_dirty" __pure_dirty_callback $cmd
  end

  set -l git_branch_name (command git symbolic-ref HEAD 2>/dev/null | sed -e 's|^refs/heads/||')

  # handle detached HEAD
  if test -z $git_branch_name
    set git_branch_name (command git rev-parse --short HEAD 2>/dev/null)
  end
  popd

  set -l git_dirty_mark
  if set -q __pure_git_is_dirty
    set git_dirty_mark "*"
  end

  echo -sn $git_branch_name $git_dirty_mark
end
