### System bootstrap
```sh
curl -s pauloromeira.com/bootstrap | sudo bash
```

### Commands
Run locally:
```sh
sudo ./provision local [args] playbook
```

Pull (always run):
```sh
sudo provision pull [args] [playbook]
```

Sync (run only if remote changed):
```sh
sudo provision sync [args] [playbook]
```

Run custom ansible command:
```sh
sudo provision ansible* [args]
```

### References
- tutorial: [Using Ansible to automate your Laptop and Desktop configs](https://www.youtube.com/watch?v=gIDywsGBqf4)
  - https://github.com/LearnLinuxTV/personal_ansible_desktop_configs
- https://medium.com/espinola-designs/manage-your-dotfiles-with-ansible-6dbedd5532bb
