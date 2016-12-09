#!/bin/bash
RED="\033[0;31m"
NC="\033[0m"

prompt() {
  read -e -p "$1 [$2]: " var
  echo ${var:-$2}
}
abspath() {
  echo "$(cd "$(dirname "$1")"; pwd)/$(basename "$1")"
}

export LOGGING_SERVER_REPO=${LOGGING_SERVER_REPO:-$(abspath $(prompt "logging server repo" "../logging-server"))}
type=${BASH_ARGV[0]:-dev}

echo -e "${RED}Building ${type} environment...${NC}"
docker-compose -f "layouts/${type}.yml" build --no-cache
docker-compose -f "layouts/${type}.yml" up -d 
