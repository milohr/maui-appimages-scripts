#!/bin/bash

LINUXDEPLOY_TOOL=$PWD/linuxdeploy


#Sources
KIRIGAMI_SRCS=git://anongit.kde.org/kirigami
MAUIKIT_SRCS=git://anongit.kde.org/mauikit
DESKTOP_STYLE=git://anongit.kde.org/qqc2-desktop-style
INDEX_SRCS=git://anongit.kde.org/index-fm
VVAVE_SRCS=git://anongit.kde.org/vvave
PIX_SRCS=git://anongit.kde.org/maui-pix
DIALER_SRCS=git://anongit.kde.org/maui-dialer
BUHO_SRCS=git://anongit.kde.org/buho
NOTA_SRCS=git://anongit.kde.org/nota
STATION_SRCS=git://anongit.kde.org/maui-station
LIBRARY_SRCS=git://anongit.kde.org/maui-library


wget -Nc https://github.com/probonopd/linuxdeployqt/releases/download/6/linuxdeployqt-6-x86_64.AppImage -O $LINUXDEPLOY_TOOL

chmod +x linuxdeploy*

sudo apt-get install ecm qtbase5-dev build-essential git gcc g++ qtdeclarative5-dev qml-module-qtquick-controls libqt5svg5-dev qtmultimedia5-dev automake cmake qtquickcontrols2-5-dev libkf5config-dev libkf5service-dev libkf5notifications-dev libkf5kiocore5 libkf5kio-dev qml-module-qtwebengine gettext extra-cmake-modules libkf5wallet-dev qtbase5-private-dev qtwebengine5-dev libkf5wallet-dev qt5-default qt5-default libqt5websockets5-dev libtag1-dev libkf5people-dev libkf5contacts-dev

[ ! -d "kirigami" ] && git clone $KIRIGAMI_SRCS && [ -d "kirigami" ] && git pull origin master
pushd ./kirigami && [ ! -d "build" ] && mkdir build
cd ./build
cmake .. -DCMAKE_INSTALL_PREFIX=/usr
sudo make install

popd
[ ! -d "mauikit" ] && git clone $MAUIKIT_SRCS && [ -d "mauikit" ] && git pull origin master
pushd ./mauikit && [ ! -d "build" ] && mkdir build
cd ./build
cmake .. -DCMAKE_INSTALL_PREFIX=/usr
sudo make install

popd
[ ! -d "index-fm" ] && git clone https://invent.kde.org/kde/index-fm && [ -d "index-fm" ] && git pull origin master
pushd ./index-fm && [ ! -d "build" ] && mkdir build
cd ./build
cmake .. -DCMAKE_INSTALL_PREFIX=./AppDir
make install
cp ../src/index.png ./system-file-manager.png
find $HOME/build-*-*_Qt_* \( -name "moc_*" -or -name "*.o" -or -name "qrc_*" -or -name "Makefile*" -or -name "*.a" \) -exec rm {} \;
# $1 ./AppDir/share/applications/org.kde.index.desktop -appimage -unsupported-allow-new-glibc -qmldir=/usr/lib/x86_64-linux-gnu/qt5/qml/QtQuick -qmldir=/usr/lib/x86_64-linux-gnu/qt5/qml/org/kde/kirigami.2 -qmldir=/usr/lib/x86_64-linux-gnu/qt5/qml/org/kde/mauikit -qmldir=/usr/lib/x86_64-linux-gnu/qt5/qml/QtQuick/Controls.2/org.kde.desktop -qmldir=/usr/lib/x86_64-linux-gnu/qt5/qml/QMLTermWidget 

$1 ./AppDir/share/applications/org.kde.index.desktop -appimage -unsupported-allow-new-glibc -extra-plugins=iconengines -qmake=/usr/lib/x86_64-linux-gnu/qt5/bin/qmake -qmldir=/usr/lib/x86_64-linux-gnu/qt5/qml/QtQuick/Controls -qmldir=/usr/lib/x86_64-linux-gnu/qt5/qml/QtQuick/Templates.2 -qmldir=/usr/lib/x86_64-linux-gnu/qt5/qml/QtQuick/Controls.2 -qmldir=/usr/lib/x86_64-linux-gnu/qt5/qml/QtQuick/Layouts -qmldir=/usr/lib/x86_64-linux-gnu/qt5/qml/org/kde/kirigami.2 -qmldir=/usr/lib/x86_64-linux-gnu/qt5/qml/org/kde/mauikit -qmldir=/usr/lib/x86_64-linux-gnu/qt5/qml/QtQuick/Controls.2/org.kde.desktop -qmldir=/usr/lib/x86_64-linux-gnu/qt5/qml/QMLTermWidget
