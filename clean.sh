#!/bin/bash
prompt() {
  read -e -p "$1 [$2]: " var
  echo ${var:-$2}
}
#export RSYSLOG_REPO=${RSYSLOG_REPO:-$(prompt "rsyslog repo" "../rsyslog")}
docker-compose -f layouts/dev.yml -f layouts/pro.yml stop
#docker-compose -f layouts/dev.yml -f layouts/pro.yml rm
