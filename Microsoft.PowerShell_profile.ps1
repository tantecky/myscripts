function runGitk{
    Start-Process -FilePath "gitk" -ArgumentList "--all"
}

function runGvim{
    Start-Process -FilePath "C:\Programy\Vim\vim82\gvim.exe"
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
    git branch -v
}

Set-Alias gk runGitk
Set-Alias g runGvim
Set-Alias gs gitStatus
Set-Alias gf gitFetch
Set-Alias gd gitBranchDel
Set-Alias gb gitBranchVerbose
