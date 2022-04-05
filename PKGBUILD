# _     _            _        _          _____
#| |__ | | __ _  ___| | _____| | ___   _|___ /
#| '_ \| |/ _` |/ __| |/ / __| |/ / | | | |_ \
#| |_) | | (_| | (__|   <\__ \   <| |_| |___) |
#|_.__/|_|\__,_|\___|_|\_\___/_|\_\\__, |____/
#                                  |___/

#Maintainer: blacksky3 <blacksky3@tuta.io> <https://github.com/blacksky3>
#Credits: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
#Credits: Andreas Radke <andyrtr@archlinux.org>
#Credits: Bernhard Landauer <bernhard@manjaro.org>
#Credits: Philip Müller <philm[at]manjaro[dot]org>
#Credits: Tobias Powalowski <tpowa@archlinux.org>
#Credits: Thomas Baechler <thomas@archlinux.org>

################################# Arch ################################

ARCH=x86

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
pkgver=5.17.1
major=5.17
manjaromajor=517
pkgrel=1
arch=(x86_64)
url='https://www.kernel.org/'
license=(GPL-2.0)
makedepends=(bison flex bc kmod libelf pahole cpio perl tar xz zstd xmlto git gcc gcc-libs glibc binutils make patch)
if [[ "$_compiler" = "2" ]]; then
  makedepends+=(clang llvm llvm-libs lld)
fi
options=(!strip)

manjaropath=https://gitlab.manjaro.org/packages/core/linux${manjaromajor}/-/raw/18fee192bbc2946fe6aa544de16c3d7058e4ee94
patchpath=https://raw.githubusercontent.com/blacksky3/patches/main/$major

