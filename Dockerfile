ARG OPENJDK=8-jdk
FROM openjdk:${OPENJDK}

ENV ANDROID_COMPILE_SDK=29
ENV ANDROID_BUILD_TOOLS=29.0.3
ENV ANDROID_SDK_TOOLS=6514223
ENV ANDROID_HOME=/opt/android-home
ENV PATH=${PATH}:${ANDROID_HOME}/cmdline-tools/tools/bin/

RUN apt -y update \
	&& apt-get install -y wget tar unzip lib32stdc++6 lib32z1 \
	&& rm -rf /var/lib/apt/lists/* \
	&& mkdir ${ANDROID_HOME}

RUN wget -O ${ANDROID_HOME}/cmdline-tools.zip https://dl.google.com/android/repository/commandlinetools-linux-${ANDROID_SDK_TOOLS}_latest.zip \
	&& unzip -d ${ANDROID_HOME}/cmdline-tools ${ANDROID_HOME}/cmdline-tools.zip
RUN yes | sdkmanager --sdk_root=${ANDROID_HOME} --licenses || true
RUN sdkmanager --sdk_root=${ANDROID_HOME} "platforms;android-${ANDROID_COMPILE_SDK}" \
    "platform-tools" \
    "build-tools;${ANDROID_BUILD_TOOLS}"

