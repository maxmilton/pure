source $DIRNAME/../functions/fish_title.fish

test "title is not empty"
  -n (
    fish_title
  )
end

# FIXME: Implement this test
# test "user home is shortened"
#   # '~' = (
#   #   string match -q -- "pure" fish_title
#   # )

#   string match -q -- "pure" fish_title
#   0 -eq $status
# end
