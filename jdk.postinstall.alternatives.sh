#!/bin/sh

ver=1.7.0_40
jdkver=jdk${ver}
basever=`echo ${ver} | sed 's/_[0-9]*$//'`
filever=`echo ${ver} | sed 's/_/./'`
altver=`echo ${ver} | sed 's/\.//g' | sed 's/_/0/'`

ext=.gz
for file in `find /usr/java/${jdkver}/man -name "*.1"`; do
  gzip $file
done

exportsdir=/usr/java/exports/${jdkver}
mkdir -p ${exportsdir}

ln -s ../../${jdkver}/lib/rt.jar ${exportsdir}/jaas-${filever}.jar
ln -s jaas-${filever}.jar ${exportsdir}/jaas-${basever}.jar
ln -s jaas-${filever}.jar ${exportsdir}/jaas.jar

ln -s ../../${jdkver}/lib/jce.jar ${exportsdir}/jce-${filever}.jar
ln -s jce-${filever}.jar ${exportsdir}/jce-${basever}.jar
ln -s jce-${filever}.jar ${exportsdir}/jce.jar

ln -s ../../${jdkver}/lib/rt.jar ${exportsdir}/jdbc-stdext-${filever}.jar
ln -s jdbc-stdext-${filever}.jar ${exportsdir}/jdbc-stdext-${basever}.jar
ln -s jdbc-stdext-${filever}.jar ${exportsdir}/jdbc-stdext-3.0.jar
ln -s jdbc-stdext-${filever}.jar ${exportsdir}/jdbc-stdext.jar

ln -s ../../${jdkver}/lib/rt.jar ${exportsdir}/jndi-${filever}.jar
ln -s jndi-${filever}.jar ${exportsdir}/jndi-${basever}.jar
ln -s jndi-${filever}.jar ${exportsdir}/jndi.jar

ln -s ../../${jdkver}/lib/rt.jar ${exportsdir}/jndi-cos-${filever}.jar
ln -s jndi-cos-${filever}.jar ${exportsdir}/jndi-cos-${basever}.jar
ln -s jndi-cos-${filever}.jar ${exportsdir}/jndi-cos.jar

ln -s ../../${jdkver}/lib/rt.jar ${exportsdir}/jndi-ldap-${filever}.jar
ln -s jndi-ldap-${filever}.jar ${exportsdir}/jndi-ldap-${basever}.jar
ln -s jndi-ldap-${filever}.jar ${exportsdir}/jndi-ldap.jar

ln -s ../../${jdkver}/lib/rt.jar ${exportsdir}/jndi-rmi-${filever}.jar
ln -s jndi-rmi-${filever}.jar ${exportsdir}/jndi-rmi-${basever}.jar
ln -s jndi-rmi-${filever}.jar ${exportsdir}/jndi-rmi.jar

ln -s ../../${jdkver}/lib/jsse.jar ${exportsdir}/jsse-${filever}.jar
ln -s jsse-${filever}.jar ${exportsdir}/jsse-${basever}.jar
ln -s jsse-${filever}.jar ${exportsdir}/jsse.jar

ln -s ../../${jdkver}/lib/rt.jar ${exportsdir}/sasl-${filever}.jar
ln -s sasl-${filever}.jar ${exportsdir}/sasl-${basever}.jar
ln -s sasl-${filever}.jar ${exportsdir}/sasl.jar

