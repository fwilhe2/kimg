FROM sapmachine:14

COPY kotlinc /opt/kotlinc
COPY kotlin-native-linux-1.4 /opt/kotlin-native
COPY sample /sample

ENV PATH=/opt/kotlinc/bin:/opt/kotlin-native/bin:$PATH
