#!/bin/sh
export PATH=$PATH:/usr/local/share/bin/tools:/usr/local/share/src
alias apktool="java -jar -Xmx1G -Duser.language=en -Dfile.encoding=UTF8 -Djdk.util.zip.disableZip64ExtraFieldValidation=true -Djdk.nio.zipfs.allowDotZipEntry=true /usr/local/bin/tools/apktool.jar"
alias apk-signer="java -jar -Xmx1G -Duser.language=en -Dfile.encoding=UTF8 -Djdk.util.zip.disableZip64ExtraFieldValidation=true -Djdk.nio.zipfs.allowDotZipEntry=true /usr/local/bin/tools/uber-apk-signer.jar"