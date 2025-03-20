```
# before anything else then restart
# /etc/wsl.conf
[interop]
appendWindowsPath = false
```

```
sudo apt update
sudo apt install build-essential
sudo apt install nodejs npm
sudo apt install stow
sudo apt install fzf
sudo apt install fzf-lua
sudo apt install rg
sudo apt install gnome-tweaks
sudo apt install nvim
```

```
sudo add-apt-repository ppa:kisak/kisak-mesa
# sudo apt-get update    seems not to be necessary, at least it was automatically done on my installation
sudo apt upgrade     #  this should ask to install multiple mesa packages from kisak

sudo apt install kitty
```

`fixed it by deleting `/lib/kitty/kitty/glfw-wayland.so