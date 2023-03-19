with import <nixpkgs> {};
stdenv.mkDerivation {
  name = "llvm-dev";
  buildInputs = [
    llvmPackages_15.libcxxClang
    llvmPackages_15.llvm
  ];
}