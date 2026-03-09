# DrawIO CLI Installation Guide

## Quick Install

There are multiple ways to use DrawIO from command line:

### Option 1: Draw.io Desktop (Recommended)

Download and install draw.io desktop application, then use its CLI:

**Download:** https://github.com/jgraph/drawio-desktop/releases

**Usage:**

```bash
# Linux
/opt/drawio/drawio -x input.drawio -o output.png

# macOS
/Applications/draw.io.app/Contents/MacOS/draw.io -x input.drawio -o output.png

# Windows
"C:\Program Files\draw.io\draw.io.exe" -x input.drawio -o output.png
```

### Option 2: Docker

```bash
docker run --rm -v $(pwd):/data rlespinasse/drawio-export -x /data/input.drawio -o /data/output.png
```

### Option 3: Python drawio-export

```bash
pip install drawio-export
drawio-export input.drawio -o output.png
```

## System Requirements

- Node.js 14+ (recommended: latest LTS)
- npm 6+

## Installation Steps

### 1. Install Node.js (if not already installed)

**macOS (Homebrew):**

```bash
brew install node
```

**Linux (Ubuntu/Debian):**

```bash
curl -fsSL https://deb.nodesource.com/setup-lts.x | sudo -E bash -
sudo apt-get install -y nodejs
```

**Linux (Fedora/RHEL):**

```bash
curl -fsSL https://rpm.nodesource.com/setup-lts.x | sudo bash -
sudo dnf install -y nodejs
```

**Windows:**
Download from https://nodejs.org/

### 2. Install drawio-cli

```bash
npm install -g drawio-cli
```

If you get permission errors on macOS/Linux:

```bash
npm install -g drawio-cli --unsafe-perm=true
```

### 3. Verify Installation

```bash
drawio --version
drawio --help
```

## Troubleshooting

### "drawio: command not found"

The npm global bin directory may not be in your PATH.

**macOS/Linux:**

```bash
# Find npm global bin
npm config get prefix

# Add to PATH (add to ~/.bashrc or ~/.zshrc)
export PATH=$(npm config get prefix)/bin:$PATH
```

**Common paths:**

- macOS: `/usr/local/bin` or `~/.npm-global/bin`
- Linux: `/usr/local/bin` or `~/.npm-global/bin`

### Permission Errors

If you get EACCES errors:

**Option 1: Use sudo (not recommended)**

```bash
sudo npm install -g drawio-cli
```

**Option 2: Fix npm permissions (recommended)**

```bash
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
echo 'export PATH=~/.npm-global/bin:$PATH' >> ~/.bashrc
source ~/.bashrc
npm install -g drawio-cli
```

### Java Dependency

drawio-cli requires Java for some operations. If you encounter errors:

**macOS:**

```bash
brew install openjdk
```

**Linux:**

```bash
sudo apt-get install openjdk-11-jre
```

## Usage Examples

```bash
# Basic export
drawio -x input.drawio -o output.png

# High resolution
drawio -x input.drawio -o output.png --zoom 2

# Export to SVG
drawio -x input.drawio -o output.svg

# Export specific page
drawio -x input.drawio -o output.png --page-index 0

# Export all pages as separate files
drawio -x input.drawio -o output.png --all-pages
```

## See Also

- [cli-reference.md](cli-reference.md) - Complete CLI reference
- [SKILL.md](../SKILL.md) - Main skill documentation
