## Script to make zip and send it to telegram channel
DATE_TIME=$(date +"%Y%m%d-%H%M")

function make_zip() {
    cp out/arch/arm64/boot/Image.gz-dtb AnyKernel3
    cd AnyKernel3
    zip -r9 Test-Kernel-onclite-${DATE_TIME}.zip *
    cd ..
}

function send_zip() {
    ZIP=$(echo AnyKernel3/*.zip)

    # Send the zip to telegram through bot
    curl -F document=@$ZIP "https://api.telegram.org/bot${BOT_TOKEN}/sendDocument" \
            -F chat_id="${CHAT_ID}" \


}

# Starts here
make_zip
send_zip