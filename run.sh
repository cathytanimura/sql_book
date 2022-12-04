#!/usr/bin/env bash


set -x
main() {
  cd /csv_files/
  mkdir -p localpath
  [ -f /localpath ] || ln -s $PWD/localpath/ /localpath
  cp */* localpath
  local creates=(./localpath/create_*)
  echo psql -h db -p 5432 -U sqluser sqluser "${creates[@]/#/-f }"
  psql -h db -p 5432 -U sqluser sqluser ${creates[*]/#/-f }
}

main "$@"
