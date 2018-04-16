function __pure_git_arrows
  set -l working_tree $argv[1]

  pushd $working_tree
  if test ! (command git rev-parse --abbrev-ref @'{u}' 2>/dev/null)
    popd
    return 0
  end

  set -l left (command git rev-list --left-only --count HEAD...@'{u}' 2>/dev/null)
  set -l right (command git rev-list --right-only --count HEAD...@'{u}' 2>/dev/null)

  popd

  if test $left -eq 0 -a $right -eq 0
    return 0
  end

  set -l arrows ""

  if test $left -gt 0
    set arrows $arrows"⇡"
  end

  if test $right -gt 0
    set arrows $arrows"⇣"
  end

  echo $arrows
end
