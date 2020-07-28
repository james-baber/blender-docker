FROM adamrehn/ue4-full:4.25.1-opengl

ARG major_version

ARG minor_version

USER root

RUN  apt-get update

RUN  apt install -y wget

RUN apt-get install -y libxi6 libgconf-2-4

RUN apt-get install -y libfontconfig1 libxrender1

USER ue4

WORKDIR /home/ue4/

RUN  wget -c "https://download.blender.org/release/Blender${major_version}/blender-${major_version}.${minor_version}-linux64.tar.xz" -O "blender-${major_version}.${minor_version}-linux64.tar.xz"

RUN tar -xvf "blender-${major_version}.${minor_version}-linux64.tar.xz"

RUN rm "blender-${major_version}.${minor_version}-linux64.tar.xz"

RUN mv "./blender-${major_version}.${minor_version}-linux64" "./blender"