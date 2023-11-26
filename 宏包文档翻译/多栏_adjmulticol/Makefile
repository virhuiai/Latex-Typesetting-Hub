#
# Makefile for adjmulticol package
#
# This file is in public domain
#
# $Id$
# 
# 
# $< 表示当前目标的第一个依赖文件，
# $* 表示当前目标的文件名（不包括扩展名）。

PACKAGE=adjmulticol
SAMPLES = sample.tex

# 默认目标，编译生成 adjmulticol.pdf 和样例的 PDF 文件。
all:  $(PACKAGE).pdf ${SAMPLES:%.tex=%.pdf} 

# 用 pdflatex 命令编译生成 dtx 文件对应的 PDF 文件，同时使用 bibtex 和 makeindex 命令处理相关的辅助文件。
# 这个规则是一个模式规则，用于根据给定的 dtx 文件生成对应的 PDF 文件。下面是规则中每个部分的解释：
# %.pdf: 这是目标文件的模式，表示匹配任何以 .pdf 结尾的文件名。
# %.dtx: 这是依赖文件的模式，表示匹配任何以 .dtx 结尾的文件名。
# $(PACKAGE).sty: 这是一个具体的依赖文件，表示需要存在名为 $(PACKAGE).sty 的文件。
%.pdf:  %.dtx   $(PACKAGE).sty
# 使用 pdflatex 命令编译 dtx 文件为 PDF 文件。$< 表示当前目标的第一个依赖文件，即输入的 dtx 文件。
	pdflatex $< 
# 使用 bibtex 命令处理生成的辅助文件。$* 表示当前目标的文件名（不包括扩展名），即去除扩展名的 dtx 文件名。
	- bibtex $*
# 再次使用 pdflatex 命令编译 dtx 文件为 PDF 文件，以确保引用和交叉引用的正确性。
	pdflatex $<
# 使用 makeindex 命令生成索引文件。-s 指定索引样式文件为 gind.ist，-o 指定输出的索引文件名为 dtx 文件名的 .ind 文件，$*.idx 表示输入的索引源文件。
	- makeindex -s gind.ist -o $*.ind $*.idx
# 使用 makeindex 命令生成术语表文件。-s 指定术语表样式文件为 gglo.ist，-o 指定输出的术语表文件名为 dtx 文件名的 .gls 文件，$*.glo 表示输入的术语表源文件。
	- makeindex -s gglo.ist -o $*.gls $*.glo
# 再次使用 pdflatex 命令编译 dtx 文件为 PDF 文件，以确保索引和术语表的正确性。
	pdflatex $<
# 使用一个循环，如果在日志文件中出现 "LaTeX Warning: Label(s) may have changed" 的警告，就继续使用 pdflatex 命令编译 dtx 文件，直到没有这个警告为止。这是为了处理交叉引用可能导致标签变化的情况，确保最终生成的 PDF 文件中的交叉引用是正确的。
	while ( grep -q '^LaTeX Warning: Label(s) may have changed' $*.log) \
	do pdflatex $<; done


# 用 pdflatex 命令编译生成 tex 文件对应的 PDF 文件，同时使用 bibtex 命令处理相关的辅助文件。
%.pdf:  %.tex   $(PACKAGE).sty
	pdflatex $<
	- bibtex $*
	pdflatex $<
	while ( grep -q '^LaTeX Warning: Label(s) may have changed' $*.log) \
	do pdflatex $<; done

# 用 pdflatex 命令编译生成 ins 文件对应的 sty 文件。
%.sty:   %.ins %.dtx  
	pdflatex $<


# 声明 $(PACKAGE).cfg 和 $(PACKAGE).sty 为 precious 目标，即使在清理过程中也保留它们。
.PRECIOUS:  $(PACKAGE).cfg $(PACKAGE).sty

# 清理生成的文件，包括 sty、log、aux 等。
clean:
	$(RM)  $(PACKAGE).sty *.log *.aux \
	*.cfg *.glo *.idx *.toc \
	*.ilg *.ind *.out *.lof \
	*.lot *.bbl *.blg *.gls \
	*.dvi *.ps *.tgz *.zip

# 清理生成的文件，并且删除所有生成的 PDF 文件。
veryclean: clean
	$(RM) *.pdf

# 清理生成的文件，并且删除所有生成的文件，相当于 veryclean。
distclean: veryclean

#
# Archive for the distribution. Includes typeset documentation
# 打包生成发布所需的压缩文件，包括生成的文档。
archive:  all clean
	COPYFILE_DISABLE=1 tar -C .. -czvf ../$(PACKAGE).tgz --exclude '*~' --exclude '*.tgz' --exclude '*.zip'  --exclude CVS --exclude '.git*' $(PACKAGE); mv ../$(PACKAGE).tgz .

# 打包生成发布所需的 ZIP 文件，包括生成的文档。
zip:  all clean
	${MAKE} $(PACKAGE).sty
	$(RM) *.log
	zip -r  $(PACKAGE).zip * -x '*~' -x '*.tgz' -x '*.zip' -x "*.ins" -x CVS -x 'CVS/*'
