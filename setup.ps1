. .\sudo.ps1
#
# $profile 作成
#
$writefile = $profile
if (Test-Path -LiteralPath $writefile)
{
    Write-Host 既に"$profile"があります。バックアップを取るか手動でマージしてください。
}
else
{
    # 読み込みたいファイルを書いてください
    $src = @(
    "sudo.ps1",
    "rmrf.ps1"
    )

    $writefile = New-Object System.IO.StreamWriter($writefile, $true, [System.Text.Encoding]::GetEncoding("UTF-8"))
    foreach($f in $src)
    {
        $current = Convert-Path .
        $current = $current + "\" + $f
        $writefile.WriteLine(". $current")
    }
    $writefile.Close()
    Write-Host プロファイルへの書き込みが完了しました
}
#
# シンボリックリンク作成
#
# シンボリックリンクしたいファイルを書いてください
$files = @(
"mercurial.ini",
".vimrc",
".gitconfig"
)

foreach($f in $files)
{
    sudo New-Item -Value .\$f -Path ..\ -Name $f -ItemType SymbolicLink
}

git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
vim -c "PluginInstall" -c q