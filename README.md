### System bootstrap
```sh
curl -s pauloromeira.com/bootstrap | bash
```

### Commands
Run locally:
```sh
./provision.sh local [args] playbook
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
provision ansible localhost -m setup
```

### References
- tutorial: [Using Ansible to automate your Laptop and Desktop configs](https://www.youtube.com/watch?v=gIDywsGBqf4)
  - https://github.com/LearnLinuxTV/personal_ansible_desktop_configs
- https://github.com/geerlingguy/mac-dev-playbook
- https://medium.com/espinola-designs/manage-your-dotfiles-with-ansible-6dbedd5532bb
