# カレントディレクトリ以下の *.png ファイル全て圧縮
# 要pngquant
# scoop install pngquant
ls -r "*.png" | % {pngquant --ext .png --speed 1 --force $_.fullname}