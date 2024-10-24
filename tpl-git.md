# Git

## Git Cheat Sheet

### Git Branches

*list all branches remote and local* <br/>
`git branch -a` <br/>
*list all remote branches on source control server* <br/>
`git branch -r`
*list all local branches* <br/>
`git branch`


### Git Create New Branch
*create a new local branch and push it to the source control server* <br/>

`git branch (branchname)` *create branch but dont switch to it*<br/>
`git switch -c (branchname)` *create branch and switch to it*<br/>
`git switch (branchname)` *switch to branch if not in it*<br/>
`git push --set-upstream origin (branchname)` *push branch to source control server* <br/>

### Git Delete Remote Branch
*delete a remote branch on the source control server* <br/>
`git push origin -d (branchname)`

### Git Delete Local Branch
`git branch` <br/> 
`are you in branch` <br/>
`git switch (branchname)` <br/>
`git branch -d (branchname)` <br/>



## https://docs.github.com/en/get-started/using-git/getting-changes-from-a-remote-repository