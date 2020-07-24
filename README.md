# Windows用の設定ファイル

## 準備
* [Scoop](https://scoop.sh/)
```
Set-ExecutionPolicy RemoteSigned -scope CurrentUser
iwr -useb get.scoop.sh | iex
```
* git
* vim
```
scoop install git vim
```

## セットアップ
```
git clone git@github.com:muquu/dotfiles-win.git $HOME\dotfiles
```
クローンするフォルダの名前に注意。
```
.\setup.ps1
```
シンボリックリンクの数だけUACのダイアログが出ます。