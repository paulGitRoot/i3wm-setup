# My i3wm Rice Setup

This is my personalized **i3 window manager** setup including:

* i3lock-fancy lockscreen
* i3blocks status bar
* Picom compositor
* Wallpapers and screenshots setup for lockscreen
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
feh imagemagick scrot i3blocks i3lock xss-lock picom
```

> ⚠️ `scrot` is required for screenshots (lockscreen blur/dim)
> ⚠️ `imagemagick` is required for image processing

---

## 🔐 Lock Screen Setup (i3lock-fancy)

Clone, build, and install i3lock-color:

```bash
git clone https://github.com/Raymo111/i3lock-color.git ~/i3lock-color
cd ~/i3lock-color
rm -rf build
./build.sh
sudo cp build/i3lock /usr/bin/i3lock
```

Create a lock script at `~/bin/lock.sh`:

```bash
#!/bin/bash
# Take a screenshot and lock using i3lock-fancy
SCROT=$(which scrot)
if [ -x "$SCROT" ]; then
    TMPIMG="$HOME/.cache/i3lock/screen.png"
    mkdir -p "$(dirname "$TMPIMG")"
    $SCROT -q 100 "$TMPIMG"
    i3lock-fancy --screen "$TMPIMG"
else
    i3lock-fancy
fi
```

Make it executable:

```bash
mkdir -p ~/bin
chmod +x ~/bin/lock.sh
```

Bind it in i3 config for manual lock and hibernation/sleep:

```ini
# Manual lock
bindsym $mod+l exec --no-startup-id ~/bin/lock.sh

# Lock after sleep/hibernation
exec --no-startup-id xss-lock -- ~/bin/lock.sh
```

---

## 🌄 Wallpaper Setup

Set a static wallpaper using `feh`:

```bash
feh --bg-fill ~/Pictures/my-wallpaper.jpg
```

Add to i3 config for autostart:

```ini
exec --no-startup-id feh --bg-fill ~/Pictures/my-wallpaper.jpg
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

* **i3lock-fancy** is used for lockscreen blur/dim effects.
* Scrot and Imagemagick are required for the blur/dim.
* The wallpaper can be changed by updating the path in the `feh` command.
* This setup works on Ubuntu/Mint-based systems.
* All other utilities (xss-lock, picom, i3blocks) are automatically started on i3 launch.

---

✅ This README provides all commands to fully replicate my i3wm rice setup.
