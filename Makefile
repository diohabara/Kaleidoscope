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

format:
	fd "[cc|h]$$" | xargs clang-format -i

clean:
	rm -f toy

.PHONY: build format
