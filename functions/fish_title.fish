function fish_title
  set pure_pwd (string replace $HOME "~" $PWD)
  if test -n "$argv"
    echo -s (basename $pure_pwd) " : " $argv[1]
  else
    echo $pure_pwd
  end
end
