#_                   _ _ _  _ _____ _  _
#| | _______   ____ _| | | || |___  | || |
#| |/ / _ \ \ / / _` | | | || |_ / /| || |_
#|   <  __/\ V / (_| | | |__   _/ / |__   _|
#|_|\_\___| \_/ \__,_|_|_|  |_|/_/     |_|

#Maintainer: kevall474 <kevall474@tuta.io> <https://github.com/kevall474>
#Credits: Jan Alexander Steffens (heftig) <heftig@archlinux.org> ---> For the base PKGBUILD
#Credits: Andreas Radke <andyrtr@archlinux.org> ---> For the base PKGBUILD
#Credits: Linus Torvalds ---> For the linux kernel
#Credits: Joan Figueras <ffigue at gmail dot com> ---> For the base PKFBUILD
#Credits: Bernhard Landauer <bernhard@manjaro.org> ---> For the base PKFBUILD
#Credits: Philip Müller <philm[at]manjaro[dot]org> ---> For the base PKFBUILD
#Credits: Tobias Powalowski <tpowa@archlinux.org>
#Credits: Thomas Baechler <thomas@archlinux.org>
#Credits: Piotr Górski <lucjan.lucjanov@gmail.com> <https://github.com/sirlucjan> ---> For Block, Futex, BBR2 and CPU patches
#Credits: Graysky2 <https://github.com/graysky2> ---> For kernel_compiler_patch
#Credits: Etienne Juvigny (Tk-Glitch) <tkg@froggi.es> <https://github.com/Tk-Glitch> ---> For config setings

################################# Arch ################################

ARCH=x86

################################# GCC ################################

# Grap GCC version
# Workarround with GCC 12.0.0. Pluggins don't work, so we have to grap GCC version
# and disable CONFIG_HAVE_GCC_PLUGINS/CONFIG_GCC_PLUGINS

GCC_VERSION=$(gcc -dumpversion)

################################# CC/CXX/HOSTCC/HOSTCXX ################################

#Set compiler to build the kernel
#Set '1' to build with GCC
#Set '2' to build with CLANG and LLVM
#Default is empty. It will build with GCC. To build with different compiler just use : env _compiler=(1 or 2) makepkg -s
if [ -z ${_compiler+x} ]; then
  _compiler=
fi

if [[ "$_compiler" = "1" ]]; then
  _compiler=1
  CC=gcc
  CXX=g++
  HOSTCC=gcc
  HOSTCXX=g++
elif [[ "$_compiler" = "2" ]]; then
  _compiler=2
  CC=clang
  CXX=clang++
  HOSTCC=clang
  HOSTCXX=clang++
else
  _compiler=1
  CC=gcc
  CXX=g++
  HOSTCC=gcc
  HOSTCXX=g++
fi

###################################################################################

pkgbase=linux-manjaro
pkgname=("$pkgbase" "$pkgbase-headers")
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done
pkgver=5.16.1
major=5.16
manjaromajor=516
pkgrel=1
arch=(x86_64)
url="https://www.kernel.org/"
license=(GPL-2.0)
makedepends=("bison" "flex" "valgrind" "git" "cmake" "make" "extra-cmake-modules" "libelf" "elfutils"
             "python" "python-appdirs" "python-mako" "python-evdev" "python-sphinx_rtd_theme" "python-graphviz" "python-sphinx"
             "clang" "lib32-clang" "llvm" "lib32-llvm" "llvm-libs" "lib32-llvm-libs" "lld" "gcc" "gcc-libs" "lib32-gcc-libs" "glibc" "lib32-glibc"
             "pahole" "patch" "bc" "kmod" "libmikmod" "lib32-libmikmod" "xmlto" "xmltoman" "graphviz" "imagemagick" "imagemagick-doc"
             "rsync" "cpio" "inetutils" "gzip" "zstd" "xz" "tar" "perl")
options=('!strip')

