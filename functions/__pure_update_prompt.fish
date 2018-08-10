function __pure_update_prompt
  set -q pid; or set pid %self # fish shell 3.x compat
  set -l cmd "kill -WINCH $pid"
  fish -c "$cmd" &
end
