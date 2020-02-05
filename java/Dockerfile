FROM colinjfw/base:latest

ENV JAVA_VERSION 11
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk
ENV PATH "$PATH:$JAVA_HOME/bin"
ENV GRADLE_HOME /opt/gradle
ENV GRADLE_VERSION 5.4.1

RUN sudo apk add openjdk${JAVA_VERSION} --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community \
    && curl -sSL --output gradle.zip "https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip" \
    && sudo unzip gradle.zip \
    && sudo rm gradle.zip \
    && sudo mv "gradle-${GRADLE_VERSION}" "${GRADLE_HOME}/" \
    && sudo ln -s "${GRADLE_HOME}/bin/gradle" /usr/bin/gradle
