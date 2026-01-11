# My i3wm Rice Setup (Full Lock & Power Working Guide)

This repository documents my **fully working i3wm setup** on Linux Mint / Ubuntu-based systems, including the **exact steps required to make Betterlockscreen actually work**.

This is not a theoretical guide — it reflects the **real troubleshooting and fixes** needed after a clean OS install.

---

## 🧩 What This Setup Includes

- i3 Window Manager
- Betterlockscreen (works after suspend/hibernate)
- i3lock-color (required by betterlockscreen)
- Optional i3lock-fancy support
- i3blocks status bar
- Picom compositor
- Brightness & volume key support
- Power management (sleep, lid, brightness)
- Wallpaper support (desktop + lockscreen)

---

## 💻 Base System Requirements

- Linux Mint / Ubuntu-based distro
- X11 session (**Wayland not supported**)
- sudo privileges
- Internet access

---

## 📦 STEP 1: Install Base Runtime Packages

These packages are **required even before touching Betterlockscreen**:

```bash
sudo apt update
sudo apt install -y \
i3lock imagemagick xss-lock \
feh scrot dunst nm-applet dex \
i3blocks picom \
powerdevil kded5 plasma-workspace libnotify-bin \
brightnessctl
```
## 🔐 STEP 2: Install Betterlockscreen (Manual Method – WORKING)

This is the exact method that worked reliably after a clean install.
```bash
cd ~/Downloads
git clone https://github.com/pavanjadhaw/betterlockscreen.git
cd betterlockscreen
sudo make install
```
Verify files:
```bash
ls -l ~/Downloads/betterlockscreen
```
### Manually install the binary (important):
```bash
sudo cp ~/Downloads/betterlockscreen/betterlockscreen /usr/local/bin/
sudo chmod +x /usr/local/bin/betterlockscreen
```
### Verify installation:
```bash
which betterlockscreen
# Expected output:
# /usr/local/bin/betterlockscreen
```
### Add /usr/local/bin to PATH permanently:
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```
## 🚨 STEP 3: checking
### Running:
```bash
betterlockscreen -l
```
## 🧱 STEP 4: Install Build Dependencies for i3lock-color
```bash
sudo apt install -y \
build-essential autoconf pkg-config \
libx11-dev libxinerama-dev libxrandr-dev \
libxcb1-dev libxcb-xkb-dev libxcb-randr0-dev \
libxcb-keysyms1-dev libev-dev libpam0g-dev \
libcairo2-dev libfontconfig1-dev \
libxcb-composite0-dev libxcb-image0-dev \
libxcb-util0-dev libxcb-xrm-dev \
libx11-xcb-dev libxkbcommon-dev \
libxkbcommon-x11-dev libxcb-xinerama0-dev \
libjpeg-dev libgif-dev
```
## 🔨 STEP 5: Build & Install i3lock-color (REQUIRED)
```bash
cd ~/Downloads
git clone https://github.com/Raymo111/i3lock-color.git
cd i3lock-color
sudo ./install-i3lock-color.sh
```
### Ensure compatibility (important):
```bash
sudo ln -s /usr/bin/i3lock /usr/bin/i3lock-color
```
### Verify:
```bash
i3lock --version
```
## 🔐 STEP 6: Final Betterlockscreen Setup

### Set wallpaper and generate lockscreen assets:
```bash
betterlockscreen -u ~/Pictures/my-wallpaper.jpg --blur 5 --dim 30
```
### Test lockscreen:
```bash
betterlockscreen -l
```
## 💤 STEP 7: Lock After Suspend / Hibernate (CRITICAL)
### Add this to your i3 config:
```bash
exec --no-startup-id xss-lock --transfer-sleep-lock -- betterlockscreen -l
```
### This ensures locking after:

Suspend

Hibernate

Laptop lid close
### 🖥️ Picom (Compositor)
```bash 
exec_always --no-startup-id picom --config ~/.config/picom/picom.conf --daemon
```
### 📊 i3blocks Status Bar
```bash
bar {
    status_command i3blocks
}
```
### Config file location:
```bash
~/.config/i3blocks/config
```
## 🔆 STEP 8: Fix Brightness Keys After Reinstall
### Allow brightness control without password:
```bash
sudo visudo
```
### Add:
```bash
paul ALL=(ALL) NOPASSWD: /usr/bin/brightnessctl
```
### i3 keybindings:
```bash
bindsym XF86MonBrightnessUp exec --no-startup-id sudo brightnessctl set +10%
bindsym XF86MonBrightnessDown exec --no-startup-id sudo brightnessctl set 10%-
```
### ⚡ Recommended i3 Autostart Services
```bash
exec --no-startup-id nm-applet
exec --no-startup-id dex --autostart --environment i3
exec --no-startup-id dunst
exec --no-startup-id xfsettingsd --sm-client-disable
exec --no-startup-id xfce4-power-manager
```
