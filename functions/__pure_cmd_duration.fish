function __pure_cmd_duration
  if set -q CMD_DURATION
    set full_seconds (math "$CMD_DURATION / 1000")

    if test $full_seconds -ge 5
      set second_parts (math "$CMD_DURATION % 1000 / 10")
      set seconds (math "$full_seconds % 60")
      set minutes (math "$full_seconds / 60 % 60")
      set hours (math "$full_seconds / 3600 % 24")

      if test $hours -gt 0
        echo -sn $hours "h "
      end

      if test $minutes -gt 0
        echo -sn $minutes "m "
      end

      echo -s $seconds.$second_parts "s"
    end
  end
end
