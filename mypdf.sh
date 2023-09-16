#!/bin/bash
function myxelatex() {
    if [[ ! -f $1 ]]; then
        echo "${1}不是文件"
        return 1
    fi

    # 使用 python 获取文件的完整路径
    full_path=$(python -c "import os; print(os.path.realpath('$1'))")

    # 获取文件名
    filename=$(basename $1)

    # 如果没有传入第二个参数，那么默认目录为 /Volumes/RamDisk/
    output_dir=${2:-/Volumes/RamDisk/}

    # 建立 xelatexOut 目录
    mkdir -p "${output_dir}xelatexOut"

    # 写入文件
    output_file="${output_dir}xelatexOut/$filename"
    if [[ ! -f $output_file ]]; then
        echo "\\input{$full_path}" > $output_file
    fi

    # 调用 xelatex
    xelatex --output-directory="${output_dir}xelatexOut/" -synctex=1 -shell-escape "${@:3}" $output_file 
}
myxelatex "$@"
# ln -s /Users/virhuiai/hlProjects/Latex-Typesetting-Hub/mypdf.sh /usr/local/bin/mypdf