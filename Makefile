all: run

help:
	@echo "make run"
	@echo "make build"
	@echo "make format"
	@echo "make clean"

run: build
	./toy

build: toy.cc
	clang++ -g -std=c++17 $? `llvm-config --cxxflags --ldflags --system-libs --libs core` -o toy

format:
	fd "[cc|h]$$" | xargs clang-format -i

clean:
	rm -f toy

.PHONY: build format
