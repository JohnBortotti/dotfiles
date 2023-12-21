if [[ -z "$1" ]]; then
    echo "Please provide a directory."
    exit 1
fi

for file in $(find $1 -name "docker-compose.yml"); do 
  echo
  echo "Container status in $file:"
  cd $(dirname $file)
  docker compose ps --format 'table {{.Name}}\t{{.Image}}\t{{.Service}}\t{{.Status}}'
  cd - > /dev/null
  echo
done
