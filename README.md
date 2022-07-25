### System bootstrap
```sh
curl -s pauloromeira.com/bootstrap | bash
```
OR
```sh
wget -qO - pauloromeira.com/bootstrap | bash
```

Full bootstrap (includes GUI applications)
```sh
curl -s pauloromeira.com/bootstrap | bash -s - --tags full
```

Run specific tags
```sh
curl -s pauloromeira.com/bootstrap | bash -s - --tags TAGS
```

Skip specific tags
```sh
curl -s pauloromeira.com/bootstrap | bash -s - --skip-tags SKIP_TAGS
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
