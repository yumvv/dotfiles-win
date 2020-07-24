#[PowerShellで"rm -rf"的なコマンドのエイリアスを作った](https://qiita.com/TomoyukiAota/items/f94c9b0dfdeeb8a092f7)
function rmrf {
    <#
       .DESCRIPTION
       Deletes the specified file or directory.
       .PARAMETER target
       Target file or directory to be deleted.
       .NOTES
       This is an equivalent command of "rm -rf" in Unix-like systems.
       #>
   Param(
       [Parameter(Mandatory=$true)]
       [string]$Target
   )
   Remove-Item -Recurse -Force $Target
}