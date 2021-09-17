<#
.SYNOPSIS
フォルダにあるPNG画像を一括で圧縮する
.DESCRIPTION
pngquantを使用してカレントフォルダにあるPNGを圧縮してファイル容量を減らします。
qualiltyのパラメーターに注意してください。
このスクリプトも使用したい画像群に合わせてコピーリネームして使うことを推奨。
.EXAMPLE
cd \path\to\folder && comp-png.ps1
.PARAMETER target
-?:このヘルプ <CommonParameters> はサポートしていません
#>

# メモ
# カレントディレクトリ以下の *.png ファイル全て圧縮
# 要pngquant
# scoop install pngquant
# 日本語がパスに含まれているとエラーが出る
# pngquant 2.15.0 で多分直るそう
# 2021/09/17現在
# 2.14.1 (February 2021)
# https://github.com/kornelski/pngquant/issues/265
# ワンライナー
# 略した方
#ls -r "*.png" | % {pngquant --ext .png --speed 1 --force $_.fullname}
# 略さない方
#Get-ChildItem "*.png"  | ForEach-Object {pngquant --quality=60-85 --ext .png --speed 1 --force $_.fullname}

Param(
[Parameter()]
[ValidateCount(0,1)]
[string[]]
$TargetDir
)
if(![string]::IsNullOrEmpty($TargetDir)) {
    Write-Host "このスクリプトは引数をとりません。'-?'でヘルプを表示します。"
    exit
}

# アセンブリの読み込み
#[void][Reflection.Assembly]::LoadWithPartialName("System.Drawing")
#Add-Type -AssemblyName System.Drawing

# 現在のカレントフォルダ取得
$TargetDir = Get-Location
Write-Host "作業フォルダ:" "$TargetDir"

$itemList = Get-ChildItem "$TargetDir\*.png";
foreach($item in $itemList)
{
    Write-Host $item を処理中

    pngquant --quality=60-85 --ext .png --speed 1 --force $item.fullname
}
