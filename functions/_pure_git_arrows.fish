function _pure_git_arrows
  set -l working_tree $argv[1]

  pushd $working_tree
  if test ! (command git rev-parse --abbrev-ref @'{u}' ^ /dev/null)
    popd
    return 0
  end

  set -l left (command git rev-list --left-only --count HEAD...@'{u}' ^ /dev/null)
  set -l right (command git rev-list --right-only --count HEAD...@'{u}' ^ /dev/null)

  popd

  if test $left -eq 0 -a $right -eq 0
    return 0
  end

  set -l arrows ""

  if test $left -qt 0
    set arrows $arrows"⇡"
  end

  if test $right -qt 0
    set arrows $arrows"⇣"
  end

  echo $arrows
end
