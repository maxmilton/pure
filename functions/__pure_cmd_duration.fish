function __pure_cmd_duration
  set -l duration $CMD_DURATION

  if test $duration -ge 5000
    set -l ms (math -s0 $duration % 1000 / 10)
    set -l s (math -s0 $duration / 1000 % 60)
    set -l m (math -s0 $duration / 60000 % 60)
    set -l h (math -s0 $duration / 3600000 % 24)

    if test $h -gt 0
      echo -sn $h "h "
    end

    if test $m -gt 0
      echo -sn $m "m "
    end

    echo -s $s.$ms "s"
  end
end
