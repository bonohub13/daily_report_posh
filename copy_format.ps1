$DATE = Get-Date -Format yyyymmdd

# directory you want to store your daily reports
## $HOME/Documents is the path set by default.
## If you want something different feel free to change it to whatever you'd like
$FILE_PATH=$HOME/Documents

# create new directory if it doesn't exist
function init_filepath ($FilePath) {
    if ( ! Test-Path $FilePath ) {
        echo "Making new directory at $FilePath ..."
        New-Item -ItemType Directory -Path $FilePath
        if ( Test-Path $FilePath ) {
            echo "New directory made!"
        }
    }
}

# main function
function main ($FilePath $Date) {
    init_filepath -FilePath $FilePath
    $FileName="$Date.md"
    # replicating sed
    Get-Content $FilePath | % { $_ -replace "年月日", "$Date.substring(0, 4)年$Date.substring(4, 2)月$Date.substring(6, 2)日" } | Set-Content $FilePath/$FileName
}

main -FilePath $FILE_PATH -Date $DATE
