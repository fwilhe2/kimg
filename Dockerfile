FROM sapmachine:14

RUN apt-get -y update \
 && apt-get -y dist-upgrade \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
 && mkdir -p /home/user && echo "user:x:1000:1000:user:/home/user:/bin/bash" >> /etc/passwd \
 && chown -R user /home/user \
 && echo "PATH=/opt/kotlinc/bin:$PATH" >> /home/user/.bashrc

COPY kotlinc /opt/kotlinc
COPY sample /sample

ENV PATH=/opt/kotlinc/bin:$PATH
