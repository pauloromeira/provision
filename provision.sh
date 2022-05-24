#!/bin/bash
REPO="https://github.com/pauloromeira/provision.git"
VENV="${HOME}/.local/venvs/provision"
CMND="${1}"
ARGS="${@:2}"
SUDO=""

[[ "$#" -eq 0 || "${*}" = "bootstrap" ]] && CMND="pull"
[ "${CMND}" = "pull" ] && CMND="ansible-pull -U ${REPO}"
[ "${CMND}" = "sync" ] && CMND="ansible-pull -o -U ${REPO}"
[ "${CMND}" = "playbook" ] && CMND="ansible-playbook"
[ "${CMND}" = "local" ] && CMND="ansible-playbook local.yml"
[ "${*}" = "setup" ] && CMND="ansible localhost -m setup"

if [ "${EUID}" -ne 0 ]; then
  SUDO="sudo "
  ARGS+=("--ask-become-pass")
  # export ANSIBLE_BECOME_ASK_PASS="True"  # this way is asking twice on ansible-pull
fi

(command -v dpkg && dpkg -s python3-venv || ! command -v apt-get) &> /dev/null \
  || (${SUDO}apt-get update && ${SUDO}apt-get install -y git python3-venv)

export ANSIBLE_PYTHON_INTERPRETER="${VENV}/bin/python"
export GLOBAL_PYTHON_INTERPRETER="$(command -v python3 || command -v python)"

"${GLOBAL_PYTHON_INTERPRETER}" -m venv "${VENV}" \
  && "${VENV}/bin/python" -m pip install ansible > /dev/null \
  && "${VENV}/bin/"${CMND} ${ARGS[@]}
