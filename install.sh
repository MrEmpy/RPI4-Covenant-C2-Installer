#!/bin/bash

main() {
    printf "\033[0;34m[*] \033[0;37mInstalling...\n" 
    mkdir /root/.dotnet
    wget https://download.visualstudio.microsoft.com/download/pr/e5ec7845-008a-4b7d-a247-c314f2407b8d/9117e05fa19f0217a030666df6b6eb9d/dotnet-sdk-3.1.422-linux-arm.tar.gz -O /root/.dotnet/dotnet-sdk-3.1.422-linux-arm.tar.gz
    cp covenant /usr/bin
    chmod +x /usr/bin/covenant
    cd /root/.dotnet && tar -xf dotnet-sdk-3.1.422-linux-arm.tar.gz
    cd /root/.dotnet && rm dotnet-sdk-3.1.422-linux-arm.tar.gz
    ln -s /root/.dotnet/dotnet /usr/bin/dotnet
    export DOTNET_ROOT=/root/.dotnet/
    echo "export DOTNET_ROOT=/root/.dotnet/" >> ~/.bashrc
    cd /root && git clone https://github.com/cobbr/Covenant
    cd /root/Covenant/Covenant && git submodule update --init --recursive
    printf '\n\n\033[0;32m[+] \033[0;37mCovenant successfully installed! Run using "covenant" command\n'
}

if [[ $EUID -ne 0 ]]; then
   printf "\033[0;34m[*] \033[0;37mRun as root user\n" 
   exit
fi
main
