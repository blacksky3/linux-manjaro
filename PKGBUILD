# _     _            _        _          _____
#| |__ | | __ _  ___| | _____| | ___   _|___ /
#| '_ \| |/ _` |/ __| |/ / __| |/ / | | | |_ \
#| |_) | | (_| | (__|   <\__ \   <| |_| |___) |
#|_.__/|_|\__,_|\___|_|\_\___/_|\_\\__, |____/
#                                  |___/

#Maintainer: blacksky3 <blacksky3@tuta.io> <https://github.com/blacksky3>
#Credits: Jan Alexander Steffens (heftig) <heftig@archlinux.org> ---> For the base PKGBUILD
#Credits: Andreas Radke <andyrtr@archlinux.org> ---> For the base PKGBUILD
#Credits: Linus Torvalds ---> For the linux kernel
#Credits: Joan Figueras <ffigue at gmail dot com> ---> For the base PKFBUILD
#Credits: Bernhard Landauer <bernhard@manjaro.org> ---> For the base PKFBUILD
#Credits: Philip Müller <philm[at]manjaro[dot]org> ---> For the base PKFBUILD
#Credits: Tobias Powalowski <tpowa@archlinux.org>
#Credits: Thomas Baechler <thomas@archlinux.org>
#Credits: Piotr Górski <lucjan.lucjanov@gmail.com> <https://github.com/sirlucjan> ---> For AMD64, Block and BLK and CPU patches
#Credits: Graysky2 <https://github.com/graysky2> ---> For kernel_compiler_patch
#Credits: Etienne Juvigny (Tk-Glitch) <tkg@froggi.es> <https://github.com/Tk-Glitch> ---> For config setings

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
pkgver=5.16.11
major=5.16
manjaromajor=516
pkgrel=1
arch=(x86_64)
url='https://www.kernel.org/'
license=(GPL-2.0)
makedepends=(bc kmod libelf pahole cpio perl tar xz zstd xmlto git gcc gcc-libs glibc binutils make patch)
if [[ "$_compiler" = "2" ]]; then
  makedepends+=(clang llvm llvm-libs lld)
fi
options=(!strip)

manjaropath=https://gitlab.manjaro.org/packages/core/linux${manjaromajor}/-/tree/8a543c822d8ab5c7ea9dc6c69cc5e73ece495315
lucjanpath=https://raw.githubusercontent.com/sirlucjan/kernel-patches/master/${major}

