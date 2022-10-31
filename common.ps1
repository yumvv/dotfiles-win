# 共通設定

# Emacsライクなキーバインディング
Import-Module PSReadLine
Set-PSReadlineOption -EditMode Emacs
# Ctrl-d を押しすぎて PowerShell を抜けないように DeleteChar に変更しました。 終了するときは exit で。
Set-PSReadLineKeyHandler -Key Ctrl+d -Function DeleteChar

# Pager変更
# https://yanor.net/wiki/?PowerShell/%E7%92%B0%E5%A2%83%E8%A8%AD%E5%AE%9A/Pager%E3%82%92less%E3%81%AB%E3%81%99%E3%82%8B
# neovimインストールが必要(vimだと制御文字が出力される...)
# 使用方法は
# > command | vless
function VimPager { $input | Out-File $env:tmp/tmp.txt; nvim -u NONE $env:tmp/tmp.txt }
Set-Alias vless VimPager

# Python
# PIP and all outdated packages
# https://thecesrom.dev/2021/05/26/the-one-liner-for-updating-pip-and-all-outdated-packages/
# ERROR: List format 'freeze' can not be used with the --outdated option.
# https://discuss.python.org/t/pip-22-3-list-list-format-freeze-can-not-be-used-with-the-outdated-option/20061
# jqコマンドが必要
# scoop install jq
function global:Update-Pip {
  $packages = python -m pip list --outdated --format=json | jq -r '.[] | .name+\"=\"+.latest_version'
  foreach ($package in $packages) {
    $pkg = $package.split("=")[0]
    python -m pip install --upgrade $pkg
  }
}
