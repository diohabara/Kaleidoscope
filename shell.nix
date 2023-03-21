with import <nixpkgs> {};
stdenv.mkDerivation {
  name = "llvm-dev";
  buildInputs = [
    gnumake
    llvmPackages_15.libcxxClang
    # llvmPackages_15.clangUseLLVM
    # llvmPackages_15.clangNoLibcxx
    # llvmPackages_15.clangNoLibc
    llvmPackages_15.libllvm
    llvmPackages_15.llvm
    gcc12
  ];
}
