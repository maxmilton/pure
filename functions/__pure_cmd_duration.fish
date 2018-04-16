function __pure_cmd_duration
  if test "$CMD_DURATION" -ge 5000
    set -l s (math -s2 "$CMD_DURATION / 1000")
    set -l m (math "$CMD_DURATION / 60000 % 60")
    set -l h (math "$CMD_DURATION / 3600000 % 24")

    if test $h -gt 0
      echo -sn $h "h "
    end

    if test $m -gt 0
      echo -sn $m "m "
    end

    echo -s $s "s"
  end
end
