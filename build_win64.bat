cd godot-cpp
call scons.bat p=windows target=debug bits=64 generate_bindings=yes %1
xcopy ".\bin\libgodot-cpp.windows.debug.64.lib" ".\..\..\yaml-cpp_install\lib\libgodot-cpp.windows.debug.64.lib"*
cd ..

mkdir yaml-cpp_install
cd yaml-cpp_install
mkdir lib
cd ..

cd yaml-cpp
mkdir build 
cd build
cmake .. -G "Visual Studio 14 2015 Win64"
msbuild YAML_CPP.sln
xcopy ".\Debug\libyaml-cppmdd.lib" ".\..\..\yaml-cpp_install\lib\libyaml-cppmdd.lib"*
cd ..
cd ..

scons.bat p=windows target=debug %1