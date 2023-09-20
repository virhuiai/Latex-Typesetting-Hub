#!/bin/bash
function myxelatex() {
    if [[ ! -f $1 ]]; then
        echo "${1}不是文件"
        return 1
    fi

    # 使用 python 获取文件的完整路径
    full_path=$(python -c "import os; print(os.path.realpath('$1'))")
    from_path=$(dirname $full_path)
    # 使用字符串处理命令和操作符提取目录名
    from_path_dir_last="${from_path##*/}"
    
    # 获取文件名
    filename=$(basename $1)

    # 如果没有传入第二个参数，那么默认目录为 /Volumes/RamDisk/
    output_dir=${2:-/Volumes/RamDisk/}

    # 建立 xelatexOut 目录
    mkdir -p "${output_dir}xelatexOut"

    # 
    to_compile_file="${output_dir}xelatexOut/${from_path_dir_last}/${filename}" # echo $to_compile_file;return 1;# /Volumes/RamDisk/xelatexOut/tcolorbox/tcolorbox.tex
    
    # rsync是一个强大的文件同步工具，可以在不同目录之间进行文件同步。它提供了许多选项来控制同步行为，包括只复制发生变化的文件。下面是使用rsync命令进行同步的示例：
    # -av选项表示以归档模式进行同步，保持文件的属性和权限，--update选项表示只复制源目录中比目标目录新或发生变化的文件。
    rsync -av --update "${from_path}" "${output_dir}xelatexOut/"

    # 调用 xelatex
    # xelatex --output-directory="${output_dir}xelatexOut/${from_path_dir_last}/" -synctex=1 -shell-escape "${@:3}" $to_compile_file 
    # 
    cd ${output_dir}xelatexOut/${from_path_dir_last} && xelatex -synctex=1 -shell-escape "${@:3}" ${filename}
}
myxelatex "$@"
# ln -s /Users/virhuiai/hlProjects/Latex-Typesetting-Hub/mypdf.sh /usr/local/bin/mypdf