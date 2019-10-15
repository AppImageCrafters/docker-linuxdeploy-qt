# docker-linuxdeploy-qt
Docker Image for producing AppImages requiring Qt. It's based on __Centos 7__
because of the latest Qt versions requiring `glib` >= 2.16 and `libssll` >= 1.1.

# Software included
- glib 2.6
- libssl 1.1
- cmake  3.15
- qt 5.13.1
- linuxdeploy + qt plugin

# Example
A whole example Qt Qml project can be consulted [here](https://www.opencode.net/azubieta/qt-appimage-template/). The 
following is an extract of its `gitlab-ci.yml` file:

```yaml
build:AppImage:
  image: appimagecrafters/docker-linuxdeploy-qt
  stage: build
  script:
    - cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr .
    - DESTDIR=AppDir make install
    - export QML_SOURCES_PATHS=$PWD
    - linuxdeploy --appdir=AppDir --desktop-file=AppDir/usr/share/applications/QtQuickControls2Application.desktop --plugin qt --output appimage
```