source=("https://mirrors.edge.kernel.org/pub/linux/kernel/v5.x/linux-$pkgver.tar.xz"
        "config")
md5sums=("SKIP"
         "SKIP")

manjaropatchpath=https://gitlab.manjaro.org/packages/core/linux${manjaromajor}/-/raw/master
source+=(# ARCH Patches
         "${manjaropatchpath}/0001-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-CLONE_NEWUSER.patch"
         "${manjaropatchpath}/0002-Btintel_Fix_bdaddress_comparison_with_garbage_value.patch"
         # Temp Fixes
         # MANJARO Patches
         "${manjaropatchpath}/0101-i2c-nuvoton-nc677x-hwmon-driver.patch"
         #"${manjaropatchpath}/0102-iomap-iomap_bmap-should-accept-unwritten-maps.patch"
         #"${manjaropatchpath}/0104-revert-xhci-Add-support-for-Renesas-controller-with-memory.patch"
         "${manjaropatchpath}/0105-quirk-kernel-org-bug-210681-firmware_rome_error.patch"
         # Lenovo + AMD
         #"${manjaropatchpath}/0201-lenovo-wmi2.patch"
         # Bootsplash
         "${manjaropatchpath}/0301-revert-garbage-collect-fbdev-scrolling-acceleration.patch"
         "${manjaropatchpath}/0302-revert-fbcon-remove-now-unusued-softback_lines-cursor-argument.patch"
         "${manjaropatchpath}/0303-revert-fbcon-remove-no-op-fbcon_set_origin.patch"
         "${manjaropatchpath}/0304-revert-fbcon-remove-soft-scrollback-code.patch"
         "${manjaropatchpath}/0401-bootsplash.patch"
         "${manjaropatchpath}/0402-bootsplash.patch"
         "${manjaropatchpath}/0403-bootsplash.patch"
         "${manjaropatchpath}/0404-bootsplash.patch"
         "${manjaropatchpath}/0405-bootsplash.patch"
         "${manjaropatchpath}/0406-bootsplash.patch"
         "${manjaropatchpath}/0407-bootsplash.patch"
         "${manjaropatchpath}/0408-bootsplash.patch"
         "${manjaropatchpath}/0409-bootsplash.patch"
         "${manjaropatchpath}/0410-bootsplash.patch"
         "${manjaropatchpath}/0411-bootsplash.patch"
         "${manjaropatchpath}/0412-bootsplash.patch"
         "${manjaropatchpath}/0413-bootsplash.gitpatch")
md5sums+=("42e898478e26b9c73180b9ca1b6eb511"  #0001-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-CLONE_NEWUSER.patch
          "4286ef22f0096f6a674a24434a0482fe"  #0002-Btintel_Fix_bdaddress_comparison_with_garbage_value.patch
          "b855b885a36de3228cb4118fdf61224b"  #0101-i2c-nuvoton-nc677x-hwmon-driver.patch
          "5a8e19711baad0d09d7c25c3e27d72b8"  #0105-quirk-kernel-org-bug-210681-firmware_rome_error.patch
          "0f597205ea7b91f7024f0ac02ac96975"  #0301-revert-garbage-collect-fbdev-scrolling-acceleration.patch
          "2496e6fc16f67b289f72ddc2ea2511cf"  #0302-revert-fbcon-remove-now-unusued-softback_lines-cursor-argument.patch
          "fed6ae4ac4c3f56178fa4aca6c934d6f"  #0303-revert-fbcon-remove-no-op-fbcon_set_origin.patch
          "594d4f69b956eaab3336b4e01f42eda8"  #0304-revert-fbcon-remove-soft-scrollback-code.patch
          "be5a873f638ff5c31947f8d28a824d3a"  #0401-bootsplash.patch
          "b4acd66a564af83b5409738c40b4a566"  #0402-bootsplash.patch
          "a6407dceae1838f5aa27450401a91be6"  #0403-bootsplash.patch
          "cb78b1c11b917a4d31c4b1567183b76f"  #0404-bootsplash.patch
          "3efea575da7f02ba94789d3b6b81e11f"  #0405-bootsplash.patch
          "2529ad13791b259d80c9d5d702187a65"  #0406-bootsplash.patch
          "cb296d7788098cf478c46c0d21376719"  #0407-bootsplash.patch
          "50255aac36e002afa477e4527a0550af"  #0408-bootsplash.patch
          "6b6def41b404422dc04b39e2f1adffc8"  #0409-bootsplash.patch
          "1922e3a7727d2bf51641b98d6d354738"  #0410-bootsplash.patch
          "d6b7e4e43e42128cf950251e0d0aee23"  #0411-bootsplash.patch
          "ecfd8a30c480149005fcf349e4d06f4b"  #0412-bootsplash.patch
          "2ead9aa2df230c83539e3ebf6b796b18") #0413-bootsplash.gitpatch

