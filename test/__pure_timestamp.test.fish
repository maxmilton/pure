source $DIRNAME/../functions/__pure_timestamp.fish

test "generates output"
  -n (
    __pure_timestamp
  )
end

test "generates a valid timestamp"
  1532515974 -lt (
    __pure_timestamp
  )
end
