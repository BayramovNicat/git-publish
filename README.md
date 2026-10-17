# git-publish

A fast CLI tool that completely automates creating a remote repository on GitHub, configuring the `main` branch, setting remote origin (SSH/HTTPS), and pushing your code.

Because it is named `git-publish` and placed in your `PATH`, Git automatically recognizes it as a native Git subcommand:
```bash
git publish
```

---

## What It Automates

Instead of manually typing:
```bash
git branch -M main
git remote add origin git@github.com:BayramovNicat/<repo-name>.git
git push -u origin main
```

You simply run:
```bash
git publish
```
and `git-publish` handles:
1. Local git repository initialization (`git init` if not already initialized).
2. Staging and creating an initial commit if you haven't committed yet.
3. Renaming the current branch to `main` (`git branch -M main`).
4. Creating the remote repository on GitHub with `gh repo create` (Public or Private).
5. Setting the remote URL (`origin`) to SSH (`git@github.com:...`) or HTTPS.
6. Pushing with upstream tracking (`git push -u origin main`).

---

## Prerequisites

1. **GitHub CLI (`gh`)**: Already installed via Homebrew.
2. **GitHub Authentication**: Ensure you are logged in to `gh`:
   ```bash
   gh auth login
   ```
   *(Select **GitHub.com**, choose **SSH** or HTTPS, and authenticate in browser or with token).*

---

## Installation

Run the installer:
```bash
./install.sh
```
This copies `git-publish` to `~/.local/bin/git-publish`, which is already in your `$PATH`.

---

## Usage

### How Repository Name & Description are Detected

When no repository name is explicitly provided:
1. **`package.json`**: First checks if a `package.json` exists in the folder and uses its `"name"` (scoped names like `@scope/app` are cleanly converted to `app`).
2. **Folder Name**: If no `package.json` is found (or it lacks a `name`), it falls back to the current directory name.
3. **Description**: If `package.json` contains a `"description"`, it is also automatically pre-filled!

### Interactive Mode
Navigate to any project directory and run:
```bash
git publish
```
If flags are not provided, it will interactively prompt:
- **Repository name** (defaults to `package.json` name, or folder name)
- **Visibility** (Public or Private)

### Non-Interactive & Flags

#### 1. Publish using the current directory name
```bash
git publish
```

#### 2. Specify repository name
```bash
git publish android-cast-macos
```

#### 3. Create a private repository
```bash
git publish android-cast-macos --private
# or short form:
git publish android-cast-macos -p
```

#### 4. Add a description
```bash
git publish my-project --public -d "Android screen casting tool for macOS"
```

#### 5. Custom initial commit message
```bash
git publish my-project -m "chore: initial release setup"
```

#### 6. Use HTTPS instead of SSH
```bash
git publish my-project --https
```

#### 7. Skip confirmation prompts (auto-accept)
```bash
git publish my-project -y
```

---

## Command Options

| Option | Shorthand | Description | Default |
|---|---|---|---|
| `--public` | | Create a public GitHub repository | Yes |
| `--private` | `-p` | Create a private GitHub repository | No |
| `--description <text>` | `-d` | GitHub repository description | `""` |
| `--message <text>` | `-m` | Initial commit message (if uncommitted files) | `"Initial commit"` |
| `--ssh` | | Use SSH remote URL (`git@github.com:...`) | Yes |
| `--https` | | Use HTTPS remote URL (`https://github.com/...`) | No |
| `--yes` | `-y` | Skip interactive prompts | No |
| `--help` | `-h` | Show help and options | |
