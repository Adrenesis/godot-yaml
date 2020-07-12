#!/bin/bash
cd godot-cpp/
scons platform=linux target=release generate_bindings=yes
cd ..

mkdir yaml-cpp_install
cd yaml-cpp_install
mkdir lib
cd ..
cd yaml-cpp
mkdir build
cd build
cmake -DBUILD_SHARED_LIBS=ON ..
make
cp ./libyaml-cpp.so.0.6 ./../../yaml-cpp_install/lib/libyaml-cpp.so.0.6
cp ./libyaml-cpp.so.0.6.2 ./../../yaml-cpp_install/lib/libyaml-cpp.so.0.6.2
cp ./libyaml-cpp.so ./../../yaml-cpp_install/lib/libyaml-cpp.so
cp ./libyaml-cpp.so.0.6 ./../../demo/addons/godot-yaml/x11/libyaml-cpp.so.0.6
cp ./libyaml-cpp.so.0.6.2 ./../../demo/addons/godot-yaml/x11/libyaml-cpp.so.0.6.2
cp ./libyaml-cpp.so ./../../demo/addons/godot-yaml/x11/libyaml-cpp.so

cd ..
cd ..
scons platform=linux target=release
strip ./demo/addons/godot-yaml/x11/libgodotyaml.so