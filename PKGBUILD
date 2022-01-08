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
#Credits: Bernhard Landauer <bernhard@manjaro.org>
#Credits: Philip Müller <philm[at]manjaro[dot]org>
#Credits: Tobias Powalowski <tpowa@archlinux.org>
#Credits: Thomas Baechler <thomas@archlinux.org>


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
pkgver=5.15.13
major=5.15
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

source+=(# ARCH Patches
         '0001-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-CLONE_NEWUSER.patch'
         '0002-HID-quirks-Add-Apple-Magic-Trackpad-2-to-hid_have_special_driver-list.patch'
         'PCI_Add_more_NVIDIA_controllers_to_the_MSI_masking_quirk.patch'
         'iommu_intel_do_deep_dma-unmapping_to_avoid_kernel-flooding.patch'
         'cpufreq_intel_pstate_ITMT_support_for_overclocked_system.patch'
         'Bluetooth_btintel_Fix_bdaddress_comparison_with_garbage_value.patch'
         'lg-laptop_Recognize_more_models.patch'
         # MANJARO Patches
         '0101-i2c-nuvoton-nc677x-hwmon-driver.patch'
         #'0102-iomap-iomap_bmap-should-accept-unwritten-maps.patch'
         '0103-futex.patch' # https://github.com/sirlucjan/kernel-patches
         '0104-revert-xhci-Add-support-for-Renesas-controller-with-memory.patch'
         '0105-quirk-kernel-org-bug-210681-firmware_rome_error.patch'
         '0108-drm_i915_Add_workaround_numbers_to_GEN7_COMMON_SLICE_CHICKEN1_whitelisting.patch::https://patchwork.freedesktop.org/patch/463650/raw/'
        # Lenovo + AMD
        '0201-lenovo-wmi2.patch'
        # other patches
        # Bootsplash
        '0301-revert-fbcon-remove-now-unusued-softback_lines-cursor-argument.patch'
        '0302-revert-fbcon-remove-no-op-fbcon_set_origin.patch'
        '0303-revert-fbcon-remove-soft-scrollback-code.patch'
        '0401-bootsplash.patch'
        '0402-bootsplash.patch'
        '0403-bootsplash.patch'
        '0404-bootsplash.patch'
        '0405-bootsplash.patch'
        '0406-bootsplash.patch'
        '0407-bootsplash.patch'
        '0408-bootsplash.patch'
        '0409-bootsplash.patch'
        '0410-bootsplash.patch'
        '0411-bootsplash.patch'
        '0412-bootsplash.patch'
        '0413-bootsplash.gitpatch')
md5sums+=('SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP')
          
source+=("0001-hrtimer-Create-highres-timeout-variants-of-schedule_.patch"
         "0002-time-Special-case-calls-of-schedule_timeout-1-to-use.patch"
         "0003-timer-Convert-msleep-to-use-hrtimers-when-active.patch"
         "0004-hrtimer-Replace-all-schedule-timeout-1-with-schedule.patch"
         "0005-hrtimer-Replace-all-calls-to-schedule_timeout_interr.patch"
         "0006-hrtimer-Replace-all-calls-to-schedule_timeout_uninte.patch"
         "0007-time-Don-t-use-hrtimer-overlay-when-pm_freezing-sinc.patch"
         "0008-clockevents-hrtimer-Make-hrtimer-granularity-and-min.patch")
