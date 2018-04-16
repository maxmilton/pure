function __pure_cmd_duration
  if test "$CMD_DURATION" -ge 5000
    set milliseconds (math "$CMD_DURATION % 1000")
    set seconds (math "$CMD_DURATION % 60")
    set minutes (math "$CMD_DURATION / 60000 % 60")
    set hours (math "$CMD_DURATION / 3600000 % 24")

    if test $hours -gt 0
      echo -sn $hours "h "
    end

    if test $minutes -gt 0
      echo -sn $minutes "m "
    end

    echo -s $seconds.$milliseconds "s"
  end
end