alternatives \
  --install /usr/bin/javac javac /usr/java/${jdkver}/bin/javac ${altver} \
  --slave /usr/lib/jvm/java java_sdk /usr/java/${jdkver} \
  --slave /usr/lib/jvm-exports/java java_sdk_exports ${exportsdir} \
  --slave /usr/bin/appletviewer appletviewer /usr/java/${jdkver}/bin/appletviewer \
  --slave /usr/bin/apt apt /usr/java/${jdkver}/bin/apt \
  --slave /usr/bin/extcheck extcheck /usr/java/${jdkver}/bin/extcheck \
  --slave /usr/bin/idlj idlj /usr/java/${jdkver}/bin/idlj \
  --slave /usr/bin/jar jar /usr/java/${jdkver}/bin/jar \
  --slave /usr/bin/jarsigner jarsigner /usr/java/${jdkver}/bin/jarsigner \
  --slave /usr/bin/javadoc javadoc /usr/java/${jdkver}/bin/javadoc \
  --slave /usr/bin/javah javah /usr/java/${jdkver}/bin/javah \
  --slave /usr/bin/javap javap /usr/java/${jdkver}/bin/javap \
  --slave /usr/bin/jcmd jcmd /usr/java/${jdkver}/bin/jcmd \
  --slave /usr/bin/jconsole jconsole /usr/java/${jdkver}/bin/jconsole \
  --slave /usr/bin/jdb jdb /usr/java/${jdkver}/bin/jdb \
  --slave /usr/bin/jhat jhat /usr/java/${jdkver}/bin/jhat \
  --slave /usr/bin/jinfo jinfo /usr/java/${jdkver}/bin/jinfo \
  --slave /usr/bin/jmap jmap /usr/java/${jdkver}/bin/jmap \
  --slave /usr/bin/jps jps /usr/java/${jdkver}/bin/jps \
  --slave /usr/bin/jrunscript jrunscript /usr/java/${jdkver}/bin/jrunscript \
  --slave /usr/bin/jsadebugd jsadebugd /usr/java/${jdkver}/bin/jsadebugd \
  --slave /usr/bin/jstack jstack /usr/java/${jdkver}/bin/jstack \
  --slave /usr/bin/jstat jstat /usr/java/${jdkver}/bin/jstat \
  --slave /usr/bin/jstatd jstatd /usr/java/${jdkver}/bin/jstatd \
  --slave /usr/bin/native2ascii native2ascii /usr/java/${jdkver}/bin/native2ascii \
  --slave /usr/bin/policytool policytool /usr/java/${jdkver}/bin/policytool \
  --slave /usr/bin/rmic rmic /usr/java/${jdkver}/bin/rmic \
  --slave /usr/bin/schemagen schemagen /usr/java/${jdkver}/bin/schemagen \
  --slave /usr/bin/serialver serialver /usr/java/${jdkver}/bin/serialver \
  --slave /usr/bin/wsgen wsgen /usr/java/${jdkver}/bin/wsgen \
  --slave /usr/bin/wsimport wsimport /usr/java/${jdkver}/bin/wsimport \
  --slave /usr/bin/xjc xjc /usr/java/${jdkver}/bin/xjc \
  --slave /usr/share/man/man1/appletviewer.1${ext} appletviewer.1${ext} \
  /usr/share/man/man1/appletviewer.1${ext} \
  --slave /usr/share/man/man1/apt.1${ext} apt.1${ext} \
  /usr/share/man/man1/apt.1${ext} \
  --slave /usr/share/man/man1/extcheck.1${ext} extcheck.1${ext} \
  /usr/share/man/man1/extcheck.1${ext} \
  --slave /usr/share/man/man1/jar.1${ext} jar.1${ext} \
  /usr/share/man/man1/jar.1${ext} \
  --slave /usr/share/man/man1/jarsigner.1${ext} jarsigner.1${ext} \
  /usr/share/man/man1/jarsigner.1${ext} \
  --slave /usr/share/man/man1/javac.1${ext} javac.1${ext} \
  /usr/share/man/man1/javac.1${ext} \
  --slave /usr/share/man/man1/javadoc.1${ext} javadoc.1${ext} \
  /usr/share/man/man1/javadoc.1${ext} \
  --slave /usr/share/man/man1/javah.1${ext} javah.1${ext} \
  /usr/share/man/man1/javah.1${ext} \
  --slave /usr/share/man/man1/javap.1${ext} javap.1${ext} \
  /usr/share/man/man1/javap.1${ext} \
  --slave /usr/share/man/man1/jconsole.1${ext} jconsole.1${ext} \
  /usr/share/man/man1/jconsole.1${ext} \
  --slave /usr/share/man/man1/jdb.1${ext} jdb.1${ext} \
  /usr/share/man/man1/jdb.1${ext} \
  --slave /usr/share/man/man1/jhat.1${ext} jhat.1${ext} \
  /usr/share/man/man1/jhat.1${ext} \
  --slave /usr/share/man/man1/jinfo.1${ext} jinfo.1${ext} \
  /usr/share/man/man1/jinfo.1${ext} \
  --slave /usr/share/man/man1/jmap.1${ext} jmap.1${ext} \
  /usr/share/man/man1/jmap.1${ext} \
  --slave /usr/share/man/man1/jps.1${ext} jps.1${ext} \
  /usr/share/man/man1/jps.1${ext} \
  --slave /usr/share/man/man1/jrunscript.1${ext} jrunscript.1${ext} \
  /usr/share/man/man1/jrunscript.1${ext} \
  --slave /usr/share/man/man1/jsadebugd.1${ext} jsadebugd.1${ext} \
  /usr/share/man/man1/jsadebugd.1${ext} \
  --slave /usr/share/man/man1/jstack.1${ext} jstack.1${ext} \
  /usr/share/man/man1/jstack.1${ext} \
  --slave /usr/share/man/man1/jstat.1${ext} jstat.1${ext} \
  /usr/share/man/man1/jstat.1${ext} \
  --slave /usr/share/man/man1/jstatd.1${ext} jstatd.1${ext} \
  /usr/share/man/man1/jstatd.1${ext} \
  --slave /usr/share/man/man1/native2ascii.1${ext} native2ascii.1${ext} \
  /usr/share/man/man1/native2ascii.1${ext} \
  --slave /usr/share/man/man1/policytool.1${ext} policytool.1${ext} \
  /usr/share/man/man1/policytool.1${ext} \
  --slave /usr/share/man/man1/rmic.1${ext} rmic.1${ext} \
  /usr/share/man/man1/rmic.1${ext} \
  --slave /usr/share/man/man1/schemagen.1${ext} schemagen.1${ext} \
  /usr/share/man/man1/schemagen.1${ext} \
  --slave /usr/share/man/man1/serialver.1${ext} serialver.1${ext} \
  /usr/share/man/man1/serialver.1${ext} \
  --slave /usr/share/man/man1/wsgen.1${ext} wsgen.1${ext} \
  /usr/share/man/man1/wsgen.1${ext} \
  --slave /usr/share/man/man1/wsimport.1${ext} wsimport.1${ext} \
  /usr/share/man/man1/wsimport.1${ext} \
  --slave /usr/share/man/man1/xjc.1${ext} xjc.1${ext} \
  /usr/share/man/man1/xjc.1${ext}

alternatives \
  --install /usr/lib/jvm/java-oracle \
  java_sdk_oracle /usr/java/${jdkver} ${altver} \
  --slave /usr/lib/jvm-exports/java-oracle \
  java_sdk_oracle_exports ${exportsdir}

alternatives \
  --install /usr/lib/jvm/java-${basever} \
  java_sdk_${basever} /usr/java/${jdkver} ${altver} \
  --slave /usr/lib/jvm-exports/java-${basever} \
  java_sdk_${basever}_exports ${exportsdir}

exit 0
