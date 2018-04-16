function __pure_update_prompt
  set -l cmd "kill -WINCH "(echo %self)
  fish -c "$cmd" &
end
