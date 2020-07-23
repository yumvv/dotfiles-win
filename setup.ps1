. .\sudo.ps1
#sudo New-Item -Value .\mercurial.ini -Path ..\ -Name mercurial.ini -ItemType SymbolicLink

$Files = @(
"mercurial.ini",
".vimrc",
".gitconfig"
)

foreach($a in $Files)
{
    sudo New-Item -Value .\$a -Path ..\ -Name $a -ItemType SymbolicLink
}

git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
vim -c "PluginInstall" -c q