lucjanpath=https://raw.githubusercontent.com/sirlucjan/kernel-patches/master/${major}
# Block patches. Set BFQ as default
source+=("${lucjanpath}/block-patches-sep/0001-block-Kconfig.iosched-set-default-value-of-IOSCHED_B.patch"
         "${lucjanpath}/block-patches-sep/0002-block-Fix-depends-for-BLK_DEV_ZONED.patch"
         "${lucjanpath}/block-patches-sep/0003-block-set-rq_affinity-2-for-full-multithreading-I-O.patch"
         "${lucjanpath}/ll-patches/0002-LL-elevator-set-default-scheduler-to-bfq-for-blk-mq.patch"
         "${lucjanpath}/ll-patches/0003-LL-elevator-always-use-bfq-unless-overridden-by-flag.patch")
md5sums+=("7536731ddb9db4d2683234d70edf5434"  #0001-block-Kconfig.iosched-set-default-value-of-IOSCHED_B.patch
          "0ca0ee369847388683473c6e9eafa11f"  #0002-block-Fix-depends-for-BLK_DEV_ZONED.patch
          "86af2daa361caa182f55547c698f6472"  #0003-block-set-rq_affinity-2-for-full-multithreading-I-O.patch
          "84587403cabe9e19bb4363a3ee4f35b8"  #0002-LL-elevator-set-default-scheduler-to-bfq-for-blk-mq.patch
          "bd5dbcdc69e376db7c62c30b29b6cf66") #0003-LL-elevator-always-use-bfq-unless-overridden-by-flag.patch
# CPU patches
source+=("${lucjanpath}/cpu-patches-sep/0002-init-Kconfig-enable-O3-for-all-arches.patch"
         "${lucjanpath}/cpu-patches-sep/0004-Makefile-Turn-off-loop-vectorization-for-GCC-O3-opti.patch")
md5sums+=("d9cb95351ab059c22c68067031367b84"  #0002-init-Kconfig-enable-O3-for-all-arches.patch
          "45da2b5938474ff8e99fec9dc9596ea1") #0004-Makefile-Turn-off-loop-vectorization-for-GCC-O3-opti.patch
# Futex
source+=("${lucjanpath}/futex-patches/0001-futex-Add-entry-point-for-FUTEX_WAIT_MULTIPLE-opcode.patch")
md5sums+=("f24e3f6e117a166dbca54c6117b71e8b") #0001-futex-Add-entry-point-for-FUTEX_WAIT_MULTIPLE-opcode.patch
# BBR2
source+=("${lucjanpath}/bbr2-patches-v2-sep/0001-bbr2-5.16-introduce-BBRv2.patch"
         "${lucjanpath}/bbr2-patches-v2-sep/0002-bbr2-5.16-clean-up-forward-port.patch")
md5sums+=("8444613ccc5dffc5c61217e21c659b80"  #0001-bbr2-5.16-introduce-BBRv2.patch
          "1fd9b083a911edc65eb188027616663f") #0002-bbr2-5.16-clean-up-forward-port.patch

