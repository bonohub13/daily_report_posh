#!/usr/bin/bash
DATE=`date | sed -r "s/[^ ]+ +([^ ]+)+ +([^ ]+)+ +[^ ]+ +[^ ]+ +[^ ]+ +([^ ]+)+/\3\1\2/"`

# directory you want to store your daily reports
## $HOME/Documents is the path set by default.
## If you want something different feel free to change it to whatever you'd like
FILE_PATH=$HOME/Documents

# create new directory if it doesn't exist
init_filepath()
{
    if [[ ! -d $1 ]]; then
        echo "Making new directory at $1 ..."
        mkdir -p $1
        if [[ -d $1 ]]; then
            echo "New directory made!"
        fi
    fi
}

# get date of month in MMDD
get_month()
{
    MON=("Jan" "Feb" "Mar" "Apr" "May" "Jun" "Jul" "Aug" "Sep" "Oct" "Nov" "Dec")
    MON_NUM=("01" "02" "03" "04" "05" "06" "06" "07" "08" "09" "10" "11" "12")

    for i in `seq 0 11`; do
        if [ "$(echo $1 | grep -i ${MON[${i}]})" != "" ]; then
            echo $1 | sed "s/${MON[$i]}/${MON_NUM[$i]}/"
        fi
    done

    echo "${output}"
}

# main function
main()
{
    init_filepath $2
    DATE=`get_month $1`
    FILENAME="$DATE.md"
    sed "s/年月日/${DATE:0:4}年${DATE:4:2}月${DATE:6:2}日/" $2/format.md | tee $2/$FILENAME
}

main $DATE $FILE_PATH
