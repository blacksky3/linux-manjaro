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

manjaropatchpath=https://gitlab.manjaro.org/packages/core/linux${manjaromajor}/-/tree/8a543c822d8ab5c7ea9dc6c69cc5e73ece495315
lucjanpath=https://raw.githubusercontent.com/sirlucjan/kernel-patches/master/${major}

source=(https://mirrors.edge.kernel.org/pub/linux/kernel/v5.x/linux-$pkgver.tar.xz
        ${manjaropatchpath}/config
        # Manjaro patches
        # ARCH Patches
        ${manjaropatchpath}/0001-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-CLONE_NEWUSER.patch
        ${manjaropatchpath}/0002-Btintel_Fix_bdaddress_comparison_with_garbage_value.patch
        # Temp Fixes
        # MANJARO Patches
        ${manjaropatchpath}/0101-i2c-nuvoton-nc677x-hwmon-driver.patch
        #${manjaropatchpath}/0102-iomap-iomap_bmap-should-accept-unwritten-maps.patch
        #${manjaropatchpath}/0104-revert-xhci-Add-support-for-Renesas-controller-with-memory.patch
        ${manjaropatchpath}/0105-quirk-kernel-org-bug-210681-firmware_rome_error.patch
        # Lenovo + AMD
        #${manjaropatchpath}/0201-lenovo-wmi2.patch
        # Bootsplash
        ${manjaropatchpath}/0301-revert-fbcon-remove-now-unusued-softback_lines-cursor-argument.patch
        ${manjaropatchpath}/0302-revert-fbcon-remove-no-op-fbcon_set_origin.patch
        ${manjaropatchpath}/0303-revert-fbcon-remove-soft-scrollback-code.patch
        ${manjaropatchpath}/0401-bootsplash.patch
        ${manjaropatchpath}/0402-bootsplash.patch
        ${manjaropatchpath}/0403-bootsplash.patch
        ${manjaropatchpath}/0404-bootsplash.patch
        ${manjaropatchpath}/0405-bootsplash.patch
        ${manjaropatchpath}/0406-bootsplash.patch
        ${manjaropatchpath}/0407-bootsplash.patch
        ${manjaropatchpath}/0408-bootsplash.patch
        ${manjaropatchpath}/0409-bootsplash.patch
        ${manjaropatchpath}/0410-bootsplash.patch
        ${manjaropatchpath}/0411-bootsplash.patch
        ${manjaropatchpath}/0412-bootsplash.patch
        ${manjaropatchpath}/0413-bootsplash.gitpatch
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

sha256sums=('6d186158a4c44a4df438e0286ee8186f1cc9cc9d8a909d4c3e25a4f7eca8b023'
            'f9721288051d4c6a028289ad2457fdea96162906c0211039b8edefc122c77fbc'
            '7b56e5b3dca14ef8ea00b0c3bc27da279fce7f362816f4c4977590e0abc434d9'
            'fdd1e0fc4c4151bfacfb282da4c39f0a32401d843b6daa975a7dc03ac4903f6a'
            'a8e45dcc072cc483bc01a4905cb6ba1d4d05966492a940bc926556b56e7dfb84'
            '293e252f344f425adfc76c3a3635f5cf7f9b1f22046644efd858e6dcd9cd7607'
            '507fc8e85a6e8951a72a5e8daaad6f4cf4ec118e88b11fe20fd40aa4fde17639'
            'e18b9b00053c18f58a957c9190dd9615c8dd3d1e720a51f9aacce37549cd41bf'
            'c7b941d39c8698a4263363429dd4a4aa1aef68dd8a0016fb23cdf77a8bdcc962'
            '1f97ead67339643c119d09b5cfd8d28875654e0fbbc467bd13f32b64e312441c'
            '2b37f0fb635a12877f630de6ec4c7aefee5a0d7177d48b67ae795d9829d1e32b'
            '13d2dce1083bfb81c1f70d6ad27db8af3eba39164c0c5258873f2d2f605e7624'
            'b3dd7ad080c7358bde898e2f4277507feec2a0ad7395f49cd39a64b369e111bb'
            '78c34bd9b8f2ee93fd48ccb754bfa2ebeac855beb5a24c25400b1755b0cc71ac'
            'a54124a8636cbfbc89144d6ccb77060aff267a4d44456d4959a744828716eb73'
            '991f9edc1a66978488937dd9caacdb8fcd141bad00395360da3d0db9d2705626'
            '25c6d7237bbe8ba64bc1c094fb70251fb960bc064ac1763ca3d2e5717a1c95c9'
            '1619c1d55c1abb10b42a6699ebd8cde0aca79640c8ac60a7c8f88a7e15b22f91'
            'b307a7d1c98fad78abfb7037ab059d3fac85adc5c7392881e7ee3ec3d31ebae0'
            '23acec0b073418deb11e091f1612d3bb16b12a5b01e8700d466b498bbc38c54f'
            '3d9bd6e012af47bab363acdd34763c4ab12acdc2e374ab4de97e502956127a84'
            '998561f71c1594f8d29135fb52da0ced4591533fa0c62e9aa7a9902dc642b986'
            '1d5082af4e011cc7e693119b9c89eb621a05495bb4d1c238dd6bbeb7587dc8ff'
            '362cbeb8ee42c34ae635815817a4a6585e422a5ab01d36fe6aa5108a28712ed2'
            '12947c1f27d1c6b7ec46228f4b71a8eb7b47488e7041015817a9a68ecd451109'
            '186058e970add37ac245c97ba40efacbd778b3b7df08e845d752f4f085864686'
            '2c83042bb9e5c2f5851567617d0376a53b14494ed4e085af2a7fa1b0194cd071'
            'cb29309136affdc47bd13dfd88e611be15c2b301c9a1320cb597807bafce321a'
            '5223b5cbabf75d0a9e1da40a36cde06fd094763762322f8f5c9014b9e63527cd'
            'd20bf76974609f24ac092330e0fe0005ac77c401937511e71e6f1d5240042caa'
            'a6f810ec83bb5f2d68a25ff03c6940dfe5e7b2e9bfa59b9629bb703b0e11eb41'
            '717749721483b8b19e527c3659efe2015a8147e4e6fc2515f96775574a0a40d3'
            'f74c3222bd024ce7f9b4e881cd910e6ec71ceb8b612caef337f3cd0df9876b03'
            '47bcc117d311989050d23fb987e6d63df4e09642dd66f950a784759aeb98bea0'
            'a92ecc160a8e6a6c986b18e9927fa45783f59f81bcbefcb031d8e70accd51db8'
            '380bcf40cc8396e97bd1d7f2577ab2ace51885858d3f155b1fb2dd5469efd00d')
