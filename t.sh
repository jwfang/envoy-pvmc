#!/usr/bin/bash

while true
do
  fn=$(date +%s)
  echo "========== ${fn} ============"
  echo "DOWN ..." 
  docker-compose down
  echo "UP ..." 
  docker-compose up -d
  echo -n "WAIT 10s ... " 
  for _ in {1..10}
  do
    sleep 1
    echo -n "#"
  done
  echo ""
  echo "GET LOG ..."
  docker-compose logs envoy > logs/${fn}.out
  if grep -E "(critical|pure virtual method called)" logs/${fn}.out; then
    echo "GOT fault, STOP"
    break
  fi
done

