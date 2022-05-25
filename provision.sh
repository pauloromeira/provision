#!/bin/bash
REPO="https://github.com/pauloromeira/provision.git"
PYTH="$(command -v python3 || command -v python)"
VENV="${HOME}/.local/pipx/venvs/ansible"
CMND="${1}"
ARGS="${@:2}"
SUDO=""

[[ "$#" -eq 0 || "${CMND}" = "bootstrap" ]] && CMND="pull"
[ "${CMND}" = "pull" ] && CMND="ansible-pull -U ${REPO}"
[ "${CMND}" = "sync" ] && CMND="ansible-pull -o -U ${REPO}"
[ "${CMND}" = "playbook" ] && CMND="ansible-playbook"
[ "${CMND}" = "local" ] && CMND="ansible-playbook local.yml"
[ "${*}" = "setup" ] && CMND="ansible localhost -m setup"

if [ "${EUID}" -ne 0 ]; then
  SUDO="sudo "
  export ANSIBLE_BECOME_ASK_PASS="True"
fi
export ANSIBLE_PYTHON_INTERPRETER="${PYTH}"

(command -v dpkg && dpkg -s python3-venv || ! command -v apt-get) &> /dev/null \
  || (${SUDO}apt-get update && ${SUDO}apt-get install -y git python3-pip)

"${PYTH}" -m pip install --user --disable-pip-version-check pipx > /dev/null \
  && "${PYTH}" -m pipx install ansible --include-deps > /dev/null \
  && "${VENV}/bin/"${CMND} ${ARGS[@]}