source=(https://mirrors.edge.kernel.org/pub/linux/kernel/v5.x/linux-$pkgver.tar.xz
        ${manjaropath}/config
        # Manjaro patches
        # ARCH Patches
        ${manjaropath}/0101-ZEN_Add_sysctl_and_CONFIG_to_disallow_unprivileged_CLONE_NEWUSER.patch
        ${manjaropath}/0102-random-treat_bootloader_trust_toggle_the_same_way_as_cpu_trust_toggle.patch
        ${manjaropath}/0103-Revert-swiotlb-rework-fix_info_leak_with_DMA_FROM_DEVICE.patch
        # Temp Fixes
        # MANJARO Patches
        # Lenovo + AMD
        # Bootsplash
        ${manjaropath}/0301-revert-fbcon-remove-now-unusued-softback_lines-cursor-argument.patch
        ${manjaropath}/0302-revert-fbcon-remove-no-op-fbcon_set_origin.patch
        ${manjaropath}/0303-revert-fbcon-remove-soft-scrollback-code.patch
        ${manjaropath}/0401-bootsplash.patch
        ${manjaropath}/0402-bootsplash.patch
        ${manjaropath}/0403-bootsplash.patch
        ${manjaropath}/0404-bootsplash.patch
        ${manjaropath}/0405-bootsplash.patch
        ${manjaropath}/0406-bootsplash.patch
        ${manjaropath}/0407-bootsplash.patch
        ${manjaropath}/0408-bootsplash.patch
        ${manjaropath}/0409-bootsplash.patch
        ${manjaropath}/0410-bootsplash.patch
        ${manjaropath}/0411-bootsplash.patch
        ${manjaropath}/0412-bootsplash.patch
        ${manjaropath}/0413-bootsplash.gitpatch
        # Other patches
        # Arch patches Hot fix. Not in official manjaro package at this moment
        ${patchpath}/arch/0003-tick-Detect-and-fix-jiffies-update-stall.patch
        ${patchpath}/arch/0004-tick-rcu-Remove-obsolete-rcu_needs_cpu-parameters.patch
        ${patchpath}/arch/0005-tick-rcu-Stop-allowing-RCU_SOFTIRQ-in-idle.patch
        ${patchpath}/arch/0006-lib-irq_poll-Declare-IRQ_POLL-softirq-vector-as-ksof.patch
        # Block patches. Set BFQ as default
        ${patchpath}/block/0001-block-Kconfig.iosched-set-default-value-of-IOSCHED_B.patch
        ${patchpath}/block/0002-block-Fix-depends-for-BLK_DEV_ZONED.patch
        ${patchpath}/block/0003-block-set-rq_affinity-2-for-full-multithreading-I-O.patch
        ${patchpath}/block/0002-LL-elevator-set-default-scheduler-to-bfq-for-blk-mq.patch
        ${patchpath}/block/0003-LL-elevator-always-use-bfq-unless-overridden-by-flag.patch
        # CPU patches
        ${patchpath}/cpu/0002-init-Kconfig-enable-O3-for-all-arches.patch
        ${patchpath}/cpu/0004-Makefile-Turn-off-loop-vectorization-for-GCC-O3-opti.patch
        # CPU Power patches
        ${patchpath}/cpupower/0001-cpupower-update-for-Linux-5.18-rc1.patch
        # Futex
        ${patchpath}/futex/0001-futex-Add-entry-point-for-FUTEX_WAIT_MULTIPLE-opcode.patch
        # Wine
        ${patchpath}/wine/0001-winesync-Introduce-the-winesync-driver-and-character.patch
        # Graysky2 CPU patch
        https://raw.githubusercontent.com/graysky2/kernel_compiler_patch/master/more-uarches-for-kernel-5.17+.patch)

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare(){
  cd ${srcdir}/linux-$pkgver

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

  msg "Base config"

  # Disable LTO with clang
  if [[ "$_compiler" = "2" ]]; then
    msg2 "Disable LTO"
    scripts/config --disable CONFIG_LTO
    scripts/config --disable CONFIG_LTO_CLANG
    scripts/config --disable CONFIG_ARCH_SUPPORTS_LTO_CLANG
    scripts/config --disable CONFIG_ARCH_SUPPORTS_LTO_CLANG_THIN
    scripts/config --disable CONFIG_HAS_LTO_CLANG
    scripts/config --disable CONFIG_LTO_NONE
    scripts/config --disable CONFIG_LTO_CLANG_FULL
    scripts/config --disable CONFIG_LTO_CLANG_THIN

    sleep 2s
  fi

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

  msg2 "Enable Intel Processor P-State driver"
  scripts/config --enable CONFIG_X86_INTEL_PSTATE

  sleep 2s

  msg2 "Enable AMD Processor P-State driver"
  scripts/config --enable CONFIG_X86_AMD_PSTATE

  sleep 2s

  msg2 "Enable Fsync support"
  scripts/config --enable CONFIG_FUTEX
  scripts/config --enable CONFIG_FUTEX_PI

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

  msg "Patch addition config"

  msg2 "Enable OpenRGB SMBus access"
  scripts/config --module CONFIG_I2C_NCT6775

  sleep 2s

  msg2 "Enable CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE_O3"
  scripts/config --disable CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE
  scripts/config --disable CONFIG_CC_OPTIMIZE_FOR_SIZE
  scripts/config --enable CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE_O3

  sleep 2s

  msg2 "Enable winesync"
  scripts/config --enable CONFIG_WINESYNC

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

  msg2 "Enable CONFIG_USER_NS_UNPRIVILEGED"
  scripts/config --enable CONFIG_USER_NS

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
  cd ${srcdir}/linux-$pkgver

  # make -j$(nproc) all
  msg2 "make -j$(nproc) all..."
  if [[ "$_compiler" = "1" ]]; then
    make ARCH=${ARCH} CC=${CC} CXX=${CXX} HOSTCC=${HOSTCC} HOSTCXX=${HOSTCXX} -j$(nproc) all
  elif [[ "$_compiler" = "2" ]]; then
    make ARCH=${ARCH} CC=${CC} CXX=${CXX} LLVM=1 LLVM_IAS=1 HOSTCC=${HOSTCC} HOSTCXX=${HOSTCXX} -j$(nproc) all
  fi
}

_package(){
  pkgdesc='The Linux kernel and modules with Manjaro patches (Bootsplash support), Block, CPU, CPU Power, Futex, Wine and kernel_compiler_patch patch'
  depends=(coreutils kmod initramfs mkinitcpio)
  optdepends=('wireless-regdb: to set the correct wireless channels of your country'
              'linux-firmware: firmware images needed for some devices')
              'bootsplash-systemd: for bootsplash functionality')
  provides=(VIRTUALBOX-GUEST-MODULES WIREGUARD-MODULE)

  cd ${srcdir}/linux-$pkgver

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
  depends=("${pkgbase}" gawk python libelf pahole)

  cd ${srcdir}/linux-$pkgver

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

sha256sums=('7cd5c5d432a25f45060868ce6a8578890e550158a2f779c4a20804b551e84c24'
            'a94d5d374f4cdb439f3958b50f7af0f4e024fa17d7df3f30e548f40314e210c0'
            'f85b07d73b2f4ad8bb6b59ee6624b2dd06a03824fc7b00131a01df36c8d899fe'
            'fc9223bf2d430ab1c122daada4f51d835a74f56c007c82842eeca3acd2d788be'
            'edd40fa0d23e9cbbf5ed7f37b2e0ed8e84798701b08a0dc262afd751acf17e04'
            '2b11905b63b05b25807dd64757c779da74dd4c37e36d3f7a46485b1ee5a9d326'
            '94a8538251ad148f1025cc3de446ce64f73dc32b01815426fb159c722e8fa5bc'
            '1f18c5c10a3c63e41ecd05ad34cd9f6653ba96e9f1049ce2b7bb6da2578ae710'
            '59202940d4f12bad23c194a530edc900e066866c9945e39748484a6545af96de'
            'e096b127a5208f56d368d2cb938933454d7200d70c86b763aa22c38e0ddb8717'
            '8c1c880f2caa9c7ae43281a35410203887ea8eae750fe8d360d0c8bf80fcc6e0'
            '1144d51e5eb980fceeec16004f3645ed04a60fac9e0c7cf88a15c5c1e7a4b89e'
            'dd4b69def2efacf4a6c442202ad5cb93d492c03886d7c61de87696e5a83e2846'
            '028b07f0c954f70ca37237b62e04103e81f7c658bb8bd65d7d3c2ace301297dc'
            'a0c548c5703d25ae34b57931f1162de8b18937e676e5791a0f039922090881e7'
            '8dbb5ab3cb99e48d97d4e2f2e3df5d0de66f3721b4f7fd94a708089f53245c77'
            'a7aefeacf22c600fafd9e040a985a913643095db7272c296b77a0a651c6a140a'
            'e9f22cbb542591087d2d66dc6dc912b1434330ba3cd13d2df741d869a2c31e89'
            '27471eee564ca3149dd271b0817719b5565a9594dc4d884fe3dc51a5f03832bc'
            '60e295601e4fb33d9bf65f198c54c7eb07c0d1e91e2ad1e0dd6cd6e142cb266d'
            '035ea4b2a7621054f4560471f45336b981538a40172d8f17285910d4e0e0b3ef'
            '310a4ebe648e37b77f2d9a1788d3ce40affa36ebcb8f7c77770fa5f63326ef3b'
            '7eb152bb39237d9b1468bb786316f204268922046bb23723446ff9cd79bcba40'
            'c8cd1e2c5a7206cc21894f7e8de124c42e252f55199fa7f7bf20b812daaba213'
            'cd9d15995d1f437a039b248aa2bd4822d8f00e465fa8018687d31e78349483a7'
            '4d385d6a7f7fd9f9aba19d5c24c24814e1af370ff245c8dc98b03482a27cb257'
            'a043e4c393395e6ad50d35c973fa0952f5deb109aee8a23103e24297c027641e'
            '3a02c7382d4d490e16a6132fcba89004f73044c34daf65906c1f823d2ab25aeb'
            '6978a2010c3a2dd7bec1260e3f1e0f9d6ebc032664cdd917847f352e58ba2870'
            'b5ff6f189a83472b737965e0412ca401af4bc539b308e0d9bfa403294e6795e0'
            '74546291433f8e79c9c960075edbd7974d715818b1be6c982308adf93e9e9c4f'
            '7bf85364c3876a648b542ba5a5ada801181183b29366408ef2b2971edab0bd4c'
            '05715dd3a05812c3a1185ca6831c8bd38cee3352dab343717ed77b49b4b527c0'
            '5f6906d9f8c1bd9b30486eba07f2c03ca1849cc5c6a990127ebd81c6e105ac45'
            '7a7fb14b0e2bef1f1b7b0b3cd1870062db504fdf6510ca913231cf901d89e92e'
            'dea86a521603414a8c7bf9cf1f41090d5d6f8035ce31407449e25964befb1e50')
