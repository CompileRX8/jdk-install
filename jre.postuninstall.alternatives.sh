#!/bin/sh
ver=1.7.0_40
jrever=jre${ver}
basever=`echo ${ver} | sed 's/_[0-9]*$//'`
exportsdir=/usr/java/exports/${jrever}


if [ $1 -eq 0 ]
then
  alternatives --remove java /usr/java/${jrever}/bin/java
  alternatives --remove jre_oracle /usr/java/${jrever}
  alternatives --remove jre_${basever} /usr/java/${jrever}
  rm -fr ${exportsdir}
fi

update-desktop-database /usr/share/applications &> /dev/null || :

touch --no-create /usr/share/icons/hicolor
if [ -x /usr/bin/gtk-update-icon-cache ] ; then
  /usr/bin/gtk-update-icon-cache --quiet /usr/share/icons/hicolor
fi

exit 0
