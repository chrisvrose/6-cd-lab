# Compiler Design Labwork

This repository contains labwork for compiler design.

Refer to [CMakeLists](./CMakeLists.txt) for the questions.

The build system is with CMake.

```sh
mkdir -p build
cd build
cmake ..
make -j8
```
Replace -j8 with `-j<num>` according to the number of threads you have.

## Requirements

- flex
- bison
