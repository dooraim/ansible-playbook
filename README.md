# Ansible-Based Setup for Zsh (Powerlevel10k), Neovim, and Tmux

*Tested on Ubuntu 20.04, Ubuntu 24.04, Fedora, and macOS (arm64)*

This Ansible configuration automates the setup of a modern development environment consisting of **Zsh** (with **Starship**), **Neovim**, **Tmux**, and a set of CLI tools. It is designed to work on Ubuntu 20.04, Ubuntu 24.04, Fedora, Debian, and macOS, and assumes a local, non-root user environment for everything except the initial installation of Ansible and Zsh.

## Prerequisites

### Ubuntu / Debian

```bash
sudo apt update && sudo apt install ansible zsh make gcc build-essential unzip zip tar curl wget fontconfig sshfs -y
```

### Fedora

```bash
sudo dnf install ansible curl wget unzip tar zsh
sudo dnf install gcc g++ make
```

### macOS

```bash
brew install ansible
```

Create the config directory if it does not exist:

```bash
mkdir -p ~/.config
```

## Usage

Clone the repository and run the full playbook:

```bash
ansible-playbook local.yml
```

### Selective execution with tags

Each component is tagged so you can run only what you need:

```bash
# Single component
ansible-playbook local.yml --tags neovim
ansible-playbook local.yml --tags tmux
ansible-playbook local.yml --tags git

# Multiple components
ansible-playbook local.yml --tags git,zsh

# Everything except neovim
ansible-playbook local.yml --skip-tags neovim
```

Available tags:

| Tag | Description |
|---|---|
| `dirs` | Create local directories |
| `fonts` | Install Nerd Fonts |
| `zsh` | Zsh + Starship prompt |
| `peco` | peco interactive filter |
| `git` | Git global configuration |
| `tmux` | Tmux + TPM plugins |
| `pfetch` | pfetch system info tool |
| `packages` | CLI tools: fzf, lazygit, eza, bat, fd, ripgrep |
| `fzy` | fzy fuzzy finder |
| `npm` | Node.js via nvm |
| `ai-agents` | Claude Code and OpenCode |
| `neovim` | Neovim + config |

> **Note:** setup/cleanup tasks (`myapp` temp directory, OS info display, package version check) always run regardless of tags.

## Installed tools

- **Shell:** Zsh with Starship prompt
- **Editor:** Neovim (latest stable)
- **Terminal multiplexer:** Tmux with TPM
- **CLI tools:** fzf, lazygit, eza, bat, fd, ripgrep, fzy, peco, pfetch
- **Development:** Node.js (via nvm), npm packages
- **AI agents:** Claude Code, OpenCode

All configurations are placed in user-level directories (`~/.config`, `~/.zshrc`, `~/.tmux.conf`) — no `sudo` required after the initial setup.

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