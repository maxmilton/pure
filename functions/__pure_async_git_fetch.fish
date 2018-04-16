function __pure_async_git_fetch
  if set -q __pure_fetching
    return 0
  end

  set -l working_tree $argv[1]

  pushd $working_tree
  if test ! (command git rev-parse --abbrev-ref @'{u}' 2>/dev/null)
    popd
    return 0
  end

  set -l git_fetch_required 0

  if test -e .git/FETCH_HEAD
    set -l last_fetch_timestamp (command stat -c "%Y" .git/FETCH_HEAD)
    set -l current_timestamp (__pure_timestamp)
    set -l time_since_last_fetch (math "$current_timestamp - $last_fetch_timestamp")
    if test $time_since_last_fetch -gt 1800
      set git_fetch_required 1
    end
  else
    set git_fetch_required 1
  end

  if test $git_fetch_required -eq 0
    popd
    return 0
  end

  __pure_run_async \
    "__pure_fetching" \
    __pure_update_prompt \
    "env GIT_TERMINAL_PROMPT=0 git -c gc.auto=0 fetch > /dev/null 2>&1"

  popd
end
