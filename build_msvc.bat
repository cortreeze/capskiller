@echo off

mkdir build
pushd build
set bin_name=ck_%VSCMD_ARG_TGT_ARCH%.dll
cl /W4 /O2 /LD /Fe%bin_name% ..\ck.c user32.lib 
popd

move build\%bin_name% autoload\
rmdir /S /Q build

