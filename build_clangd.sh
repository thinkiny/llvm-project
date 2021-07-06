cd clang/tools
ln -sf ../../clang-tools-extra extra
cd -
mkdir build_clangd
cd build_clangd
cmake -G "Unix Makefiles" -DLLVM_TARGETS_TO_BUILD=X86 -DBUILD_SHARED_LIBS=OFF -DLLVM_INCLUDE_TESTS=off -DLLVM_INCLUDE_BENCHMARKS=off -DLLVM_INCLUDE_EXAMPLES=off -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_BINDINGS=off -DLLVM_ENABLE_RTTI=OFF -DLLVM_ENABLE_PROJECTS="clang;clang-tools-extra" ../llvm
#make clang clangd clangTooling -j4
make clangd -j6

if [ $? == 0 ] ; then
    cp bin/clangd /usr/local/bin/
fi
