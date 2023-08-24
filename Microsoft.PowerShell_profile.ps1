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

Set-Alias gk runGitk
Set-Alias gs gitStatus
Set-Alias gf gitFetch
Set-Alias gd gitBranchDel
Set-Alias gb gitBranchVerbose
Set-Alias gcom gitCommit
