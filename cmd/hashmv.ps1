<#
.SYNOPSIS
ファイルハッシュでリネームするスクリプト
.DESCRIPTION
カレントフォルダにあるファイル名を"md5sumハッシュ.拡張子"にリネームします。ls |clipでクリップボード転送すると便利。
.EXAMPLE
\path\to\folder hashmv.ps1
.PARAMETER target
-?:このヘルプ <CommonParameters> はサポートしていません
#>
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
# 現在のカレントフォルダ取得
$TargetDir = Get-Location
Write-Host "作業フォルダ:" "$TargetDir"

$itemList = Get-ChildItem $TargetDir;
foreach($item in $itemList)
{
    Write-Host "$item" "を"
    # 拡張子なし
    $newname = (Get-FileHash -Algorithm MD5 $item).Hash.toLower()
    # 拡張子を取得
    $newname = $newname + $item.Extension
    Write-Host "新しいファイル名:" "$newname"
    # リネーム
    Rename-Item -Path $item.Name -NewName ($_.Basename -replace "(.*)", $newname)
}