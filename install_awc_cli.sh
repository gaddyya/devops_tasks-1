#!/bin/bash

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    echo "This is linux-gnu"
    OS_LIKE=`grep '^ID_LIKE' /etc/os-release`
    PAC_YUM='fedora'
    PAC_APT='debian'
    if [[ "$OS_LIKE" == *"$PAC_YUM"* ]]; then
        sudo yum update -y
        sudo yum install awscli -y
        aws --version
    fi
    if [[ "$OS_LIKE" == *"$PAC_APT"* ]]; then
        sudo apt-get update -y
        sudo apt-get install awscli -y
        aws --version
    fi

    elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo "This is MacOS"
    curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
    sudo installer -pkg AWSCLIV2.pkg -target /
    which aws
    aws --version

    elif [[ "$OSTYPE" == "msys" ]]; then
    echo "This is Windows"
    powerShell "msiexec.exe /i https://awscli.amazonaws.com/AWSCLIV2.msi "

else
    echo "Sorry, I don't know what to do"
fi