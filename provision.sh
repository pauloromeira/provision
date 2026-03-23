#!/bin/bash
REPO="https://github.com/pauloromeira/provision.git"
CMND="${1}"
ARGS="${@:2}"
SUDO=""
DEBIAN_DEPS=(git python3 python3-venv pipx)
FEDORA_DEPS=(git python3 pipx)

[ "${EUID}" -ne 0 ] && SUDO="sudo "
[[ "$#" -eq 0 || "${CMND}" = "bootstrap" ]] && CMND="pull"
[ "${CMND}" = "pull" ] && CMND="ansible-pull -U ${REPO}"
[ "${CMND}" = "sync" ] && CMND="ansible-pull -o -U ${REPO}"
[ "${CMND}" = "playbook" ] && CMND="ansible-playbook"
[ "${CMND}" = "local" ] && CMND="ansible-playbook local.yml"
[ "${*}" = "setup" ] && CMND="ansible localhost -m setup"

# Dependencies: debian
(command -v dpkg && dpkg -s ${DEBIAN_DEPS[@]} || ! command -v apt-get) &> /dev/null \
  || (${SUDO}apt-get update && ${SUDO}apt-get install -y ${DEBIAN_DEPS[@]})

# Dependencies: fedora
(command -v rpm && rpm -q ${FEDORA_DEPS[@]} || ! command -v dnf) &> /dev/null \
  || ${SUDO}dnf install -y ${FEDORA_DEPS[@]}

PYTHON="$(command -v python3 || command -v python)"
export ANSIBLE_PYTHON_INTERPRETER="${PYTHON}"
[ -n "${SUDO}" ] && export ANSIBLE_BECOME_ASK_PASS="True"

pipx ensurepath -q > /dev/null \
  && pipx install --python "${PYTHON}" ansible --include-deps > /dev/null \
  && "${HOME}"/.local/bin/${CMND} ${ARGS[@]}
