# 定义编译器和选项
LATEX = xelatex
LATEX_OPTS = -interaction=nonstopmode -shell-escape

# 定义源文件和目标文件
ZH_SRC = resume_zh.tex
EN_SRC = resume_en.tex
ZH_PDF = resume_zh.pdf
EN_PDF = resume_en.pdf

REF_PDF = resume.pdf
REF_SRC = resume.tex

# 定义临时文件扩展名
TEMP_EXT = *.aux *.log *.out *.synctex.gz

# 定义图片文件扩展名
IMG_EXT = *.jpg

# 默认目标：编译中英文版本
all: zh en img_zh img_en

# 编译中文版本
zh: $(ZH_PDF)

$(ZH_PDF): $(ZH_SRC)
	$(LATEX) $(LATEX_OPTS) $(ZH_SRC)
	$(LATEX) $(LATEX_OPTS) $(ZH_SRC)

# 编译英文版本
en: $(EN_PDF)

$(EN_PDF): $(EN_SRC)
	$(LATEX) $(LATEX_OPTS) $(EN_SRC)
	$(LATEX) $(LATEX_OPTS) $(EN_SRC)

# 编译参考版本	
ref: $(REF_PDF)

$(REF_PDF): $(REF_SRC)
	$(LATEX) $(LATEX_OPTS) $(REF_SRC)
	$(LATEX) $(LATEX_OPTS) $(REF_SRC)

# 转换为图片
img_ref: $(REF_PDF)
	convert -density 1080 $(REF_PDF) -quality 90 $(REF_PDF:.pdf=.jpg)

img_zh: $(ZH_PDF)
	convert -density 1080 $(ZH_PDF) -quality 90 $(ZH_PDF:.pdf=.jpg)

img_en: $(EN_PDF)
	convert -density 1080 $(EN_PDF) -quality 90 $(EN_PDF:.pdf=.jpg)

# 清理临时文件和PDF
clean:
	rm -f $(TEMP_EXT) $(ZH_PDF) $(EN_PDF) $(REF_PDF) $(IMG_EXT)

# 声明伪目标
.PHONY: all zh en ref clean 