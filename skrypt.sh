#! /bin/bash

if [ "$1" = "--date" ]; then
    date +"%Y-%m-%d"
elif [ "$1" = "--logs" ]; then
    if [ -n "$2" ] && [ "$2" -eq "$2" ] 2>/dev/null; then
        count=$2
    else
        count=100
    fi

    for (( i=1; i<=$count; i++ )); do
        echo "log$i.txt, created by skrypt.sh, $(date)" > log$i.txt
    done
elif [ "$1" = "--help" ]; then
    echo "Usage:"
    echo "  skrypt.sh --date       Display today's date"
    echo "  skrypt.sh --logs       Create 100 log files"
    echo "  skrypt.sh --logs N     Create N log files"
    echo "  skrypt.sh --help       Display this help message"
else
    echo "Unknown option: $1"
    echo "Usage: skrypt.sh --date | --logs [N] | --help"
    exit 1
fi
