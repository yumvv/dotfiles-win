<#
.SYNOPSIS
フォルダにあるPNG画像を一括で指定した領域でクロッピングする
.DESCRIPTION
カレントフォルダにあるPNGを指定された領域でクロッピングする。
画像群毎にこのスクリプトファイルをコピーしてリネームして使用することを推奨。
42行目のRectangleのパラメーターを変更してください。
.EXAMPLE
cd \path\to\folder && crop-png.ps1
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

$itemList = Get-ChildItem $TargetDir;
foreach($item in $itemList)
{
    # 元画像ファイルの読み込み
    $image = [System.Drawing.Image]::FromFile($TargetDir.trimend()+"\".trimend()+$item)

    # クロッピングした画像の読み込み
    # 元画像に対して残したい領域を指定
    # プロンプトで対話的に領域を指定する意味は多分ないので、
    # サイズが変わる場合は画像ごとにパラメーターを書き換えてください。
    $crop = New-Object System.Drawing.Rectangle(0,245,1440,2067) # 画像の左上を原点としてX座標, Y座標, 画像幅, 高さ

    Write-Host $item を処理中

    # 合成する(つまりクロッピングする)
    $crop = $image.Clone($crop, $image.PixelFormat)

    # オブジェクトの破棄
    # 破棄を確実にしないとSave時に以下のようなエラーが発生する
    # "2" 個の引数を指定して "Save" を呼び出し中に例外が発生しました: "GDI+ で汎用エラーが発生しました。"
    $image.Dispose()

    # 保存
    $crop.Save($TargetDir.trimend()+"\".trimend()+$item, [System.Drawing.Imaging.ImageFormat]::Png)

    # オブジェクトの破棄
    $crop.Dispose()
}
