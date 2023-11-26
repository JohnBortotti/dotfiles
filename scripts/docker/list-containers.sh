directory=$1

for file in $(find $directory -name "docker-compose.yml"); do 
  echo
  echo "Container status in $file:"
  cd $(dirname $file)
  docker compose ps --format 'table {{.Name}}\t{{.Image}}\t{{.Service}}\t{{.Status}}'
  cd - > /dev/null
  echo
done
