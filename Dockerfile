FROM sapmachine:14

RUN apt-get -y update \
 && apt-get -y dist-upgrade \
 && apt-get -y --no-install-recommends install libncurses-dev \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
 && mkdir -p /home/user && echo "user:x:1000:1000:user:/home/user:/bin/bash" >> /etc/passwd \
 && chown -R user /home/user \
 && echo "PATH=/opt/kotlinc/bin:/opt/kotlin-native/bin:$PATH" >> /home/user/.bashrc

COPY kotlinc /opt/kotlinc
COPY kotlin-native-linux-1.4 /opt/kotlin-native
COPY sample /sample

RUN /opt/kotlin-native/bin/kotlinc /sample/hello.kt

ENV PATH=/opt/kotlinc/bin:/opt/kotlin-native/bin:$PATH
