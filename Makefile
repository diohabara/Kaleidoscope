all: run

help:
	@echo "make run"
	@echo "make build"
	@echo "make format"
	@echo "make clean"

run: build
	./toy

link: output.o
	clang++ main.cc output.o -o main

output.o: obj.cc
	clang++ -g -rdynamic -std=c++17 $? `llvm-config --cxxflags --ldflags --system-libs --libs all` -o obj

build: toy.cc
	clang++ -g -rdynamic -std=c++17 $? `llvm-config --cxxflags --ldflags --system-libs --libs all` -o toy

debug: debug.cc
	clang++ -g -rdynamic -std=c++17 $? `llvm-config --cxxflags --ldflags --system-libs --libs core orcjit native` -o debug

format:
	fd "[cc|h]$$" | xargs clang-format -i

clean:
	rm -f toy a.out main obj output.o debug

.PHONY: build format link
