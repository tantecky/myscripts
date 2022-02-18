function runGitk{
    Start-Process -FilePath "gitk" -ArgumentList "--all"
}

function runGvim{
    Start-Process -FilePath "C:\Programy\Vim\vim82\gvim.exe"
}


function py3{
    & 'E:\Program Files (x86)\Microsoft Visual Studio\Shared\Anaconda3_64\python.exe' $args
}

function gitStatus{
    git status
}

function gitFetch{
    git fetch --all --prune
}

Set-Alias gk runGitk
Set-Alias gs gitStatus
Set-Alias gf gitFetch
Set-Alias g runGvim
