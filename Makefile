all: run

help:
	@echo "make run"
	@echo "make build"
	@echo "make format"
	@echo "make clean"

run: build
	./toy

ch9: debug
	./debug < fib.ks | clang -x ir -

ch8: link output.o
	./link

link: output.o
	clang++ main.cc output.o -o link

obj: obj.cc
	clang++ -g -rdynamic -std=c++17 $? `llvm-config --cxxflags --ldflags --system-libs --libs all` -o obj
	./obj

build: toy.cc
	clang++ -g -rdynamic -std=c++17 $? `llvm-config --cxxflags --ldflags --system-libs --libs all` -o toy

debug: debug.cc
	clang++ -g -rdynamic -std=c++17 $? `llvm-config --cxxflags --ldflags --system-libs --libs core orcjit native` -o debug

format:
	fd "[cc|h]$$" | xargs clang-format -i

clean:
	rm -rf toy a.out main obj output.o debug *.dSYM link

.PHONY: build format link
