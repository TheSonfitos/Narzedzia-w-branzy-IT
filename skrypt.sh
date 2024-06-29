#! /bin/bash

if [ "$1" = "--date" ] || [ "$1" = "-d" ]; then
    date +"%Y-%m-%d"
elif [ "$1" = "--logs" ] || [ "$1" = "-l" ]; then
    if [ -n "$2" ] && [ "$2" -eq "$2" ] 2>/dev/null; then
        count=$2
    else
        count=100
    fi

    for (( i=1; i<=$count; i++ )); do
        echo "log$i.txt, created by skrypt.sh, $(date)" > log$i.txt
    done
elif [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
    echo "Usage:"
    echo "  skrypt.sh --date | -d       Display today's date"
    echo "  skrypt.sh --logs | -l       Create 100 log files"
    echo "  skrypt.sh --logs N | -l N   Create N log files"
    echo "  skrypt.sh --help | -h       Display this help message"
    echo "  skrypt.sh --init            Clone repository and set PATH"
    echo "  skrypt.sh --error N | -e N  Create N error files in errorx/"
elif [ "$1" = "--init" ]; then
    git clone https://github.com/TheSonfitos/narzedzia-w-branzy-it.git
    export PATH=$PATH:$(pwd)/narzedzia-w-branzy-it
    echo "Repository cloned and PATH updated."
elif [ "$1" = "--error" ] || [ "$1" = "-e" ]; then
    if [ -n "$2" ] && [ "$2" -eq "$2" ] 2>/dev/null; then
        count=$2
    else
        count=100
    fi

    for (( i=1; i<=$count; i++ )); do
        echo "error$i.txt, created by skrypt.sh, $(date)" > errorx/error$i.txt
    done
else
    echo "Unknown option: $1"
    echo "Usage: skrypt.sh --date | -d | --logs | -l [N] | --help | -h | --init | --error | -e [N]"
    exit 1
fi