# Graysky2 CPU patch
source+=("https://raw.githubusercontent.com/graysky2/kernel_compiler_patch/master/more-uarches-for-kernel-5.15+.patch")
md5sums+=("a28d20dbe481a55ac32ee4a64bee4fac") #more-uarches-for-kernel-5.15%2B.patch

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare(){

  cd linux-$pkgver

  # add upstream patch
  #  msg2 "Add upstream patch"
  #  patch -p1 -i "../patch-${pkgver}"

  # Apply any patch
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    msg2 "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  #msg2 "Apply 0413-bootsplash"
  #git apply -p1 < "../0413-bootsplash.gitpatch"

  plain ""

  # Copy the config file first
  # Copy "${srcdir}"/config to "${srcdir}"/linux-${pkgver}/.config
  msg2 "Copy "${srcdir}"/config to "${srcdir}"/linux-$pkgver/.config"
  cp "${srcdir}"/config .config

  sleep 2s

  plain ""

  msg2 "Disable CLANG LTO"
  scripts/config --disable CONFIG_LTO
  scripts/config --disable CONFIG_LTO_CLANG
  scripts/config --disable CONFIG_ARCH_SUPPORTS_LTO_CLANG
  scripts/config --disable CONFIG_ARCH_SUPPORTS_LTO_CLANG_THIN
  scripts/config --disable CONFIG_HAS_LTO_CLANG
  scripts/config --disable CONFIG_LTO_NONE
  scripts/config --disable CONFIG_LTO_CLANG_FULL
  scripts/config --disable CONFIG_LTO_CLANG_THIN

  sleep 2s

  # fix for GCC 12.0.0 (git version)
  if [[ "$GCC_VERSION" = "12.0.0" ]] && [[ "$_compiler" = "1" ]]; then
    plain ""

    #msg2 "Disable CONFIG_HAVE_GCC_PLUGINS/CONFIG_GCC_PLUGINS (Quick fix for gcc 12.0.0 git version)"
    scripts/config --disable CONFIG_HAVE_GCC_PLUGINS
    scripts/config --disable CONFIG_GCC_PLUGINS

    sleep 2s

    msg2 "Disable Fortify"
    scripts/config --disable CONFIG_FORTIFY_SOURCE
    scripts/config --disable CONFIG_ARCH_HAS_FORTIFY_SOURCE

    plain ""
  fi

  sleep 2s

  plain ""

  msg2 "Set kernel compression mode to ZSTD"
  scripts/config --enable CONFIG_HAVE_KERNEL_GZIP
  scripts/config --enable CONFIG_HAVE_KERNEL_BZIP2
  scripts/config --enable CONFIG_HAVE_KERNEL_LZMA
  scripts/config --enable CONFIG_HAVE_KERNEL_XZ
  scripts/config --enable CONFIG_HAVE_KERNEL_LZO
  scripts/config --enable CONFIG_HAVE_KERNEL_LZ4
  scripts/config --enable CONFIG_HAVE_KERNEL_ZSTD
  scripts/config --enable CONFIG_HAVE_KERNEL_UNCOMPRESSED

  scripts/config --disable CONFIG_KERNEL_GZIP
  scripts/config --disable CONFIG_KERNEL_BZIP2
  scripts/config --disable CONFIG_KERNEL_LZMA
  scripts/config --disable CONFIG_KERNEL_XZ
  scripts/config --disable CONFIG_KERNEL_LZO
  scripts/config --disable CONFIG_KERNEL_LZ4
  scripts/config --enable CONFIG_KERNEL_ZSTD
  scripts/config --disable CONFIG_KERNEL_UNCOMPRESSED

  sleep 2s

  msg2 "Set module signature algorithm"
  scripts/config --enable CONFIG_MODULE_SIG
  scripts/config --undefine MODULE_SIG_FORCE
  scripts/config --disable MODULE_SIG_FORCE
  scripts/config --enable CONFIG_MODULE_SIG_ALL
  scripts/config --disable CONFIG_MODULE_SIG_SHA1
  scripts/config --disable CONFIG_MODULE_SIG_SHA224
  scripts/config --disable CONFIG_MODULE_SIG_SHA256
  scripts/config --disable CONFIG_MODULE_SIG_SHA384
  scripts/config --enable CONFIG_MODULE_SIG_SHA512
  scripts/config  --set-val CONFIG_MODULE_SIG_HASH "sha512"

  sleep 2s

  msg2 "Set module compression to ZSTD"
  scripts/config --disable CONFIG_MODULE_COMPRESS_NONE
  scripts/config --disable CONFIG_MODULE_COMPRESS_GZIP
  scripts/config --disable CONFIG_MODULE_COMPRESS_XZ
  scripts/config --enable CONFIG_MODULE_COMPRESS_ZSTD

  sleep 2s

  msg2 "Enable CONFIG_STACK_VALIDATION"
  scripts/config --enable CONFIG_STACK_VALIDATION

  sleep 2s

  msg2 "Enable IKCONFIG"
  scripts/config --enable CONFIG_IKCONFIG
  scripts/config --enable CONFIG_IKCONFIG_PROC

  sleep 2s

  msg2 "Disable NUMA"
  scripts/config --disable CONFIG_NUMA
  scripts/config --disable CONFIG_AMD_NUMA
  scripts/config --disable CONFIG_X86_64_ACPI_NUMA
  scripts/config --disable CONFIG_NODES_SPAN_OTHER_NODES
  scripts/config --disable CONFIG_NUMA_EMU
  scripts/config --disable CONFIG_NEED_MULTIPLE_NODES
  scripts/config --disable CONFIG_USE_PERCPU_NUMA_NODE_ID
  scripts/config --disable CONFIG_ACPI_NUMA
  scripts/config --disable CONFIG_ARCH_SUPPORTS_NUMA_BALANCING
  scripts/config --disable CONFIG_NODES_SHIFT
  scripts/config --undefine CONFIG_NODES_SHIFT
  scripts/config --disable CONFIG_NEED_MULTIPLE_NODES

  sleep 2s

  msg2 "Disable FUNCTION_TRACER/GRAPH_TRACER"
  scripts/config --disable CONFIG_FUNCTION_TRACER
  scripts/config --disable CONFIG_STACK_TRACER

  sleep 2s

  msg2 "Enable CONFIG_USER_NS_UNPRIVILEGED"
  scripts/config --enable CONFIG_USER_NS

  sleep 2s

  msg2 "Setting performance governor"
  scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL
  scripts/config --disable CONFIG_CPU_FREQ_GOV_SCHEDUTIL
  scripts/config --enable CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE
  scripts/config --enable CONFIG_CPU_FREQ_GOV_PERFORMANCE

  sleep 2s

  msg2 "Disabling uneeded governors"
  scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE
  scripts/config --disable CONFIG_CPU_FREQ_GOV_POWERSAVE
  scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE
  scripts/config --disable CONFIG_CPU_FREQ_GOV_USERSPACE
  scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND
  scripts/config --disable CONFIG_CPU_FREQ_GOV_ONDEMAND
  scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE
  scripts/config --disable CONFIG_CPU_FREQ_GOV_CONSERVATIVE
  scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL
  scripts/config --disable CONFIG_CPU_FREQ_GOV_SCHEDUTIL

  sleep 2s

  msg2 "Set CPU DEVFREQ GOV CONFIG_DEVFREQ_GOV for performance"
  scripts/config --disable CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND
  scripts/config --undefine CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND
  scripts/config --disable CONFIG_DEVFREQ_GOV_POWERSAVE
  scripts/config --disable CONFIG_DEVFREQ_GOV_USERSPACE
  scripts/config --disable CONFIG_DEVFREQ_GOV_PASSIVE
  scripts/config --enable CONFIG_DEVFREQ_GOV_PERFORMANCE

  sleep 2s

  msg2 "Set PCIEASPM DRIVER to performance"
  scripts/config --enable CONFIG_PCIEASPM
  scripts/config --enable CONFIG_PCIEASPM_PERFORMANCE

  sleep 2s

  msg2 "Set CONFIG_PCIE_BUS for performance"
  scripts/config --enable CONFIG_PCIE_BUS_PERFORMANCE

  sleep 2s

  msg2 "Set timer frequency to 1000HZ"
  scripts/config --enable CONFIG_HZ_1000
  scripts/config --set-val CONFIG_HZ 1000

  sleep 2s

  msg2 "Set to full tickless (by TK-Glitch)"

  #periodic ticks
  #scripts/config --disable CONFIG_NO_HZ_FULL_NODEF
  #scripts/config --disable CONFIG_NO_HZ_IDLE
  #scripts/config --disable CONFIG_NO_HZ_FULL
  #scripts/config --disable CONFIG_NO_HZ
  #scripts/config --disable CONFIG_NO_HZ_COMMON
  #scripts/config --enable CONFIG_HZ_PERIODIC

  #full tickless
  scripts/config --disable CONFIG_HZ_PERIODIC
  scripts/config --disable CONFIG_NO_HZ_IDLE
  scripts/config --disable CONFIG_CONTEXT_TRACKING_FORCE
  scripts/config --enable CONFIG_NO_HZ_FULL_NODEF
  scripts/config --enable CONFIG_NO_HZ_FULL
  scripts/config --enable CONFIG_NO_HZ
  scripts/config --enable CONFIG_NO_HZ_COMMON
  scripts/config --enable CONFIG_CONTEXT_TRACKING

  #tickless idle
  #scripts/config --disable CONFIG_NO_HZ_FULL_NODEF
  #scripts/config --disable CONFIG_HZ_PERIODIC
  #scripts/config --disable CONFIG_NO_HZ_FULL
  #scripts/config --enable CONFIG_NO_HZ_IDLE
  #scripts/config --enable CONFIG_NO_HZ
  #scripts/config --enable CONFIG_NO_HZ_COMMON

  sleep 2s

  msg2 "Disable some debugging (by TK-Glitch)"
  scripts/config --disable CONFIG_SLUB_DEBUG
  scripts/config --disable CONFIG_PM_DEBUG
  scripts/config --disable CONFIG_PM_ADVANCED_DEBUG
  scripts/config --disable CONFIG_PM_SLEEP_DEBUG
  scripts/config --disable CONFIG_ACPI_DEBUG
  scripts/config --disable CONFIG_SCHED_DEBUG
  scripts/config --disable CONFIG_LATENCYTOP
  scripts/config --disable CONFIG_DEBUG_PREEMPT

  sleep 2s

  msg2 "Disabling Kyber I/O scheduler"
  scripts/config --disable CONFIG_MQ_IOSCHED_KYBER

  sleep 2s

  msg2 "Enable Fsync support"
  scripts/config --enable CONFIG_FUTEX
  scripts/config --enable CONFIG_FUTEX_PI

  sleep 2s

  msg2 "Enable OpenRGB SMBus access"
  scripts/config --module CONFIG_I2C_NCT6775

  sleep 2s

  msg2 "Disable TCP_CONG_CUBIC"
  scripts/config --module CONFIG_TCP_CONG_CUBIC
  scripts/config --disable CONFIG_DEFAULT_CUBIC
  msg2 "Enable TCP_CONG_BBR2"
  scripts/config --enable CONFIG_TCP_CONG_BBR2
  scripts/config --enable CONFIG_DEFAULT_BBR2
  scripts/config --set-str CONFIG_DEFAULT_TCP_CONG bbr2

  sleep 2s

  msg2 "Enable Bootup splash screen"
  scripts/config --enable CONFIG_BOOTSPLASH

  sleep 2s

  msg2 "Remove manjaro from default hostname"
  scripts/config --set-str CONFIG_DEFAULT_HOSTNAME "none"

  sleep 2s

  msg2 "Disable -MANJARO in localversion"
  scripts/config --disable CONFIG_LOCALVERSION

  sleep 2s

  msg2 "Add anbox support"
  scripts/config --enable CONFIG_ASHMEM
  # CONFIG_ION is not set
  scripts/config --enable CONFIG_ANDROID
  scripts/config --enable CONFIG_ANDROID_BINDER_IPC
  scripts/config --enable CONFIG_ANDROID_BINDERFS
  scripts/config --set-str CONFIG_ANDROID_BINDER_DEVICES "binder,hwbinder,vndbinder"
  # CONFIG_ANDROID_BINDER_IPC_SELFTEST is not set

  sleep 2s

  msg2 "Set CONFIG_GENERIC_CPU"
  scripts/config --enable CONFIG_GENERIC_CPU

  sleep 2s

  plain ""

  # Setting localversion
  msg2 "Setting localversion..."
  scripts/setlocalversion --save-scmversion
  echo "-${pkgbase}" > localversion

  plain ""

  # Config
  if [[ "$_compiler" = "1" ]]; then
    make ARCH=${ARCH} CC=${CC} CXX=${CXX} HOSTCC=${HOSTCC} HOSTCXX=${HOSTCXX} olddefconfig
  elif [[ "$_compiler" = "2" ]]; then
    make ARCH=${ARCH} CC=${CC} CXX=${CXX} LLVM=1 LLVM_IAS=1 HOSTCC=${HOSTCC} HOSTCXX=${HOSTCXX} olddefconfig
  fi

  plain ""

  make -s kernelrelease > version
  msg2 "Prepared $pkgbase version $(<version)"

  plain ""
}

