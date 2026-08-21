function runGitk{
    Start-Process -FilePath "gitk" -ArgumentList "--all"
}

function gitStatus{
    git status
}

function gitFetch{
    git fetch --all --prune
}

function gitBranchDel{
    git branch -D $args
}

function gitBranchVerbose{
    git branch -va
}

function gitCommit{
    git commit
}

function gitPrune {
    git branch -vv | Where-Object { $_ -match ': gone]' } | ForEach-Object { git branch -d ($_.Trim() -split '\s+')[0] }
}

Set-Alias gk runGitk
Set-Alias gs gitStatus
Set-Alias gf gitFetch
Set-Alias gd gitBranchDel
Set-Alias gb gitBranchVerbose
Set-Alias gcom gitCommit
Set-Alias gpr gitPrune
Set-Alias op opencode
