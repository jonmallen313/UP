# UP - Git Commit & Push Utility

A simple Windows utility for quickly committing and pushing changes to any Git repository with random, meaningful commit messages.

## What it does

UP automatically:
- Stages all changes (`git add -A`)
- Commits with a random commit message
- Pushes to your configured remote repository

## Features

- **Random commit messages**: Uses 5 pre-defined conventional commit messages
- **No duplicate messages**: Won't use the same message twice in a row
- **Works with any Git repo**: No configuration needed - uses your existing Git remotes
- **Cross-platform batch file**: Easy to run from Windows Command Prompt or PowerShell

## Installation

### Option 1: Add to Windows Scripts folder (Recommended)
1. Copy both `up.bat` and `up.ps1` to your PowerShell Scripts directory:
   ```
   %USERPROFILE%\Documents\WindowsPowerShell\Scripts\
   ```
   
2. Make sure your Scripts folder is in your PATH environment variable. If not, add it:
   - Open PowerShell as Administrator
   - Run: `$env:PATH += ";$env:USERPROFILE\Documents\WindowsPowerShell\Scripts"`
   - To make it permanent, add the Scripts folder to your system PATH

### Option 2: Add to any folder in your PATH
Place both files in any directory that's already in your Windows PATH environment variable.

## Usage

1. Navigate to any Git repository in your terminal
2. Make your changes
3. Run the command:
   ```
   up
   ```

That's it! The script will:
- Stage all your changes
- Commit with a random message like "chore: tune up code" or "feat: improvements added"
- Push to your configured remote repository

## Setup with Your GitHub Repository

**No configuration needed!** The script works with any Git repository. Just make sure your repository has:

1. A configured remote (usually called `origin`):
   ```bash
   git remote add origin https://github.com/yourusername/yourrepo.git
   ```

2. An upstream branch set (done automatically after first push):
   ```bash
   git push -u origin main
   ```

## Commit Messages

The script randomly selects from these conventional commit messages:
- `chore: tune up code`
- `fix: small adjustments`  
- `feat: improvements added`
- `update: refinements made`
- `refactor: cleanup and polish`

## Requirements

- Windows with PowerShell
- Git installed and configured
- A Git repository with a configured remote

## Customization

Want different commit messages? Edit the `$messages` array in `up.ps1`:

```powershell
$messages = @(
    "your custom message 1"
    "your custom message 2"
    # add more messages here
)
```

## Troubleshooting

**"Not a git repository" error**: Make sure you're running the command from inside a Git repository.

**Push fails**: Ensure your repository has a configured remote and you have push permissions.

**Command not found**: Make sure both `up.bat` and `up.ps1` are in a folder that's in your PATH environment variable.

## License

Feel free to use, modify, and distribute as needed.