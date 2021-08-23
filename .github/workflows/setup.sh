## Script to setup the environment and download the required tools

function setup () {
    # Install dependencies
    sudo apt install bc bash git-core gnupg build-essential \
        zip curl make automake autogen autoconf autotools-dev libtool shtool python \
        m4 gcc libtool zlib1g-dev flex bison libssl-dev
    
    # Download gcc
    git clone https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9 -b android-10.0.0_r47 --depth=1 gcc

    # Download Clang
    wget https://android.googlesource.com/platform/prebuilts/clang/host/linux-x86/+archive/refs/tags/android-11.0.0_r37/clang-r365631c.tar.gz
    mkdir clang
    tar xvzf clang-r365631c.tar.gz -C clang
    rm clang-r365631c.tar.gz

    # Clone AnyKernel3
    git clone https://github.com/Dhina17/AnyKernel3

}

# Starts here
setup