function dcu --wraps='docker-compose up --build' --description 'alias dcu docker-compose up --build'
  docker-compose up --build $argv; 
end
