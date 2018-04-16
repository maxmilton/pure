set -g __pure_new_session 1

function fish_prompt
  set last_status $status
  set -l normal (set_color normal)

  if test $__pure_new_session -eq 0
    echo ""
    echo -sn (set_color blue) (string replace $HOME "~" $PWD)

    set -l cmd_duration (__pure_cmd_duration)
    if test -n "$cmd_duration"
      echo -n (set_color yellow) " " $cmd_duration $normal
    end

    set -l git_working_tree (command git rev-parse --show-toplevel ^/dev/null)
    if test -n "$git_working_tree"
      __pure_update_git_last_pwd $git_working_tree
      set -l git_info (__pure_git_info $git_working_tree)
      if test -n "$git_info"
        echo -n (set_color 666) $git_info $normal
      end

      set -l git_arrows (__pure_git_arrows $git_working_tree)
      if test -n "$git_arrows"
        echo -n (set_color cyan) $git_arrows $normal
      end

      __pure_async_git_fetch $git_working_tree
      if set -q __pure_async_git_fetch_running
        echo -sn (set_color yellow) "•" $normal
      end
    end

    # draw over async indicator on WINCH signal
    echo "          "
  end

  set prompt_color (set_color magenta)
  if test $last_status -ne 0
    set prompt_color (set_color red)
  end

  echo -sn $prompt_color "❯ " $normal

  set __pure_new_session 0
end
