FROM ros:eloquent-ros-core-bionic
MAINTAINER Matthew Powelson

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update

# install bootstrap tools
RUN apt-get install --no-install-recommends -y unzip wget

ENV QT_VERSION_A=5.13
ENV QT_VERSION_B=5.13.2
ENV QT_VERSION_SCRIPT=5132
RUN wget https://download.qt.io/archive/qt/${QT_VERSION_A}/${QT_VERSION_B}/qt-opensource-linux-x64-${QT_VERSION_B}.run
RUN chmod +x qt-opensource-linux-x64-${QT_VERSION_B}.run
COPY qt-noninteractive.qs /qt-noninteractive.qs

RUN apt-get install libgtk-3-dev -y
RUN ./qt-opensource-linux-x64-${QT_VERSION_B}.run --script qt-noninteractive.qs  -platform minimal

RUN rm /qt-opensource-linux-x64-${QT_VERSION_B}.run
RUN rm /qt-noninteractive.qs

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV PATH="/qt/${QT_VERSION_B}/gcc_64/lib/cmake:$PATH"
ENV LD_LIBRARY_PATH=/qt/${QT_VERSION_B}/gcc_64/lib:/usr/local/cuda/lib64/stubs:$LD_LIBRARY_PATH

ENTRYPOINT ["/ros_entrypoint.sh"]
CMD ["bash"]

