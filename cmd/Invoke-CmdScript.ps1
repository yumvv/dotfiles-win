param([string] $script, [string] $parameters)

$temp = [IO.Path]::GetTempFileName()

cmd /c " `"$script`" $parameters && set > `"$temp`" "

Get-Content $temp | Foreach-Object {
    if($_ -match "^(.*?)=(.*)$")
    {
        Set-Content "env:\$($matches[1])" $matches[2]
    }
}

Remove-Item $temp
