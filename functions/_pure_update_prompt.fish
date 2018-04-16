function _pure_update_prompt
    # Don't know why, but calling kill -WINCH directly has no effect
    set -l cmd "kill -WINCH "(echo %self)
    fish -c "$cmd" &
end
