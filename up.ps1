# up.ps1
# Commit & push shortcut for Git on Windows

# Commit messages
$messages = @(
    "chore: tune up code"
    "fix: small adjustments"
    "feat: improvements added"
    "update: refinements made"
    "refactor: cleanup and polish"
)

# File to store last used index
$stateFile = "$env:USERPROFILE\.up_last"

# Ensure we're in a Git repo
try {
    git rev-parse --is-inside-work-tree 2>$null | Out-Null
} catch {
    Write-Host "❌ Not a git repository"
    exit 1
}

# Pick a random message index, not the same as last one
$last = -1
if (Test-Path $stateFile) {
    $last = Get-Content $stateFile
}

$count = $messages.Count
do {
    $idx = Get-Random -Maximum $count
} while ($idx -eq $last)

$msg = $messages[$idx]
$idx | Out-File $stateFile -Force

# Run Git commands
git add -A
git commit -m "$msg"
git push
