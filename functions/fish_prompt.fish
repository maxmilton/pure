set -g __pure_new_session 1

function fish_prompt
  set last_status $status

  # skip first prompt line for near-instant initial load
  if test $__pure_new_session -eq 0
    echo ""
    echo -sn (set_color blue) (string replace $HOME "~" $PWD)

    set -l cmd_duration (__pure_cmd_duration)
    if test -n "$cmd_duration"
      echo -n (set_color yellow) $cmd_duration
    end

    set -l git_working_tree (command git rev-parse --show-toplevel 2>/dev/null)
    if test -n "$git_working_tree"
      __pure_git_fetch $git_working_tree
      __pure_git_update_workdir $git_working_tree
      echo -n (set_color 666) (__pure_git_info $git_working_tree)

      set -l git_arrows (__pure_git_arrows $git_working_tree)
      if test -n "$git_arrows"
        echo -n (set_color cyan) $git_arrows
      end

      if set -q __pure_fetching
        echo -n (set_color yellow --dim) "•"
      end
    end

    # draw trailing characters on WINCH signal
    echo "          "
  end

  set prompt_color (set_color magenta)
  if test $last_status -ne 0
    set prompt_color (set_color red)
  end

  echo -sn $prompt_color "❯ " (set_color normal)

  set __pure_new_session 0
end
