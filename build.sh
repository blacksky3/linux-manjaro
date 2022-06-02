#!/bin/bash

# build normal package with GCC

# gcc

cd linux515 && makepkg -s && rm -rf pkg/ src/ && cd ..

cd linux518 && makepkg -s && rm -rf pkg/ src/ && cd ..

# clang

#cd linux515 && env _compiler=2 makepkg -s && rm -rf pkg/ src/ && cd ..

#cd linux518 && env _compiler=2 makepkg -s && rm -rf pkg/ src/ && cd ..
