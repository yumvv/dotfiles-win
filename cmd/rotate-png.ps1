<#
.SYNOPSIS
フォルダにあるPNG画像を一括で回転するスクリプト
.DESCRIPTION
カレントフォルダにあるPNGを指定された角度へ回転させる
.EXAMPLE
cd \path\to\folder && rotate-png.ps1
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

# アセンブリの読み込み
#[void][Reflection.Assembly]::LoadWithPartialName("System.Drawing")
Add-Type -AssemblyName System.Drawing

# 現在のカレントフォルダ取得
$TargetDir = Get-Location
Write-Host "作業フォルダ:" "$TargetDir"

$RotateSwitch = Read-Host "回転させたい角度の番号を入力(時計回り)`r`n1: 90°`r`n2: 180°`r`n3: 270°(-90°)`r`n"

if ( -Not ($RotateSwitch -in @('1','2','3')))
{
    Write-Host エラー: 指定された番号を入力してください
    exit
}

$itemList = Get-ChildItem $TargetDir;
foreach($item in $itemList)
{
    # 画像ファイルの読み込み
    $image = [System.Drawing.Image]::FromFile($TargetDir.trimend()+"\".trimend()+$item)

    Write-Host $item を処理中
    switch($RotateSwitch)
    {
        # 90°回転
        1 {
            $image.RotateFlip("Rotate90FlipNone")
        }
        # 180°回転
        2 {
            $image.RotateFlip("Rotate180FlipNone")
        }
        # 270°(-90°)回転
        3 {
            $image.RotateFlip("Rotate270FlipNone")
        }
    }
    # 保存
    $image.Save($TargetDir.trimend()+"\".trimend()+$item, [System.Drawing.Imaging.ImageFormat]::Png)

    # オブジェクトの破棄
    $image.Dispose()
}
