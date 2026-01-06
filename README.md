# My i3wm Rice Setup

This is my personalized **i3 window manager** setup including:

* Betterlockscreen lockscreen (works after sleep/hibernation)
* i3blocks status bar
* Picom compositor
* Wallpapers setup for lockscreen and desktop
* Custom keybindings and utilities

---

## 💻 Prerequisites

Install all required packages for i3wm, lockscreen, compositor, and utilities:

```bash
sudo apt update && sudo apt install -y \
build-essential git autoconf automake libtool pkg-config \
libxcb1-dev libxcb-image0-dev libxcb-util0-dev libxcb-xkb-dev \
libxkbcommon-dev libxkbcommon-x11-dev libxcb-randr0-dev \
libxcb-xinerama0-dev libxcb-xrm-dev libxcb-cursor-dev \
libpam0g-dev libev-dev libx11-dev libx11-xcb-dev libjpeg-dev \
feh imagemagick scrot i3blocks xss-lock picom
```

> ⚠️ `scrot` is required for screenshots (lockscreen blur/dim)
> ⚠️ `imagemagick` is required for image processing

---

## 🔐 Lock Screen Setup (Betterlockscreen)

Clone and install Betterlockscreen:

```bash
git clone https://github.com/betterlockscreen/betterlockscreen.git ~/betterlockscreen
cd ~/betterlockscreen
./install.sh user
```

> ⚠️ Make sure your PATH includes `~/.local/bin`:

```bash
echo 'export PATH="$PATH:$HOME/.local/bin"' >> ~/.bashrc
source ~/.bashrc
```

Set a wallpaper for the lockscreen:

```bash
betterlockscreen -u ~/Pictures/my-wallpaper.jpg
```

Enable automatic lock after sleep/hibernation by adding to i3 config:

```ini
# Lock after sleep/hibernation
exec --no-startup-id xss-lock -- betterlockscreen -l
```

Optionally, add blur/dim effect (if using screenshots):

```bash
betterlockscreen -u ~/Pictures/my-wallpaper.jpg --blur 5 --dim 30
```

---

## 🖥️ Compositor (Picom)

Picom enables transparency, shadows, and optional blur effects:

```ini
# Start on i3 launch
exec_always --no-startup-id picom --config ~/.config/picom/picom.conf --daemon
```

---

## 📊 i3blocks

Install i3blocks (already included in prerequisites) and autostart:

```ini
exec --no-startup-id i3blocks
```

Configure blocks in `~/.config/i3blocks/config`.

---

## ⚡ Autostart Utilities

```ini
exec --no-startup-id nm-applet
exec --no-startup-id dex --autostart --environment i3
```

---

## 🔧 Notes

* **Betterlockscreen** replaces i3lock-fancy and automatically locks the screen after sleep/hibernation.
* Blur and dim effects are optional and require `scrot` and `imagemagick`.
* Change lockscreen wallpaper by updating the path in the `betterlockscreen -u` command.
* All other utilities (xss-lock, picom, i3blocks) are automatically started on i3 launch.
* This setup works on Ubuntu/Mint-based systems.

---

✅ This README provides all commands to fully replicate my i3wm rice setup with Betterlockscreen.
