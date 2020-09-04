FROM sapmachine:14

COPY kotlinc /opt/kotlinc

ENV PATH=/opt/kotlinc/bin:$PATH

