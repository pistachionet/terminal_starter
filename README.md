# Terminal Starter

My macOS terminal setup — tmux, neovim, yazi, lazygit, opencode.

## Setup

```bash
# 1. Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 2. Clone
git clone https://github.com/pistachionet/terminal_starter.git ~/terminal_starter

# 3. Install tools
brew install tmux neovim yazi lazygit go node diff-so-fancy

# 4. Oh-My-Zsh + plugins + theme
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/MichaelAqwortel/zsh-you-should-use ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/you-should-use
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

# 5. Copy configs
REPO=~/terminal_starter
cp "$REPO/zsh/.zshrc" ~/.zshrc
cp "$REPO/p10k/.p10k.zsh" ~/.p10k.zsh
cp "$REPO/tmux/.tmux.conf" ~/.tmux.conf
cp -r "$REPO/nvim" ~/.config/nvim
mkdir -p ~/Library/Application\ Support/lazygit && cp "$REPO/lazygit/config.yml" ~/Library/Application\ Support/lazygit/config.yml
mkdir -p ~/.config/opencode/skills && cp -r "$REPO/opencode/skills/"* ~/.config/opencode/skills/
mkdir -p ~/.local/bin && cp "$REPO/bin/create" ~/.local/bin/create && chmod +x ~/.local/bin/create

# 6. Tmux plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins

# 7. Restart terminal and edit ~/.zshrc + ~/.gitconfig with your info
```

## File Map

| Repo | Destination |
|---|---|
| `zsh/.zshrc` | `~/.zshrc` |
| `p10k/.p10k.zsh` | `~/.p10k.zsh` |
| `tmux/.tmux.conf` | `~/.tmux.conf` |
| `nvim/` | `~/.config/nvim/` |
| `lazygit/config.yml` | `~/Library/Application Support/lazygit/config.yml` |
| `opencode/skills/` | `~/.config/opencode/skills/` |
| `bin/create` | `~/.local/bin/create` |
| `iterm2/*.plist` | Import via iTerm2 settings |

## Usage

```bash
cd ~/any-project && create
```

Opens a tmux session with: terminal, yazi, opencode, lazygit.
