# _     _            _        _          _____
#| |__ | | __ _  ___| | _____| | ___   _|___ /
#| '_ \| |/ _` |/ __| |/ / __| |/ / | | | |_ \
#| |_) | | (_| | (__|   <\__ \   <| |_| |___) |
#|_.__/|_|\__,_|\___|_|\_\___/_|\_\\__, |____/
#                                  |___/

#Maintainer: blacksky3 <blacksky3@tuta.io> <https://github.com/blacksky3>

#!/bin/bash

source=$(pwd)

echo "${source}"

# build normal package with GCC

# gcc

cd linux515 && makepkg -s && rm -rf pkg/ src/ && cd ${source}

cd linux518 && makepkg -s && rm -rf pkg/ src/ && cd ${source}

cd linux519 && makepkg -s && rm -rf pkg/ src/ && cd ${source}

# clang

#cd linux515 && env _compiler=2 makepkg -s && rm -rf pkg/ src/ && cd ${source}

#cd linux518 && env _compiler=2 makepkg -s && rm -rf pkg/ src/ && cd ${source}

#cd linux519 && env _compiler=2 makepkg -s && rm -rf pkg/ src/ && cd ${source}
