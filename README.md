# Kaleidoscope

<https://llvm.org/docs/tutorial/>

## Dependencies

- [nix-direnv](https://github.com/nix-community/nix-direnv)

## How to run?

To run an interpreter until chapter 7, run:

```sh
make run # start interpreter
```

To compile Kaleidoscope to object code as in chapter 8, run:

```sh
make obj
./obj
# input: def average(x y) (x + y) * 0.5;
# input: ^D
make ch8
# output: average of 3.0 and 4.0: 3.5
```

To run the result of debugging information as in chapter 9, run:

```sh
make ch9
# output debug info
```
