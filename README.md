🧩 My i3wm + Polybar Setup (Linux Mint / Ubuntu)

This repository documents my fully working i3wm rice setup using Polybar, custom scripts, and a minimal locking setup.

This is a real-world tested setup, not theoretical — everything here reflects what actually works after a clean install.

✨ What This Setup Includes
i3 Window Manager (X11)
Polybar (custom modules + scripts)
i3lock (simple lock system)
xss-lock (auto lock on suspend/lid close)
Picom compositor
Dunst notifications (custom themed)
Custom battery / network / bluetooth modules
Rofi launcher
Alacritty terminal
Brightness & volume key support
💻 Requirements
Linux Mint / Ubuntu-based distro
X11 session (Wayland not supported)
sudo privileges
Internet connection
📦 STEP 1: Install Core Packages
sudo apt update
sudo apt install -y \
i3 i3lock xss-lock \
feh scrot dunst libnotify-bin \
rofi alacritty \
picom \
nm-applet network-manager \
brightnessctl acpi \
git curl wget \
fonts-jetbrains-mono \
papirus-icon-theme
🧱 STEP 2: Install Polybar
sudo apt install polybar
🎨 STEP 3: Fonts & Icons (IMPORTANT)

Make sure you have:

JetBrainsMono Nerd Font (for icons)
Papirus-Dark icon theme

If Nerd Font icons are missing:

mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts

# Download Nerd Font (JetBrainsMono)
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
unzip JetBrainsMono.zip
fc-cache -fv
🔔 STEP 4: Dunst (Notifications)

Enable dunst in i3:

exec --no-startup-id dunst

Test:

notify-send -i dialog-information "Test" "Notifications working"
🔒 STEP 5: Lock Screen (Simple & Working)

No more betterlockscreen — using i3lock + xss-lock.

Add to i3 config:

exec --no-startup-id xss-lock --transfer-sleep-lock -- i3lock -i ~/Pictures/mainWallpaper.png

Manual lock:

bindsym $mod+l exec --no-startup-id i3lock -i ~/Pictures/mainWallpaper.png
🖥️ STEP 6: Picom (Compositor)
exec_always --no-startup-id picom --config ~/.config/picom/picom.conf --daemon
📊 STEP 7: Polybar Setup

Enable Polybar in i3:

exec_always --no-startup-id polybar top
🔧 Custom Modules (IMPORTANT)

This setup uses custom scripts instead of built-in modules.

Example Modules
[module/bluetooth]
type = custom/text
content = ""
click-left = ~/.config/scripts/toggle-bluetooth.sh

[module/network]
type = custom/text
content = ""
click-left = ~/.config/scripts/toggle-network.sh

[module/battery]
type = custom/script
exec = ~/.config/scripts/battery.sh
interval = 5
⚠️ IMPORTANT NOTE

After creating scripts:

chmod +x ~/.config/scripts/*.sh

If you forget this → nothing will work.

🔋 Battery Script Features
Icon changes based on battery level
Colors:
🟢 60–100 → Green
🟠 25–59 → Orange
🔴 <25 → Red
📡 Toggle Scripts (Network / Bluetooth)

Scripts allow:

Click → open manager (impala-nm / bluetui)
Click again → close them
⚡ STEP 8: Brightness Keys Fix

Allow brightness without password:

sudo visudo

Add:

paul ALL=(ALL) NOPASSWD: /usr/bin/brightnessctl

Keybindings:

bindsym XF86MonBrightnessUp exec --no-startup-id brightnessctl set +10%
bindsym XF86MonBrightnessDown exec --no-startup-id brightnessctl set 10%-
🚀 Recommended i3 Autostart
exec --no-startup-id nm-applet
exec --no-startup-id dex --autostart --environment i3
exec --no-startup-id dunst
exec --no-startup-id xfsettingsd --sm-client-disable
exec --no-startup-id xfce4-power-manager
🧠 Notes
This setup is script-driven, not default modules
Polybar replaces i3blocks completely
Terminal apps (like bluetui / impala-nm) run inside Alacritty/Kitty
Floating rules are handled in i3 config
📁 Important Paths
~/.config/i3/config
~/.config/polybar/config.ini
~/.config/scripts/
~/.config/dunst/dunstrc
