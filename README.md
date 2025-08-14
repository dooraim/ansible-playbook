[![macOS ARM64](https://github.com/dooraim/ansible-playbook/actions/workflows/macos-arm64.yml/badge.svg?branch=fedora)](https://github.com/dooraim/ansible-playbook/actions/workflows/macos-arm64.yml)
[![Ubuntu AMD64 20.04](https://github.com/dooraim/ansible-playbook/actions/workflows/ubuntu-amd64-2004.yml/badge.svg?branch=fedora)](https://github.com/dooraim/ansible-playbook/actions/workflows/ubuntu-amd64-2004.yml)
[![Ubuntu AMD64 24.04](https://github.com/dooraim/ansible-playbook/actions/workflows/ubuntu-amd64-2404.yml/badge.svg?branch=fedora)](https://github.com/dooraim/ansible-playbook/actions/workflows/ubuntu-amd64-2404.yml)
[![Ubuntu ARM64 24.04](https://github.com/dooraim/ansible-playbook/actions/workflows/ubuntu-arm64-2404.yml/badge.svg?branch=fedora)](https://github.com/dooraim/ansible-playbook/actions/workflows/ubuntu-arm64-2404.yml)


# Ansible-Based Setup for Zsh (Powerlevel10k), Neovim, and Tmux

*Tested on Ubuntu 20.04 and Ubuntu 24.04*

This Ansible configuration automates the setup of a modern development environment consisting of **Zsh** (with **Powerlevel10k**), **Neovim**, and **Tmux**. It is designed to work on both **Ubuntu 20.04** and **Ubuntu 24.04**, and assumes a local, non-root user environment for everything except the initial installation of Ansible and Zsh.

To begin, you must install Ansible and Zsh using the following command:

```bash
sudo apt update && sudo apt install ansible zsh -y
```

Once installed, clone the Ansible playbook repository or prepare your own `playbook.yml`. The playbook is executed locally with:

```bash
ansible-playbook local.ym
```

The playbook will install Neovim, Tmux, and the required plugins (like `packer.nvim` for Neovim) in the user's home directory without requiring further use of `sudo`. It also installs **Oh My Zsh** and configures the **Powerlevel10k** theme to provide a powerful and visually appealing shell experience.

To make Zsh the default shell, the playbook includes the command:

```bash
chsh -s $(which zsh)
```

This change takes effect after restarting your terminal or logging out and back in.

All configurations are placed in user-level directories such as `~/.config`, `~/.zshrc`, and `~/.tmux.conf`, ensuring the setup works even in environments where root access is restricted. This approach makes the setup ideal for personal machines, virtual environments, or shared systems.

## Explanation of the Command to Add and Configure a User

The following Linux shell command is used to create a new user and assign them to the same secondary groups as an existing user:

```bash
sudo adduser norlando && sudo usermod -aG $(id -nG dvdk | tr ' ' '\n' | grep -v '^dvdk$' | paste -sd, -) norlando
```

This command performs two main actions in sequence. First, it creates a new user named `norlando`. This is accomplished using the `adduser` command, which is a user-friendly interactive utility for adding users on Debian-based systems such as Ubuntu. When this command is executed with `sudo`, it prompts for the new user's password and some optional user details, such as full name and contact information.

The `&&` operator between the two commands ensures that the second part will only run if the first command—creating the user—completes successfully. This is a common practice to prevent the execution of subsequent commands when an earlier critical step fails.

The second part of the command adds the new user (`norlando`) to a set of groups that are determined dynamically. Specifically, it examines the groups to which an existing user (`dvdk`) belongs. Using `id -nG dvdk`, the command retrieves a space-separated list of all groups that `dvdk` is a member of. This list includes both the primary group (usually named after the user) and any secondary groups.

To refine this list, `tr ' ' '\n'` is used to convert the space-separated output into a newline-separated list, making it easier to process with `grep`. The `grep -v '^dvdk$'` command filters out the primary group `dvdk` from the list, as it is typically a private group that should not be shared with other users. What remains is a clean list of secondary groups.

Finally, `paste -sd, -` joins this newline-separated list into a single comma-separated string, which is the format expected by the `usermod -aG` command. The `-aG` flags tell `usermod` to append (`-a`) the user to the specified supplementary groups (`-G`) without removing them from existing ones.

# Fedora

Install the following packages

```bash
$ sudo dnf install ansible curl wget unzip tar zsh
$ sudo dnf install gcc g++ make
```