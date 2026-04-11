# Terminal Config

My custom terminal setup for macOS. Clone this repo and follow the steps below to get up and running.

## Prerequisites

Install [Homebrew](https://brew.sh) first:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## Step 1: Clone this repo

Clone anywhere you want — it doesn't matter where:

```bash
git clone <your-repo-url> ~/terminal_config
cd ~/terminal_config
```

## Step 2: Install tools

```bash
brew install tmux neovim yazi lazygit go node diff-so-fancy
```

## Step 3: Install Oh-My-Zsh + plugins + theme

```bash
# Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/MichaelAqwortel/zsh-you-should-use ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/you-should-use

# Powerlevel10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
```

## Step 4: Copy config files to their correct locations

```bash
REPO=~/terminal_config  # or wherever you cloned it

# Shell
cp "$REPO/zsh/.zshrc" ~/.zshrc
cp "$REPO/p10k/.p10k.zsh" ~/.p10k.zsh

# Tmux
cp "$REPO/tmux/.tmux.conf" ~/.tmux.conf

# Neovim
mkdir -p ~/.config
cp -r "$REPO/nvim" ~/.config/nvim

# Lazygit
mkdir -p ~/Library/Application\ Support/lazygit
cp "$REPO/lazygit/config.yml" ~/Library/Application\ Support/lazygit/config.yml

# OpenCode skills (only if using opencode)
mkdir -p ~/.config/opencode/skills
cp -r "$REPO/opencode/skills/"* ~/.config/opencode/skills/

# Create script
mkdir -p ~/.local/bin
cp "$REPO/bin/create" ~/.local/bin/create
chmod +x ~/.local/bin/create

# iTerm2 settings (import manually via iTerm2 > Settings > General > Settings > Load from folder)
# The plist is at: $REPO/iterm2/com.googlecode.iterm2.plist
```

## Step 5: Install tmux plugin manager + plugins

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins
```

## Step 6: Edit personal settings

Update these files with your info:

- `~/.zshrc` — update any machine-specific paths (conda, Antigravity, etc.)
- Set up your `~/.gitconfig` with your name/email

## Step 7: Restart terminal

Close and reopen your terminal. Powerlevel10k will prompt you to configure your theme if needed.

## Usage

Navigate to any project directory and run:

```bash
create
```

This spins up a tmux session with 4 windows:
- **0: terminal** — regular shell
- **1: yazi** — file manager
- **2: opencode** — AI coding assistant
- **3: lazygit** — git UI

## File Map

| Repo File | Goes To |
|---|---|
| `zsh/.zshrc` | `~/.zshrc` |
| `p10k/.p10k.zsh` | `~/.p10k.zsh` |
| `tmux/.tmux.conf` | `~/.tmux.conf` |
| `nvim/` | `~/.config/nvim/` |
| `lazygit/config.yml` | `~/Library/Application Support/lazygit/config.yml` |
| `opencode/skills/` | `~/.config/opencode/skills/` |
| `bin/create` | `~/.local/bin/create` |
| `iterm2/*.plist` | Import via iTerm2 settings |
