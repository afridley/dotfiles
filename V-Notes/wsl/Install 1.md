```
# before anything else then restart
# /etc/wsl.conf
[interop]
appendWindowsPath = false
```

```bash
sudo apt update
sudo apt install build-essential nodejs npm stow fzf fzf-lua rg gnome-tweakssudo apt install build-essential nodejs npm stow fzf fzf-lua ripgrep gnome-tweaks
```

```bash
sudo snap install nvim --classic
or
sudo snap install nvim --edge --classic
```

fzf-lua
```shell
sh -c "$(curl -s https://raw.githubusercontent.com/ibhagwan/fzf-lua/main/scripts/mini.sh)"
```

```bash
sudo add-apt-repository ppa:kisak/kisak-mesa
# sudo apt-get update    seems not to be necessary, at least it was automatically done on my installation
sudo apt upgrade     #  this should ask to install multiple mesa packages from kisak

sudo apt install kitty
```

```bash
alias chrome="/mnt/c/Program\ Files/BraveSoftware/Brave-Browser/Application/brave.exe"
```

`fixed it by deleting `/lib/kitty/kitty/glfw-wayland.so