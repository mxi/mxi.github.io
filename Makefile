M4PATH := "include"
SOURCES := $(shell find . -name "*.m4")
TARGETS := $(SOURCES:.m4=.html)
M4 := "/usr/bin/m4"


all: ${TARGETS}

clean:
	rm -rf ${TARGETS}

force: clean all

print:
	@echo "M4PATH: ${M4PATH}"
	@echo "SOURCES: ${SOURCES}"
	@echo "TARGETS: ${TARGETS}"
	@echo "M4: ${M4}"

# install https://github.com/Blobfolio/htminl
minify: ${TARGETS}
	htminl $^

${TARGETS}: %.html: %.m4
	M4PATH=${M4PATH} ${M4} $^ > $@

.PHONY: all clean force print minify