build(){

  cd "${srcdir}"/linux-$pkgver

  # make -j$(nproc) all
  msg2 "make -j$(nproc) all..."
  if [[ "$_compiler" = "1" ]]; then
    make ARCH=${ARCH} CC=${CC} CXX=${CXX} HOSTCC=${HOSTCC} HOSTCXX=${HOSTCXX} -j$(nproc) all
  elif [[ "$_compiler" = "2" ]]; then
    make ARCH=${ARCH} CC=${CC} CXX=${CXX} LLVM=1 LLVM_IAS=1 HOSTCC=${HOSTCC} HOSTCXX=${HOSTCXX} -j$(nproc) all
  fi
}

_package(){
  pkgdesc="The Linux kernel and modules with Manjaro patches (Bootsplash support)"
  depends=("coreutils" "kmod" "initramfs" "mkinitcpio")
  optdepends=("linux-firmware: firmware images needed for some devices"
              "crda: to set the correct wireless channels of your country"
              "bootsplash-systemd: for bootsplash functionality")
  provides=("VIRTUALBOX-GUEST-MODULES" "WIREGUARD-MODULE")

  cd "${srcdir}"/linux-$pkgver

  local kernver="$(<version)"
  local modulesdir="${pkgdir}"/usr/lib/modules/${kernver}

  msg2 "Installing boot image..."
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"

  # Used by mkinitcpio to name the kernel
  echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

  msg2 "Installing modules..."
  if [[ "$_compiler" = "1" ]]; then
    make ARCH=${ARCH} CC=${CC} CXX=${CXX} HOSTCC=${HOSTCC} HOSTCXX=${HOSTCXX} INSTALL_MOD_PATH="${pkgdir}"/usr INSTALL_MOD_STRIP=1 -j$(nproc) modules_install
  elif [[ "$_compiler" = "2" ]]; then
    make ARCH=${ARCH} CC=${CC} CXX=${CXX} LLVM=1 LLVM_IAS=1 HOSTCC=${HOSTCC} HOSTCXX=${HOSTCXX} INSTALL_MOD_PATH="${pkgdir}"/usr INSTALL_MOD_STRIP=1 -j$(nproc) modules_install
  fi

  # remove build and source links
  msg2 "Remove build dir and source dir..."
  rm -rf "$modulesdir"/{source,build}
}

