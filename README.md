# linux-manjaro

Linux kernel build for Archlinux with with Manjaro patches (Bootsplash support) with Piotr Górski Arch, Block, CPU and CPU Power patches and Graysky2 kernel_compiler_patch patch.

# Version

- 5.17

# Build

    git clone https://github.com/blacksky3/linux-manjaro.git
    cd linux-manjaro
    env_compiler=(1 or 2) makepkg -s
    
# Build variables

### _compiler

- Will set compiler to build the kernel :

        1 : GCC
        2 : CLANG+LLVM

If not set it will build with GCC by default.

# Prebuild package

Prebuild package are available at https://www.blacksky3.com/x86_64/kernel

You can add this repo to your pacman.conf

    [kernel]
    SigLevel = Optional TrustAll
    Server = https://www.blacksky3.com/$arch/$repo

# Update GRUB

    sudo grub-mkconfig -o /boot/grub/grub.cfg

# Info

You can refer to this Archlinux page that have lots of useful information to build the kernel and debugging if you have some issues https://wiki.archlinux.org/index.php/Kernel/Traditional_compilation

# Contact info

blacksky3@tuta.io if you have any problems or bugs report.

# Donation

BTC : bc1quz6zcjjy769cn9fd42r89hfh9unr4u2w4sfxer

ETH : 0xF8cBcA16f4eeDfF4a07D173B7fF53906a87b0476

DAI : 0xF8cBcA16f4eeDfF4a07D173B7fF53906a87b0476

LINK : 0xF8cBcA16f4eeDfF4a07D173B7fF53906a87b0476
