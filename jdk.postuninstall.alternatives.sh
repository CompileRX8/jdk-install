#!/bin/sh

ver=1.7.0_40
jdkver=jdk${ver}
basever=`echo ${ver} | sed 's/_[0-9]*$//'`

if [ $1 -eq 0 ]
then
  alternatives --remove javac /usr/java/${jdkver}/bin/javac
  alternatives --remove java_sdk_oracle /usr/java/${jdkver}
  alternatives --remove java_sdk_${basever} /usr/java/${jdkver}
  rm -fr /usr/java/exports/${jdkver}
fi

exit 0