_package-headers(){
  pkgdesc="Headers and scripts for building modules for the $pkgbase package"
  depends=("${pkgbase}" "gawk" "python" "libelf" "pahole")

  cd "${srcdir}"/linux-$pkgver

  local builddir="$pkgdir"/usr/lib/modules/"$(<version)"/build

  msg2 "Installing build files..."
  install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map localversion version vmlinux
  install -Dt "$builddir/kernel" -m644 kernel/Makefile
  install -Dt "$builddir/arch/x86" -m644 arch/x86/Makefile
  cp -t "$builddir" -a scripts

  # add objtool for external module building and enabled VALIDATION_STACK option
  install -Dt "$builddir/tools/objtool" tools/objtool/objtool

  # add xfs and shmem for aufs building
  mkdir -p "$builddir"/{fs/xfs,mm}

  msg2 "Installing headers..."
  cp -t "$builddir" -a include
  cp -t "$builddir/arch/x86" -a arch/x86/include
  install -Dt "$builddir/arch/x86/kernel" -m644 arch/x86/kernel/asm-offsets.s

  install -Dt "$builddir/drivers/md" -m644 drivers/md/*.h
  install -Dt "$builddir/net/mac80211" -m644 net/mac80211/*.h

  # https://bugs.archlinux.org/task/13146
  install -Dt "$builddir/drivers/media/i2c" -m644 drivers/media/i2c/msp3400-driver.h

  # https://bugs.archlinux.org/task/20402
  install -Dt "$builddir/drivers/media/usb/dvb-usb" -m644 drivers/media/usb/dvb-usb/*.h
  install -Dt "$builddir/drivers/media/dvb-frontends" -m644 drivers/media/dvb-frontends/*.h
  install -Dt "$builddir/drivers/media/tuners" -m644 drivers/media/tuners/*.h

  # https://bugs.archlinux.org/task/71392
  install -Dt "$builddir/drivers/iio/common/hid-sensors" -m644 drivers/iio/common/hid-sensors/*.h

  msg2 "Installing KConfig files..."
  find . -name 'Kconfig*' -exec install -Dm644 {} "$builddir/{}" \;

  msg2 "Removing unneeded architectures..."
  local arch
  for arch in "$builddir"/arch/*/; do
    [[ $arch = */x86/ ]] && continue
    msg2 "Removing $(basename "$arch")"
    rm -r "$arch"
  done

  msg2 "Removing documentation..."
  rm -r "$builddir/Documentation"

  msg2 "Removing broken symlinks..."
  find -L "$builddir" -type l -printf 'Removing %P\n' -delete

  msg2 "Removing loose objects..."
  find "$builddir" -type f -name '*.o' -printf 'Removing %P\n' -delete

  msg2 "Stripping build tools..."
  local file
  while read -rd '' file; do
    case "$(file -bi "$file")" in
      application/x-sharedlib\;*)      # Libraries (.so)
        strip -v $STRIP_SHARED "$file" ;;
      application/x-archive\;*)        # Libraries (.a)
        strip -v $STRIP_STATIC "$file" ;;
      application/x-executable\;*)     # Binaries
        strip -v $STRIP_BINARIES "$file" ;;
      application/x-pie-executable\;*) # Relocatable binaries
        strip -v $STRIP_SHARED "$file" ;;
    esac
  done < <(find "$builddir" -type f -perm -u+x ! -name vmlinux -print0)

  msg2 "Stripping vmlinux..."
  strip -v $STRIP_STATIC "$builddir/vmlinux"

  msg2 "Adding symlink..."
  mkdir -p "$pkgdir/usr/src"
  ln -sr "$builddir" "$pkgdir/usr/src/$pkgbase"
}
