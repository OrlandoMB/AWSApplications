############################################
#  MICROSOFT .NET CORE 2.1 RUNTIME AND SDK #
#  UBUNTU 18.04                            #
#  ORLANDO MORALES 
############################################

echo VALIDATE DOT NET CORE IS INSTALLED

if which dotnet >/usr/bin/dotnet ;then
    echo DOTNET CORE IS INSTALLED
else
    echo INSTALL DOT NET CORE 

    echo ADD THE MICROSOFT PACKAGE KEY ONE
    sudo apt-key adv --keyserver packages.microsoft.com --recv-keys EB3E94ADBE1229CF

    echo ADD THE MICROSOFT PACKAGE KEY ONE
    sudo apt-key adv --keyserver packages.microsoft.com --recv-keys 52E16F86FEE04B979B07E28DB02C46DF417A0893

    echo ADD THE MICROSOFT PACKAGE FROM UBUNTU BIONIC
    sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-bionic-prod bionic main" > /etc/apt/sources.list.d/dotnetdev.list'
    note

    echo UPDATE SYSTEM
    sudo apt-get update

    echo GET THE UBUNTU 18.04 MICROSOFT PACKAGE PRODUCTION
    wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb
    sudo dpkg -i packages-microsoft-prod.deb

    echo INSTALL UNIVERSE REPOSITORY
    sudo add-apt-repository universe

    echo INSTALL APT TRANSPORT HTTP
    sudo apt-get --assume-yes install apt-transport-https

    echo UPDATE SYSTEM
    sudo apt-get update

    echo INSTALL .NET CORE RUNTIME
    sudo apt-get --assume-yes install aspnetcore-runtime-2.2

    echo INSTALL .NET CORE SDK
    sudo apt-get --assume-yes install dotnet-sdk-2.2

    echo TEST INSTALLATION 
    dotnet --version

fi