all:
	@echo "make run"
	@echo "make build"
	@echo "make format"

run: build
	./a.out

build: $(wildcard *.cc)
	g++ $?

fomrat:
	fd "[cc|h]$" | xargs clang-format -i

.PHONY: build format