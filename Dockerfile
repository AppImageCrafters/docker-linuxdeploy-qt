FROM centos:7
RUN yum install -y centos-release-scl-rh
RUN yum install -y devtoolset-7 wget git freetype fontconfig libX11-devel mesa-libGL-devel libxkbcommon-x11 \
                    libXrender-devel file desktop-file-utils zlib-devel libjpeg-devel

COPY --from=appimagecrafters/docker-linuxdeploy /entrypoint.sh /entrypoint.sh
COPY --from=appimagecrafters/docker-linuxdeploy /usr/local /usr/local
COPY --from=appimagecrafters/docker-qt /usr/local /usr/local

ENTRYPOINT ["/entrypoint.sh"]
CMD ["bash"]