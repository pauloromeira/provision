#!/bin/bash
REPO="https://github.com/pauloromeira/provision.git"
DEPS=("ansible" "psutil")
VENV="${HOME}/.local/provision/venv"
CMND="${1}"
ARGS="${@:2}"
SUDO=""

[[ "$#" -eq 0 || "${*}" = "bootstrap" ]] && CMND="pull"
[ "${CMND}" = "pull" ] && CMND="ansible-pull -U ${REPO}"
[ "${CMND}" = "sync" ] && CMND="ansible-pull -o -U ${REPO}"
[ "${CMND}" = "local" ] && CMND="ansible-playbook"
[ "${*}" = "setup" ] && CMND="ansible localhost -m setup"

if [ "${EUID}" -ne 0 ]; then
  SUDO="sudo "
  ARGS+=("--ask-become-pass")
  # export ANSIBLE_BECOME_ASK_PASS="True"  # this way is asking twice on ansible-pull
fi
export ANSIBLE_PYTHON_INTERPRETER="${VENV}/bin/python"

(command -v dpkg && dpkg -s python3-venv || ! command -v apt-get) &> /dev/null \
  || (${SUDO}apt-get update && ${SUDO}apt-get install -y git python3-venv)

"$(command -v python3 || command -v python)" -m venv "${VENV}" > /dev/null \
  && "${VENV}/bin/python" -m pip install ${DEPS[@]} > /dev/null \
  && "${VENV}/bin/"${CMND} ${ARGS[@]}
