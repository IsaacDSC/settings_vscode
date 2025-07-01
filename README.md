# VS Code Settings

A carefully curated VS Code configuration focused on a clean, minimal, and productive development environment.

## ✨ Features

- **Clean UI**: Hidden activity bar, status bar, and minimap for distraction-free coding
- **Custom Styling**: Elegant UI customizations with transparency and vibrancy effects
- **JetBrains Mono Font**: Consistent typography across editor and terminal
- **File Nesting**: Organized file explorer with smart grouping patterns
- **Optimized Performance**: Smooth scrolling and animations for better user experience

## 🎨 Theme & Appearance

- Uses **Default Dark Modern** theme with custom accent colors
- **Vibrancy effects** with 96% opacity for a modern look
- **Hidden window frame** with custom traffic light positioning
- **Green accent** for active tabs and highlights

## 📦 Required Extensions

To get the full experience, install these VS Code extensions:

- **APC Customize UI++** - Advanced UI customization
- **Symbols** - Enhanced file icons and explorer styling  
- **Min Theme** - Minimal theme foundation
- **Bearded Icons** - Beautiful file icons (set as icon theme)
- **VS Code Animations** - Smooth UI animations

## ⚙️ Key Settings Highlights

- **Font**: JetBrains Mono with ligatures enabled
- **Line Height**: 1.8 for better readability
- **Auto Save**: Enabled with 1-second delay
- **File Associations**: HTTP files support
- **Rulers**: Set at 80 and 120 characters
- **Zoom Level**: Set to 1 for optimal viewing

## 🖥️ WezTerm Terminal

This configuration also includes a beautiful WezTerm terminal setup that complements the VS Code environment.

### WezTerm Features

- **Catppuccin Theme**: Adaptive color scheme (Frappe for dark mode, Latte for light mode)
- **JetBrains Mono Font**: Consistent with VS Code at 16pt size
- **Transparency**: 85% opacity with macOS background blur
- **Minimal UI**: Tab bar disabled for clean appearance
- **Custom Background**: Pure black background for better contrast

### Installing WezTerm

**macOS (Homebrew):**
```bash
brew install --cask wezterm
```

**macOS (Direct Download):**
Download from [wezterm.org](https://wezfurlong.org/wezterm/installation.html)

**Linux (Ubuntu/Debian):**
```bash
curl -LO https://github.com/wez/wezterm/releases/download/20240203-110809-5046fc22/wezterm-20240203-110809-5046fc22.Ubuntu22.04.deb
sudo apt install -y ./wezterm-*.deb
```

**Windows:**
Download the installer from [wezterm.org](https://wezfurlong.org/wezterm/installation.html)

### WezTerm Configuration Setup

1. Copy the `.wezterm.lua` file to your home directory:
   ```bash
   cp .wezterm.lua ~/
   ```

2. The configuration will automatically:
   - Set JetBrains Mono as the terminal font
   - Apply Catppuccin color scheme based on system appearance
   - Enable transparency and blur effects on macOS
   - Hide the tab bar for a minimal look

3. Restart WezTerm to apply the changes

## 🚀 Installation

### VS Code Setup

1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/settings_vscode.git
   ```

2. Copy the contents of `settings.json` to your VS Code settings:
   - Open VS Code
   - Press `Cmd+Shift+P` (macOS) or `Ctrl+Shift+P` (Windows/Linux)
   - Type "Preferences: Open Settings (JSON)"
   - Replace the contents with the settings from this repository

3. Install the required extensions listed above

4. Restart VS Code to apply all changes

### WezTerm Setup

1. Install WezTerm using the instructions above
2. Copy the WezTerm configuration:
   ```bash
   cp .wezterm.lua ~/
   ```
3. Restart WezTerm to apply the configuration
