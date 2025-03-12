# Custom Kitty + Zsh Setup for MacOS (Hacker Theme, Aliases, & More)
- [Custom Kitty + Zsh Setup for MacOS (Hacker Theme, Aliases, \& More)](#custom-kitty--zsh-setup-for-macos-hacker-theme-aliases--more)
  - [Things to install + usefull add-ons](#things-to-install--usefull-add-ons)
  - [Kitty Setup](#kitty-setup)
    - [Connecting Kitty with Zsh \& Making Aliases Executable](#connecting-kitty-with-zsh--making-aliases-executable)
    - [Installing fonts for themes](#installing-fonts-for-themes)
    - [**⏰ Reminder Script (`remind.sh`)**](#-reminder-script-remindsh)
    - [**🎨 Easy Theme Switching in Kitty (`change_theme`)**](#-easy-theme-switching-in-kitty-change_theme)
      - [**🖋 Font Handling \& `default-font.conf`**](#-font-handling--default-fontconf)
  - [**📂 Custom File Handling in Kitty `open-actions.conf`**](#-custom-file-handling-in-kitty-open-actionsconf)
    - [**🖼️ Open Images in Fullscreen Overlay**](#️-open-images-in-fullscreen-overlay)
    - [**📁 Open Directories in a New Tab or VS Code**](#-open-directories-in-a-new-tab-or-vs-code)
    - [**⚙️ Run Executable Files**](#️-run-executable-files)
  - [Zsh Setup](#zsh-setup)
    - [**📂 Quality-of-Life Aliases**](#-quality-of-life-aliases)
    - [**🔊 Sound Notifications for Commands**](#-sound-notifications-for-commands)
    - [**🌍 Quick Google Search in Terminal**](#-quick-google-search-in-terminal)
  - [Example config files](#example-config-files)
    - [`kitty.conf`](#kittyconf)
    - [`.zshrc`](#zshrc)
- [Hacker Terminal Theme for Kitty](#hacker-terminal-theme-for-kitty)

Customize your terminal with a powerful Kitty + Zsh setup for macOS. This repo includes a hacker-inspired dark theme, custom aliases, file handling with open-actions.conf, and automation to boost your terminal workflow.

## Things to install + usefull add-ons
1. Homebrew
2. Kitty
3. kitten themes
4. Starship
5. zsh-autosuggestions
6. node + nvm
7. PostgreSQL
8. Cargo + Rust
9. Docker + docker-compose + docker-credential-helper
10. ddgr (get browser search results in your terminal)
11. git + gh
12. certbot
13. python

## Kitty Setup

### Connecting Kitty with Zsh & Making Aliases Executable
To integrate Kitty with Zsh, check your ~/.zshrc file. Aliases are set up for scripts to make them easier to run.

✅ Make Scripts Executable
Before running the scripts, ensure they have execution permissions:

```sh
chmod +x <path_to_script>
```
Replace <path_to_script> with the actual script file (e.g., ~/.config/kitty/select_theme.sh).

```sh
alias change_theme="~/.config/kitty/select_theme.sh" 
alias remind="~/.config/kitty/remind.sh"
```

💡 Now you can run them using their aliases instead of full paths! 🚀

---

### Installing fonts for themes
You need to download and install the required NerdFonts to the system in order to get them in the terminal. Visit the official Nerd Font website to download fonts.
- 3270 Nerd Font
- JetBrainsMono Nerd Font

---

### **⏰ Reminder Script (`remind.sh`)**  
Set a notification after a specified time. Supports **seconds (s), minutes (m), hours (h), and days (d)**.  

**Usage:**  
```sh
remind -t 5m "Stretch your legs!"
```
💡 This will notify you in **5 minutes** with the message **"Stretch your legs!"**.  

---

### **🎨 Easy Theme Switching in Kitty (`change_theme`)**  
Easily switch themes in **Kitty terminal** and reload configurations. You can select from over **300 themes** provided by `kitten themes` or use your own custom themes. The default theme offers excellent readability, while the dark theme delivers full-on hacker vibes. 😎

When a theme is selected, it updates `current-theme.conf`, which is then read by `kitty.conf` to apply the changes.  

#### **🖋 Font Handling & `default-font.conf`**  
- **Custom fonts** for themes are loaded via `default-font.conf`.  
- If no font is specified in your custom theme, it falls back to the font set in `default-font.conf`.  
- ⚠️ **Directly setting a font in `kitty.conf` will override any font from your custom themes (`/themes` folder).**  
- `default-font.conf` is loaded **after** `current-theme.conf`, ensuring fonts from custom themes are set **before** the fallback font is applied.  

**Usage:**  
```sh
change_theme
```
This opens the **Kitty theme selector** and reloads settings.  

## **📂 Custom File Handling in Kitty `open-actions.conf`**  

These rules control how **Kitty** handles different file types when clicked inside the terminal.  

You **don’t** need to add `include open-actions.conf` in your `kitty.conf`—simply create an `open-actions.conf` in `~/.config/kitty/`, define your file handling rules, and Kitty will automatically apply them.  

📖 **[Learn more about Kitty's open-actions here](https://sw.kovidgoyal.net/kitty/open_actions/)**.  

### **🖼️ Open Images in Fullscreen Overlay**  
Clicking on an image will display it **inside Kitty** using `kitten icat`.  
```ini
protocol file
mime image/*
action launch --type=overlay kitten icat --hold ${FILE_PATH}
```
💡 **Hold mode** keeps the image visible until closed.  

---

### **📁 Open Directories in a New Tab or VS Code**  
Clicking a folder will:  
1. **Open it in a new Kitty tab**  
2. **Launch VS Code in the background**  
```ini
protocol file
mime inode/directory
action launch --type=tab --cwd $FILE_PATH
action launch --type=background code $FILE_PATH
```
💡 Modify the last line to open in another editor (e.g., `nvim`, `vim`).  

---

### **⚙️ Run Executable Files**  
Clicking on an **executable file** (Linux binary or Windows `.exe`) will launch it in a separate window.  
```ini
protocol file
mime inode/executable,application/vnd.microsoft.portable-executable
action launch --hold --type=os-window $FILE_PATH
```
💡 The `--hold` flag keeps the window open after execution.  

## Zsh Setup

### **📂 Quality-of-Life Aliases**  
- **Git Shortcuts:**  
  ```sh
  gall   # git add .
  gc     # git commit -am "..."
  gp     # git push
  gco    # git checkout
  gb     # git branch
  ```
- **Improved `ls` (with colors & hyperlinks):**  
  ```sh
  alias ls='gls --color=auto --hyperlink=auto'
  ```

- **Auto-run `ls` after `cd`:**  
  ```sh
  function chpwd() { ls }
  ```

---

### **🔊 Sound Notifications for Commands**  
Plays a **success** or **error sound** after each command execution.  
- ✅ **Success:** **Blow.aiff**  
- ❌ **Failure:** **Funk.aiff**  

---

### **🌍 Quick Google Search in Terminal**  
```sh
google "how to use zsh"
```
💡 **Opens Google with your search query.**  

## Example config files

### `kitty.conf`

```sh
# BEGIN_KITTY_THEME
# Default
include current-theme.conf
# END_KITTY_THEME

# SET DEFAULT FONT
include default-font.conf

# Config options different from defaults:
active_tab_font_style      (True, False)
active_tab_title_template  {title}
allow_remote_control       y
cursor_stop_blinking_after 3.0
dynamic_background_opacity True
inactive_tab_font_style    (False, True)
inactive_text_alpha        0.7
initial_window_height      720
initial_window_width       1280
mouse_hide_wait            5.0
scrollback_lines           2500
strip_trailing_spaces      smart
tab_activity_symbol        ⁂
tab_bar_align              center
tab_bar_min_tabs           1
tab_fade                   0.8
tab_powerline_style        slanted
tab_separator              " │ "
tab_title_template         {title} [{index}]{fmt.fg.magenta}{fmt.bold}{activity_symbol}{fmt.nobold}
update_check_interval      6.0
window_border_width        2.5
window_padding_width       2.0
# Added shortcuts:
map cmd+shift+r load_config_file
```

### `.zshrc`

```sh
#### Variables and OS Changes ####
eval "$(starship init zsh)"
export CLICOLOR=1
alias ls='gls --color=auto --hyperlink=auto'

# Add custom theme selector script
alias change_theme="~/.config/kitty/select_theme.sh" 

# Add custom remind script
alias remind="~/.config/kitty/remind.sh"

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

alias gall='git add .'
alias gc='git commit -am'
alias gp='git push'
alias gco='git checkout'
alias gb='git branch'

# Run ls after changing the directory
function chpwd() {
  ls
}

# Command ran after every execution changing sound based on success or failure of the execution
precmd() {
  if [[ $? -eq 0 ]]; then
    (afplay /System/Library/Sounds/Blow.aiff &)
  else
    (afplay /System/Library/Sounds/Funk.aiff &)
  fi
}

# Search google
google() {
  query=$(echo "$*" | sed 's/ /+/g')
  open "https://www.google.com/search?q=$query"
}
```

# Hacker Terminal Theme for Kitty
This hacker-inspired dark theme for Kitty brings a high-contrast, cyberpunk, and matrix-style aesthetic to your terminal.

```sh
# === General Colors ===
background            #000000  
foreground            #00FF00  
cursor                #00FF00  
cursor_text_color     #000000  
selection_background  #0044BB  
selection_foreground  #00FF00  

# === ANSI Colors ===
color0   #000000  
color8   #005500  

color1   #00AA00  
color9   #00FF00  

color2   #00CC00  
color10  #33FF33  

color3   #009900  
color11  #00CC00  

color4   #00AABB  
color12  #00AADD  

color5   #007700  
color13  #00AA00  

color6   #007700  
color14  #00AA00  

color7   #00FF00  
color15  #99FF99  

# === UI Colors ===
active_border_color   #00FF00  
inactive_border_color #005500  
tab_bar_background    #000000  


# === Fonts ===
font_family         3270 Nerd Font
bold_font           3270 Nerd Font Propo
italic_font         3270 Nerd Font Mono
bold_italic_font    3270 Nerd Font Propo
font_size           16.0
```