source=(https://mirrors.edge.kernel.org/pub/linux/kernel/v5.x/linux-$pkgver.tar.xz
        ${manjaropath}/config
        # Manjaro patches
        # ARCH Patches
        ${manjaropath}/0001-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-CLONE_NEWUSER.patch
        ${manjaropath}/0002-Btintel_Fix_bdaddress_comparison_with_garbage_value.patch
        # Temp Fixes
        # MANJARO Patches
        ${manjaropath}/0101-i2c-nuvoton-nc677x-hwmon-driver.patch
        #${manjaropath}/0102-iomap-iomap_bmap-should-accept-unwritten-maps.patch
        #${manjaropath}/0104-revert-xhci-Add-support-for-Renesas-controller-with-memory.patch
        ${manjaropath}/0105-quirk-kernel-org-bug-210681-firmware_rome_error.patch
        # Lenovo + AMD
        #${manjaropath}/0201-lenovo-wmi2.patch
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
        # Piotr Górski patches
        # Amd64 patches
        ${lucjanpath}/amd64-patches/0001-amd64-patches.patch
        # Arch patches Fix! Upstream manjaro removed some Arch patches
        ${lucjanpath}/arch-patches-v5-sep/0003-Bluetooth-Read-codec-capabilities-only-if-supported.patch
        ${lucjanpath}/arch-patches-v5-sep/0004-Bluetooth-fix-deadlock-for-RFCOMM-sk-state-change.patch
        ${lucjanpath}/arch-patches-v5-sep/0005-mt76-mt7921-add-support-for-PCIe-ID-0x0608-0x0616.patch
        ${lucjanpath}/arch-patches-v5-sep/0006-mt76-mt7921-reduce-log-severity-levels-for-informati.patch
        ${lucjanpath}/arch-patches-v5-sep/0007-Revert-NFSv4.1-query-for-fs_location-attr-on-a-new-f.patch
        # Block patches. Set BFQ as default
        ${lucjanpath}/block-patches-sep/0001-block-Kconfig.iosched-set-default-value-of-IOSCHED_B.patch
        ${lucjanpath}/block-patches-sep/0002-block-Fix-depends-for-BLK_DEV_ZONED.patch
        ${lucjanpath}/ll-patches/0002-LL-elevator-set-default-scheduler-to-bfq-for-blk-mq.patch
        ${lucjanpath}/ll-patches/0003-LL-elevator-always-use-bfq-unless-overridden-by-flag.patch
        # BLK patches
        ${lucjanpath}/blk-patches-v4/0001-blk-patches.patch
        # CPU patches
        ${lucjanpath}/cpu-patches-sep/0002-init-Kconfig-enable-O3-for-all-arches.patch
        ${lucjanpath}/cpu-patches-sep/0004-Makefile-Turn-off-loop-vectorization-for-GCC-O3-opti.patch
        # Graysky2 CPU patch
        https://raw.githubusercontent.com/graysky2/kernel_compiler_patch/master/more-uarches-for-kernel-5.15+.patch)

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

  msg2 "Enable Fsync support"
  scripts/config --enable CONFIG_FUTEX
  scripts/config --enable CONFIG_FUTEX_PI

  sleep 2s

  msg "Patch addition config"

  msg2 "Enable OpenRGB SMBus access"
  scripts/config --module CONFIG_I2C_NCT6775

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

  msg2 "Enable BLK_CGROUP_IOSTAT (IO statistics monitor per cgroup)"
  scripts/config --module CONFIG_BLK_CGROUP_IOSTAT

  sleep 2s

  msg2 "Enable CONFIG_USER_NS_UNPRIVILEGED"
  scripts/config --enable CONFIG_USER_NS

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
  pkgdesc='The Linux kernel and modules with Manjaro patches (Bootsplash support) with Piotr Górski AMD64, Block, BLK and CPU patches and Graysky2 kernel_compiler_patch patch'
  depends=(coreutils kmod initramfs mkinitcpio)
  optdepends=('linux-firmware: firmware images needed for some devices'
              'crda: to set the correct wireless channels of your country'
              'bootsplash-systemd: for bootsplash functionality')
  provides=(VIRTUALBOX-GUEST-MODULES WIREGUARD-MODULE)

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
  depends=("${pkgbase}" gawk python libelf pahole)

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

sha256sums=(6d186158a4c44a4df438e0286ee8186f1cc9cc9d8a909d4c3e25a4f7eca8b023
            a2b17f87fc59fda85b9d4dd24a8db1e92ab5bfd58b08ae8884ff54d1da23ce9d
            18e196b80b68814ffc03d1a219878a492b40af2895f981b66192ccdb364ff026
            6d029cf980caa706361bc9e7d07fd2622168a334613f820cc59339031b1838c0
            040b0427ee95b277b16c1b3a7ec6fcd497cf8981a066a282361af5374f29a453
            210f3e2080127ae04892886fe44b75783b2232c12c2e10615462f3f070a1eaa2
            02547c2424c75c004d00387c2be002fca7f9ab6ac623f3d0a3c72be8a7f2b194
            9284fd3fef169eca6edfbbf0e279efe825f5a48968cd9f8251e2c14864e33943
            bcbf043c33c6acb6a1cabc16d13f92c37cfd6360ac70fc9a6cadc763065477a2
            9d2a441b4a9c501840091957489eea8714c533f21e8da1fb81b9130d6e915159
            8296887b053ba079d18b7559a936b09f93993047100637ec3d8b0abcad3916a9
            b2a1d6a754f0f73402d90b11f5f15de35f8e14660f5023d48b383678df12f391
            a16ad0696e770e81496e84d143f60c5cde389892e65fa4ee49fdffea284233ef
            2dbea3bfc298520d8696051dc0bf19934030a428fc00842330372a6e7b90aba0
            b61902e2abea869dfe4e842bee104778514271ad64959ea4ca708f7b7080fcf5
            91f5030c2ae9e3e6e9f1f8e4e2aeb718f9e204ee91d8ba2e8b54a33caae9b12a
            5992a71834c63940db971416ee0328a6f9c51e2930888e99215682745956b24b
            4fce31fdea8d2bbc13fb854f6133663ead65ba400d9badbbd2ff9e5e9143e090
            c967d8ec81926f3b393bfe63adaef61bc6391bf5726c5cc12ff1828dd1be4f39
            e9161b52d711c8399beac421a3c6eb7a052ebd9d9907c8a7149895eb1bb4bf0d
            cbbc625a1ef114d9527525c70eb697f10d6771b10321231e57f5fba1ad998f21
            1dbc7895d9e28ebfc8b4acbbe870a60fc4b47b6566e3a8f242fda78bfcf5e684
            1d5082af4e011cc7e693119b9c89eb621a05495bb4d1c238dd6bbeb7587dc8ff
            362cbeb8ee42c34ae635815817a4a6585e422a5ab01d36fe6aa5108a28712ed2
            12947c1f27d1c6b7ec46228f4b71a8eb7b47488e7041015817a9a68ecd451109
            186058e970add37ac245c97ba40efacbd778b3b7df08e845d752f4f085864686
            2c83042bb9e5c2f5851567617d0376a53b14494ed4e085af2a7fa1b0194cd071
            cb29309136affdc47bd13dfd88e611be15c2b301c9a1320cb597807bafce321a
            5223b5cbabf75d0a9e1da40a36cde06fd094763762322f8f5c9014b9e63527cd
            d20bf76974609f24ac092330e0fe0005ac77c401937511e71e6f1d5240042caa
            a6f810ec83bb5f2d68a25ff03c6940dfe5e7b2e9bfa59b9629bb703b0e11eb41
            717749721483b8b19e527c3659efe2015a8147e4e6fc2515f96775574a0a40d3
            f74c3222bd024ce7f9b4e881cd910e6ec71ceb8b612caef337f3cd0df9876b03
            47bcc117d311989050d23fb987e6d63df4e09642dd66f950a784759aeb98bea0
            a92ecc160a8e6a6c986b18e9927fa45783f59f81bcbefcb031d8e70accd51db8
            380bcf40cc8396e97bd1d7f2577ab2ace51885858d3f155b1fb2dd5469efd00d)
