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

    # 建立 xelatexOut 目录
    mkdir -p /Volumes/RamDisk/xelatexOut

    # 写入文件
    output_file="/Volumes/RamDisk/xelatexOut/$filename"
    if [[ ! -f $output_file ]]; then
        echo "\\input{$full_path}" > $output_file
    fi

    # 调用 xelatex
    xelatex --output-directory=/Volumes/RamDisk/xelatexOut/ -synctex=1 -shell-escape $output_file
}
myxelatex $1
