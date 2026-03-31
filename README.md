# 🧩 i3wm + Polybar Rice (Linux Mint / Ubuntu)

A **fully working, minimal, and clean i3wm setup** powered by **Polybar and custom scripts**.

This setup is tested on **Linux Mint / Ubuntu-based systems** and focuses on:

- Simplicity
- Performance
- Clean UI
- Script-driven control

---

## ✨ Features

- i3 Window Manager (X11)
- Polybar (custom modules)
- Picom compositor
- Dunst notifications (custom themed)
- Rofi launcher
- Alacritty terminal
- Battery, Network, Bluetooth scripts
- i3lock + xss-lock (lightweight lock system)

---

## 📦 Installation (One Command)

```bash
git clone https://github.com/paulGitRoot/i3wm-setup.git
cd i3wm-setup
```
## important packages to install 
```bash
#!/usr/bin/env bash
set -e
echo "🚀 Starting i3wm rice setup..."
# Update system
sudo apt update
echo "📦 Installing packages..."
sudo apt install -y \
i3 i3lock xss-lock \
feh scrot dunst libnotify-bin \
rofi alacritty \
picom polybar \
nm-applet network-manager \
brightnessctl acpi \
git curl wget unzip \
fonts-jetbrains-mono \
papirus-icon-theme

echo "🔤 Installing Nerd Font..."
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts

if [ ! -f "JetBrainsMonoNerdFont-Regular.ttf" ]; then
    wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
    unzip -o JetBrainsMono.zip
    fc-cache -fv
fi

cd ~
```
## copying the config files
```bash
echo "📁 Copying configs..."

mkdir -p ~/.config/i3
mkdir -p ~/.config/polybar
mkdir -p ~/.config/dunst
mkdir -p ~/.config/picom
mkdir -p ~/.config/scripts

cp -r config/i3/* ~/.config/i3/
cp -r config/polybar/* ~/.config/polybar/
cp -r config/dunst/* ~/.config/dunst/
cp -r config/picom/* ~/.config/picom/

cp -r scripts/* ~/.config/scripts/

echo "⚙️ Making scripts executable..."
chmod +x ~/.config/scripts/*.sh

echo "✅ Setup complete!"
echo "👉 Reboot or log out and select i3 session."
```
