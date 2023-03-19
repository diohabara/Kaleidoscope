all:
	@echo "make run"
	@echo "make build"
	@echo "make format"
	@echo "make clean"

run: build
	./a.out

build: toy.cc
	clang++ -g -std=c++17 -O3 $? `llvm-config --cxxflags --ldflags --system-libs --libs core`

format:
	fd "[cc|h]$$" | xargs clang-format -i

clean:
	rm -f a.out

.PHONY: build format
