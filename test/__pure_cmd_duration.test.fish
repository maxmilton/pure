source $DIRNAME/../functions/__pure_cmd_duration.fish

test "command duration is shown when 5000ms"
  '5.0s' = (
    set CMD_DURATION 5000
    __pure_cmd_duration
  )
end

test "command duration is not shown when under 5000ms"
  -z (
    set CMD_DURATION 3000
    __pure_cmd_duration
  )
end

test "command duration is calculated correctly"
  '6h 56m 7.89s' = (
    set CMD_DURATION 1234567890
    __pure_cmd_duration
  )
end
