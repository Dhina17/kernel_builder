# Kernel compile script
ROOT_DIR=$(pwd)

function compile() {
    # export the arch
    export ARCH=arm64

    # make clang/gcc PATH available
    PATH=:"${ROOT_DIR}/clang/bin:${PATH}:${ROOT_DIR}/gcc/bin:${PATH}"

    # make the config
    make O=out onclite-perf_defconfig

    # Start the build
    make -j$(nproc --all) O=out \
                    ARCH=arm64 \
                    CC=clang \
                    CLANG_TRIPLE=aarch64-linux-gnu- \
                    CROSS_COMPILE=aarch64-linux-android-
}


# Starts here
compile
