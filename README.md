# git bare repository

source/idea: https://youtu.be/tBoLDpTWVOM

## create (when setting up)

```
su -
git init --bare ~/dotfiles.git
# replace '--work-tree=/' with '--work-tree=\$HOME' when you only want to add files from your home dir
Write-Output "function git-dotfiles { git --git-dir=`$HOME/dotfiles.git/ --work-tree=/ `$args }" >> ~/Documents/PowerShell/profile.ps1
pwsh
git-dotfiles config --local status.showUntrackedFiles no
git-dotfiles remote add origin git@github.com:Masterflitzer/dotfiles.git
```

## clone

```
su -
git clone --bare git@github.com:Masterflitzer/dotfiles.git ~/dotfiles.git
Write-Output "function git-dotfiles { git --git-dir=`$HOME/dotfiles.git/ --work-tree=/ `$args }" >> ~/Documents/PowerShell/profile.ps1
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
