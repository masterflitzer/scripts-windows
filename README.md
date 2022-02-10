# git bare repository

source/idea: https://youtu.be/tBoLDpTWVOM

## create (when setting up)

```
git init --bare $HOME/dotfiles.git
# replace '--work-tree=/' with '--work-tree=\$HOME' when you only want to add files from your home dir
Write-Output "function git-dotfiles { git --git-dir=`$HOME/dotfiles.git/ --work-tree=/ `$args }" >> $HOME/Documents/PowerShell/profile.ps1
pwsh
git-dotfiles config --local status.showUntrackedFiles no
git-dotfiles remote add origin git@github.com:masterflitzer/dotfiles.git
git-dotfiles push -u origin main
```

## clone

```
git clone --bare git@github.com:masterflitzer/dotfiles.git $HOME/dotfiles.git
Write-Output "function git-dotfiles { git --git-dir=`$HOME/dotfiles.git/ --work-tree=/ `$args }" >> $HOME/Documents/PowerShell/profile.ps1
pwsh
git-dotfiles config --local status.showUntrackedFiles no
git-dotfiles restore --staged /
git-dotfiles restore /
```

## usage

```
git-dotfiles add /path/to/config/file
git-dotfiles commit -m "add file"
git-dotfiles push
```
