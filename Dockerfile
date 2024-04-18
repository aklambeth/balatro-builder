FROM alpine
ENV PATH="${PATH}:/usr/local/share/bin/tools:/usr/local/share/src"
ENV ENV=/etc/profile
ENV apktool='java -jar -Xmx1G -Duser.language=en -Dfile.encoding=UTF8 -Djdk.util.zip.disableZip64ExtraFieldValidation=true -Djdk.nio.zipfs.allowDotZipEntry=true /usr/local/share/bin/tools/apktool.jar'
RUN  apk update \
  && apk upgrade \
  && apk add --update openjdk11 tzdata curl p7zip \
  && rm -rf /var/cache/apk/* \
  && apk add --no-cache python3 py3-pip \
  && ln -sf python3 /usr/bin/python
RUN mkdir -p "/usr/local/share/src" \ 
  && mkdir -p "/usr/local/share/assets" \
  && mkdir -p "/mnt/gamefiles" \
  && ln -s "/mnt/gamefiles" "/usr/local/share/assets/gamefiles" \
  && mkdir -p "/usr/local/share/assets/gamefiles/balatro"
COPY apk/*.apk /usr/local/share/assets/
COPY tools/*.jar usr/local/share/bin/tools/ 
COPY Balatro-APK-Patch/ /usr/local/share/assets/balatro-apk-patch/
RUN cd /usr/local/share/assets/balatro-apk-patch/ \
    && 7z x -y Balatro-APK-Patch.zip \
    && rm Balatro-APK-Patch.zip
RUN cd /usr/local/share/assets/ \ 
    && $apktool d -s -o love-android-embed-apk love-11.5-android-embed.apk \
    && rm /usr/local/share/assets/love-11.5-android-embed.apk 
COPY src/alias.sh /etc/profile.d/alias.sh
COPY src/unpack.sh /usr/local/share/src/unpack.sh