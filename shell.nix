with import <nixpkgs> {};
stdenv.mkDerivation {
  name = "llvm-dev";
  buildInputs = [
    gnumake
    llvmPackages_15.libcxxClang
    llvmPackages_15.libllvm
    llvmPackages_15.llvm
  ];
}
