# Linux Mint Animated Wallpapers

Make animated wallpapers work on Linux Mint by running videos on the desktop background using xwinwrap and mpv.

This repository contains a minimal startup script (startup.sh) and instructions to run an animated wallpaper at login. It uses an xwinwrap build (see installation note below) to embed a video on the background and mpv to play the video.

[Will enter picture here]

## Features

- Plays any video as your desktop wallpaper
- Starts automatically on login via Startup Applications
- Uses mpv for playback and a maintained xwinwrap fork for background embedding

## Requirements

- mpv
- xterm (used to trigger Mint's compositor refocus so desktop icons render above the animated wallpaper)
- wmctrl (optional; useful for window/stacking control)
- xwinwrap installed from the maintained fork at mmhobi7/xwinwrap (see below)

Note about xterm: the startup script uses xterm as a brief helper to force Mint to refocus the compositor so the desktop icons stay on the correct layer (above the animated wallpaper). This is intentional and required on some Mint configurations to preserve icon visibility.

## Install required packages

Install the Debian/Ubuntu/Mint packages for mpv, xterm and wmctrl:

```bash
sudo apt update
sudo apt install -y mpv xterm wmctrl
```

Important: xwinwrap is not installed from your distribution's apt in this repository. Install xwinwrap from the maintained fork and follow its README/installation guide:

- xwinwrap (maintained fork): https://github.com/mmhobi7/xwinwrap
- Follow the mmhobi7/xwinwrap README for build/installation instructions for your system.

## Setup

1. Create the AnimatedWallpapers folder and put your video there:

```bash
mkdir -p "$HOME/Videos/AnimatedWallpapers"
# Copy or move your chosen video into:
# $HOME/Videos/AnimatedWallpapers/YourVideo.mp4
```

2. Download the provided startup script (startup.sh) from this repository and place it where you want (for example, `~/Videos/AnimatedWallpapers/startup.sh`). Make it executable:

```bash
# example: download to ~/AnimatedWallpapers (adjust path as desired)
You can clone the repo to get the shell file or just copy it into your own startup.sh
chmod +x "$HOME/Videos/AnimatedWallpapers/startup.sh" (or whatever your path is)
```

3. Edit `startup.sh` if you want to change the path or filename of the video. By default, the script expects your video in:
`$HOME/Videos/AnimatedWallpapers`. Rename the video there or update the script to point to your actual path.

Notes:
- Use a full absolute path inside the Startup Applications entry (do not rely on `~`).
- If you run the script with `sudo`, be aware the home directory may change; place and configure the startup script for the regular user account used to log into the desktop.

## Add to Startup Applications (Linux Mint)

Open "Startup Applications" and add a new entry:

- Name: Animated Wallpaper (any name you prefer)
- Command: /full/path/to/startup.sh
- Comment: optional description
- Startup delay: 0

<img width="753" height="312" alt="image" src="https://github.com/user-attachments/assets/9dfbe6f6-d5b0-4057-acb3-ae2d4f480709" /> 

## Usage

- Test the script manually in a graphical session to verify it behaves as expected:

```bash
/full/path/to/startup.sh
```

- If it works, add the same full command to Startup Applications so it runs automatically at login.

## Contributing

Contributions and improvements are welcome. If you submit changes, please include a clear description of what changed and why.

## License

MIT License — feel free to reuse and adapt.

## Acknowledgements

- mpv — https://mpv.io/
- mmhobi7/xwinwrap — https://github.com/mmhobi7/xwinwrap
