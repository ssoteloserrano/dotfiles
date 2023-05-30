function c --wraps='git commit -m' --description 'alias c git commit -m'
  git commit -m $argv; 
end
