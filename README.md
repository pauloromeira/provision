### System bootstrap
```sh
curl -s pauloromeira.com/bootstrap | bash
```
OR
```sh
wget -qO - pauloromeira.com/bootstrap | bash
```

Run specific tags
```sh
curl -s pauloromeira.com/bootstrap | bash -s - --tags TAGS
```

Skip specific tags
```sh
curl -s pauloromeira.com/bootstrap | bash -s - --skip-tags SKIP_TAGS
```

### Commands (after bootstrap)
Run locally:
```sh
provision local
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
- tutorial: [Using Ansible to automate your Laptop and Desktop configs](https://www.youtube.com/watch?v=gIDywsGBqf4)
  - https://github.com/LearnLinuxTV/personal_ansible_desktop_configs
- https://github.com/geerlingguy/mac-dev-playbook
- https://git.todevski.com/ansible/playbooks/workstation/
- https://medium.com/espinola-designs/manage-your-dotfiles-with-ansible-6dbedd5532bb
