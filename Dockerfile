ARG IMAGE
ARG MAJOR_VERSION
ARG MINOR_VERSION

FROM $IMAGE

ENV MAJOR_VERSION $MAJOR_VERSION
ENV MINOR_VERSION $MINOR_VERSION

USER root

RUN  apt update

RUN  apt install -y apt-utils

RUN  apt install -y wget

RUN apt install -y libxi6 libgconf-2-4

RUN apt install -y libfontconfig1 libxrender1

USER ue4

WORKDIR /home/ue4/

RUN echo "https://download.blender.org/release/Blender${MAJOR_VERSION}/blender-${MAJOR_VERSION}.${MINOR_VERSION}-linux64.tar.xz"

RUN  wget -c "https://download.blender.org/release/Blender${MAJOR_VERSION}/blender-${MAJOR_VERSION}.${MINOR_VERSION}-linux64.tar.xz" -O "blender-${MAJOR_VERSION}.${MINOR_VERSION}-linux64.tar.xz"

RUN tar -xvf "blender-${MAJOR_VERSION}.${MINOR_VERSION}-linux64.tar.xz"

RUN rm "blender-${MAJOR_VERSION}.${MINOR_VERSION}-linux64.tar.xz"

RUN mv "./blender-${MAJOR_VERSION}.${MINOR_VERSION}-linux64" "./blender"