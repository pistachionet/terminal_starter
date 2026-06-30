# Terminal Starter (No Agent)

My macOS terminal setup — tmux, neovim, yazi, lazygit. No coding agent tools included.

## Setup

```bash
# 1. Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 2. Clone (use this branch)
git clone -b free__from_coding_agent https://github.com/pistachionet/terminal_starter.git ~/terminal_starter

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
mkdir -p ~/.local/bin && cp "$REPO/bin/create" ~/.local/bin/create && chmod +x ~/.local/bin/create

# 6. Tmux plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins

# 7. Restart terminal and edit ~/.zshrc + ~/.gitconfig with your info
```

## Configuring the Agent Window

The `create` script has a configurable `AGENT_CMD` variable at the top of `~/.local/bin/create`.

### Option A: No agent tool (default)

Leave it empty. You get a 3-window layout: terminal, yazi, lazygit.

```bash
AGENT_CMD=""
```

### Option B: Add a tool later

Set `AGENT_CMD` to whatever you install. A 4th "agent" window will appear automatically.

```bash
# OpenCode
AGENT_CMD="opencode"

# GitHub Copilot CLI
AGENT_CMD="gh copilot"

# Aider
AGENT_CMD="aider"

# Claude Code
AGENT_CMD="claude"

# Any other tool
AGENT_CMD="your-tool-here"
```

### Option C: Remove window 2 permanently

If you never want an agent window, delete these lines from `~/.local/bin/create`:

```bash
# Window 2: agent tool (optional)
if [ -n "$AGENT_CMD" ]; then
  tmux new-window -t "$SESSION_NAME" -n "agent" -c "$PWD"
  tmux send-keys -t "$SESSION_NAME:agent" "$AGENT_CMD" Enter
fi
```

And delete the `AGENT_CMD` variable at the top.

## File Map

| Repo | Destination |
|---|---|
| `zsh/.zshrc` | `~/.zshrc` |
| `p10k/.p10k.zsh` | `~/.p10k.zsh` |
| `tmux/.tmux.conf` | `~/.tmux.conf` |
| `nvim/` | `~/.config/nvim/` |
| `lazygit/config.yml` | `~/Library/Application Support/lazygit/config.yml` |
| `bin/create` | `~/.local/bin/create` |
| `iterm2/*.plist` | Import via iTerm2 settings |

## Usage

```bash
cd ~/any-project && create
```

Opens a tmux session with: terminal, yazi, lazygit (+ agent if configured).
