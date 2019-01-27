#!/bin/bash -xe

basedir="$(dirname "$0")"

cmd_image() {
  docker build -t gago:latest .
}

cmd_stop() {
  docker rm 'gago' -f || true
}

cmd_run() {
  docker run -it --rm --name 'gago' \
  -v "/home/gago/Documentos:/opt/gago" \
  -w '/opt/gago' \
  -p 8085:8085 \
  'gago:latest' "/opt/gago/environment/entrypoint/jupyter.sh"
}

cmd_exec() {
  docker exec -it 'gago' "$@"
}

cmd_entrypoint() {
  _entrypoint=${1?'command'}
  shift
  cmd_exec "/opt/gago/environment/entrypoint/$_entrypoint.sh" "$@"
}

_cmd=${1?'command'}
shift
cmd_${_cmd} "$@"
