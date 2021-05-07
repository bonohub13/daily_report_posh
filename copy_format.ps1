$DATE = Get-Date -Format yyyymmdd

# directory you want to store your daily reports
## $HOME/Documents is the path set by default.
## If you want something different feel free to change it to whatever you'd like
$SOURCE_PATH="NULL"
if ( $SOURCE_PATH -match "NULL" ) {
    echo "ERROR: file path not set for SOURCE_PATH!"
    echo "Please set \$SOURCE_PATH to the directory where you cloned this repository"
    echo "Example: C:\Users\user\daily_report_posh"
}
$TARGET_PATH=$HOME/Documents

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
function main ($SourcePath $FilePath $Date) {
    init_filepath -FilePath $FilePath
    $FileName="$Date.md"
    # formatting DD part to make it have the length 2
    $DD=$Date.substring(6, 2)
    if ( $DD.length -lt 2 ) {
        $DD="0$DD"
    }
    # replicating sed
    Get-Content $SourcePath/format.md | % { $_ -replace "年月日", "$Date.substring(0, 4)年$Date.substring(4, 2)月$DD日" } | Set-Content $FilePath/$FileName
}

main -SourcePath $SOURCE_PATH -FilePath $FILE_PATH -Date $DATE