md5sums+=("SKIP"
          "SKIP"
          "SKIP"
          "SKIP"
          "SKIP"
          "SKIP"
          "SKIP"
          "SKIP")

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare(){

  cd linux-$pkgver

  # Apply any patch
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    msg2 "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  msg2 "Apply 0413-bootsplash"
  git apply -p1 < "../0413-bootsplash.gitpatch"

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

  msg2 "Set CPU Frequency scaling CONFIG_CPU_FREQ_DEFAULT_GOV/CONFIG_CPU_FREQ_GOV for performance"
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
  scripts/config --enable CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE
  scripts/config --enable CONFIG_CPU_FREQ_GOV_PERFORMANCE

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

  msg2 "Enable PREEMPT"
  scripts/config --disable CONFIG_PREEMPT_NONE
  scripts/config --disable CONFIG_PREEMPT_VOLUNTARY
  scripts/config --enable CONFIG_PREEMPT
  scripts/config --enable CONFIG_PREEMPT_COUNT
  scripts/config --enable CONFIG_PREEMPTION

  sleep 2s

  msg2 "Set to full tickless"
  scripts/config --disable CONFIG_HZ_PERIODIC
  scripts/config --disable CONFIG_NO_HZ_IDLE
  scripts/config --enable CONFIG_NO_HZ_FULL
  scripts/config --enable CONFIG_NO_HZ
  scripts/config --enable CONFIG_NO_HZ_COMMON
  #scripts/config --enable CONFIG_CONTEXT_TRACKING
  #scripts/config --disable CONFIG_CONTEXT_TRACKING_FORCE

  sleep 2s

  msg2 "Disabling Kyber I/O scheduler"
  scripts/config --disable CONFIG_MQ_IOSCHED_KYBER

  sleep 2s

  msg2 "Enable Deadline I/O scheduler"
  scripts/config --enable CONFIG_MQ_IOSCHED_DEADLINE

  sleep 2s

  msg2 "Enable CONFIG_BFQ_CGROUP_DEBUG"
  scripts/config --enable CONFIG_BFQ_CGROUP_DEBUG

  sleep 2s

  msg2 "Enable Fsync support"
  scripts/config --enable CONFIG_FUTEX
  scripts/config --enable CONFIG_FUTEX_PI

  sleep 2s

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

  msg2 "Don't run depmod on make install..."
  # We'll do this ourselves in packaging
  sed -i '2iexit 0' scripts/depmod.sh

  # Config
  if [[ "$_compiler" = "1" ]]; then
    make ARCH=${ARCH} CC=${CC} CXX=${CXX} HOSTCC=${HOSTCC} HOSTCXX=${HOSTCXX} olddefconfig
  elif [[ "$_compiler" = "2" ]]; then
    make ARCH=${ARCH} CC=${CC} CXX=${CXX} LLVM=1 LLVM_IAS=1 HOSTCC=${HOSTCC} HOSTCXX=${HOSTCXX} olddefconfig
  fi

  make -s kernelrelease > version
  msg2 "Prepared $pkgbase version $(<version)"
}

build(){

  cd "${srcdir}"/linux-$pkgver

  # make -j$(nproc) all
  msg2 "make -j$(nproc) all..."
  if [[ "$_compiler" = "1" ]]; then
    make ARCH=${ARCH} CC=${CC} CXX=${CXX} HOSTCC=${HOSTCC} HOSTCXX=${HOSTCXX} -j$(nproc) bzImage modules
  elif [[ "$_compiler" = "2" ]]; then
    make ARCH=${ARCH} CC=${CC} CXX=${CXX} LLVM=1 LLVM_IAS=1 HOSTCC=${HOSTCC} HOSTCXX=${HOSTCXX} -j$(nproc) bzImage modules
  fi
}

_package(){
  pkgdesc="The Linux kernel and modules with Manjaro patches (Bootsplash support). Ashmem and binder are enabled"
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
  #install -Dm644 arch/${ARCH}/boot/bzImage "$modulesdir/vmlinuz"
  msg2 "install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz""
  install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"

  # Used by mkinitcpio to name the kernel
  msg2 "echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase""
  echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"
  echo "${major}-${CARCH}" | install -Dm644 /dev/stdin "$modulesdir/kernelbase"

  msg2 "Installing modules..."
  if [[ "$_compiler" = "1" ]]; then
    make ARCH=${ARCH} CC=${CC} CXX=${CXX} HOSTCC=${HOSTCC} HOSTCXX=${HOSTCXX} INSTALL_MOD_PATH="${pkgdir}"/usr INSTALL_MOD_STRIP=1 -j$(nproc) modules_install
  elif [[ "$_compiler" = "2" ]]; then
    make ARCH=${ARCH} CC=${CC} CXX=${CXX} LLVM=1 LLVM_IAS=1 HOSTCC=${HOSTCC} HOSTCXX=${HOSTCXX} INSTALL_MOD_PATH="${pkgdir}"/usr INSTALL_MOD_STRIP=1 -j$(nproc) modules_install
  fi

  # add kernel version
  msg2 "Add kernel version..."
  echo "${pkgver}-${pkgbase} ${CARCH}" > "${pkgdir}/boot/${pkgbase}-${CARCH}.kver"

  # make room for external modules
  msg2 "Make room for external modules..."
  local _extramodules="extramodules-${kernver}-${pkgbase}"
  ln -s "../${extramodules}" "${pkgdir}/usr/lib/modules/${kernver}/extramodules"

  # add real version for building modules and running depmod from hook
  msg2 "Add real version for building modules and running depmod from hook..."
  echo "${kernver}" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modules/${extramodules}/version"

  # remove build and source links
  msg2 "Remove build dir and source dir..."
  rm -rf "$modulesdir"/{source,build}

  # now we call depmod...
  msg2 "Now we call depmod..."
  depmod -b "${pkgdir}/usr" -F System.map "${kernver}"
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
