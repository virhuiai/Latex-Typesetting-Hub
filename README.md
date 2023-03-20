# Latex排版学习交流

## 宏包文档翻译

- 多列排版_parcolumns 已经完成翻译-v2
- 多列排版_pdfcolparcolumns 已经完成翻译-v2
- parskip 已经完成翻译-v1
- fontspec-document 已经完成翻译-v1
- fancyvrb 已经完成翻译-v2 2023 0307
- minted 已经完成翻译-v2 2023 0311
- newinclude 已经完成翻译-v1 2023 0317
- cleverref 2848行


```
\\begin\{parcolumns\}[^\\]+\\colchunk\{([^\}]+)\}[^\\]+\\colchunk\{([^\}]+)\}[^\\]+\\end\{parcolumns\}
```

```
xelatex --output-directory=/Volumes/RamDisk/ -synctex=1 -shell-escape  minted-cn.dtx
```


## 工具文档翻译
- ltxdoc 进行中
```
cd /Volumes/RamDisk/ &&  xelatex --output-directory=/Volumes/RamDisk/ -synctex=1 -shell-escape /Users/virhuiai/hlProjects/Latex-Typesetting-Hub/工具文档翻译/ltxdoc/ltxdoc.dtx
```

- texdef 已经完成翻译-v2 2023 0308
```
cd /Volumes/RamDisk/ &&  xelatex --output-directory=/Volumes/RamDisk/ -synctex=1 -shell-escape /Users/virhuiai/hlProjects/Latex-Typesetting-Hub/工具文档翻译/texdef/texdef.tex
```

- docstrip  已经完成翻译-v1 2023 0315
```
cd /Volumes/RamDisk/ &&  xelatex --output-directory=/Volumes/RamDisk/ -synctex=1 -shell-escape /Users/virhuiai/hlProjects/Latex-Typesetting-Hub/工具文档翻译/docstrip/docstrip.dtx
```

```
xelatex --output-directory=/Volumes/RamDisk/ -synctex=1 
``` 