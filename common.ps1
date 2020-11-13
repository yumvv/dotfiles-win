# 共通設定

# Emacsライクなキーバインディング
Import-Module PSReadLine
Set-PSReadlineOption -EditMode Emacs
# Ctrl-d を押しすぎて PowerShell を抜けないように DeleteChar に変更しました。 終了するときは exit で。
Set-PSReadLineKeyHandler -Key Ctrl+d -Function DeleteChar