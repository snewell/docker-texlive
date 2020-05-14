FROM snewell/ubuntu-native

RUN apt-get update \
 && apt-get install --no-install-recommends -y \
        gcc-10 \
        g++-10 \
 && rm -rf /var/lib/apt/lists/* \
 # Create symlinks so the environmet will work as expected
 && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-10 10 \
 && update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-10 10 \
 && update-alternatives --install /usr/bin/cc cc /usr/bin/gcc 10 \
 && update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++ 10
