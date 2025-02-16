# 定义编译器和选项
LATEX = xelatex
LATEX_OPTS = -interaction=nonstopmode -shell-escape

# 定义源文件和目标文件
ZH_SRC = resume_zh.tex
EN_SRC = resume_en.tex
ZH_PDF = resume_zh.pdf
EN_PDF = resume_en.pdf

# 定义临时文件扩展名
TEMP_EXT = *.aux *.log *.out *.synctex.gz

# 默认目标：编译中英文版本
all: zh en

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

# 清理临时文件和PDF
clean:
	rm -f $(TEMP_EXT) $(ZH_PDF) $(EN_PDF)

# 声明伪目标
.PHONY: all zh en clean 