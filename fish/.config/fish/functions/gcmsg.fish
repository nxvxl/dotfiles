function gcmsg -w "git commit -m"
  git commit -m "[$(git branch --show-current)] $argv[1]"
end
