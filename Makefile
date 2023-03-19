all:
	@echo "make run"
	@echo "make build"
	@echo "make format"

run: build
	./a.out

build: $(wildcard *.cc)
	g++ -g -std=c++17 -O3 $? `llvm-config --cxxflags`

format:
	fd "[cc|h]$$" | xargs clang-format -i

.PHONY: build format
