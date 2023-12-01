## Provision
Provision my personal environment for Fedora and Ubuntu-based distributions, powered by ansible.

Tip for reading this on terminal:
```sh
curl https://provision.pauloromeira.com/readme | less
```

### System bootstrap
```sh
curl https://provision.pauloromeira.com | bash
```
OR
```sh
wget -O - https://provision.pauloromeira.com | bash
```

Full bootstrap (includes GUI applications)
```sh
curl https://provision.pauloromeira.com | bash -s pull --tags full
```

Run specific tags
```sh
curl https://provision.pauloromeira.com | bash -s pull --tags TAGS
```

Example: install docker (and docker-compose)
```sh
curl https://provision.pauloromeira.com | bash -s pull --tags docker
```

Skip specific tags
```sh
curl https://provision.pauloromeira.com | bash -s pull --skip-tags SKIP_TAGS
```

### Commands
Run locally:
```sh
./provision.sh local
```

Pull (always run):
```sh
provision pull [args] [playbook]
```

Sync (run only if remote changed):
```sh
provision sync [args] [playbook]
```

Run custom ansible command:
```sh
provision ansible* [args]
```

Gather facts
```sh
provision setup
```

### References
My dotfiles:
  - https://github.com/pauloromeira/dotfiles

Tutorials/arcticles:
  - [Using Ansible to automate your Laptop and Desktop configs](https://www.youtube.com/watch?v=gIDywsGBqf4)
  - https://medium.com/espinola-designs/manage-your-dotfiles-with-ansible-6dbedd5532bb

Repos:
  - https://github.com/LearnLinuxTV/personal_ansible_desktop_configs
  - https://github.com/geerlingguy/mac-dev-playbook
  - https://git.todevski.com/ansible/playbooks/workstation/
  - https://github.com/kespinola/dotfiles
  - https://github.com/victorfsf/dotfiles

User guide:
  - https://docs.ansible.com/ansible/latest/user_guide/index.html
