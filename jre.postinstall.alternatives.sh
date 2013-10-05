#/bin/sh

ver=1.7.0_40
jrever=jre${ver}
basever=`echo ${ver} | sed 's/_[0-9]*$//'`
filever=`echo ${ver} | sed 's/_/./'`
altver=`echo ${ver} | sed 's/\.//g' | sed 's/_/0/'`


#see https://bugzilla.redhat.com/show_bug.cgi?id=513605
/usr/java/${jrever}/bin/java -Xshare:dump >/dev/null 2>/dev/null

ext=.gz
for file in `find /usr/java/${jrever}/man -name "*.1"`; do
  gzip $file
done

exportsdir=/usr/java/exports/${jrever}
mkdir -p ${exportsdir}

ln -s ../../${jrever}/lib/rt.jar ${exportsdir}/jaas-${filever}.jar
ln -s jaas-${filever}.jar ${exportsdir}/jaas-${basever}.jar
ln -s jaas-${filever}.jar ${exportsdir}/jaas.jar

ln -s ../../${jrever}/lib/jce.jar ${exportsdir}/jce-${filever}.jar
ln -s jce-${filever}.jar ${exportsdir}/jce-${basever}.jar
ln -s jce-${filever}.jar ${exportsdir}/jce.jar

ln -s ../../${jrever}/lib/rt.jar ${exportsdir}/jdbc-stdext-${filever}.jar
ln -s jdbc-stdext-${filever}.jar ${exportsdir}/jdbc-stdext-${basever}.jar
ln -s jdbc-stdext-${filever}.jar ${exportsdir}/jdbc-stdext-3.0.jar
ln -s jdbc-stdext-${filever}.jar ${exportsdir}/jdbc-stdext.jar

ln -s ../../${jrever}/lib/rt.jar ${exportsdir}/jndi-${filever}.jar
ln -s jndi-${filever}.jar ${exportsdir}/jndi-${basever}.jar
ln -s jndi-${filever}.jar ${exportsdir}/jndi.jar

ln -s ../../${jrever}/lib/rt.jar ${exportsdir}/jndi-cos-${filever}.jar
ln -s jndi-cos-${filever}.jar ${exportsdir}/jndi-cos-${basever}.jar
ln -s jndi-cos-${filever}.jar ${exportsdir}/jndi-cos.jar

ln -s ../../${jrever}/lib/rt.jar ${exportsdir}/jndi-ldap-${filever}.jar
ln -s jndi-ldap-${filever}.jar ${exportsdir}/jndi-ldap-${basever}.jar
ln -s jndi-ldap-${filever}.jar ${exportsdir}/jndi-ldap.jar

ln -s ../../${jrever}/lib/rt.jar ${exportsdir}/jndi-rmi-${filever}.jar
ln -s jndi-rmi-${filever}.jar ${exportsdir}/jndi-rmi-${basever}.jar
ln -s jndi-rmi-${filever}.jar ${exportsdir}/jndi-rmi.jar

ln -s ../../${jrever}/lib/jsse.jar ${exportsdir}/jsse-${filever}.jar
ln -s jsse-${filever}.jar ${exportsdir}/jsse-${basever}.jar
ln -s jsse-${filever}.jar ${exportsdir}/jsse.jar

ln -s ../../${jrever}/lib/rt.jar ${exportsdir}/sasl-${filever}.jar
ln -s sasl-${filever}.jar ${exportsdir}/sasl-${basever}.jar
ln -s sasl-${filever}.jar ${exportsdir}/sasl.jar

alternatives \
  --install /usr/bin/java java /usr/java/${jrever}/bin/java ${altver} \
  --slave /usr/lib/jvm/jre jre /usr/java/${jrever} \
  --slave /usr/lib/jvm-exports/jre jre_exports /usr/java/exports/${jrever} \
  --slave /usr/bin/keytool keytool /usr/java/${jrever}/bin/keytool \
  --slave /usr/bin/orbd orbd /usr/java/${jrever}/bin/orbd \
  --slave /usr/bin/pack200 pack200 /usr/java/${jrever}/bin/pack200 \
  --slave /usr/bin/rmid rmid /usr/java/${jrever}/bin/rmid \
  --slave /usr/bin/rmiregistry rmiregistry /usr/java/${jrever}/bin/rmiregistry \
  --slave /usr/bin/servertool servertool /usr/java/${jrever}/bin/servertool \
  --slave /usr/bin/tnameserv tnameserv /usr/java/${jrever}/bin/tnameserv \
  --slave /usr/bin/unpack200 unpack200 /usr/java/${jrever}/bin/unpack200 \
  --slave /usr/share/man/man1/java.1${ext} java.1${ext} \
  /usr/java/${jrever}/man/man1/java.1${ext} \
  --slave /usr/share/man/man1/keytool.1${ext} keytool.1${ext} \
  /usr/java/${jrever}/man/man1/keytool.1${ext} \
  --slave /usr/share/man/man1/orbd.1${ext} orbd.1${ext} \
  /usr/java/${jrever}/man/man1/orbd.1${ext} \
  --slave /usr/share/man/man1/pack200.1${ext} pack200.1${ext} \
  /usr/java/${jrever}/man/man1/pack200.1${ext} \
  --slave /usr/share/man/man1/rmid.1${ext} rmid.1${ext} \
  /usr/java/${jrever}/man/man1/rmid.1${ext} \
  --slave /usr/share/man/man1/rmiregistry.1${ext} rmiregistry.1${ext} \
  /usr/java/${jrever}/man/man1/rmiregistry.1${ext} \
  --slave /usr/share/man/man1/servertool.1${ext} servertool.1${ext} \
  /usr/java/${jrever}/man/man1/servertool.1${ext} \
  --slave /usr/share/man/man1/tnameserv.1${ext} tnameserv.1${ext} \
  /usr/java/${jrever}/man/man1/tnameserv.1${ext} \
  --slave /usr/share/man/man1/unpack200.1${ext} unpack200.1${ext} \
  /usr/java/${jrever}/man/man1/unpack200.1${ext}

alternatives \
  --install /usr/lib/jvm/jre-oracle \
  jre_oracle /usr/java/${jrever} ${altver} \
  --slave /usr/lib/jvm-exports/jre-oracle \
  jre_oracle_exports /usr/java/exports/${jrever}

alternatives \
  --install /usr/lib/jvm/jre-${basever} \
  jre_${basever} /usr/java/${jrever} ${altver} \
  --slave /usr/lib/jvm-exports/jre-${basever} \
  jre_${basever}_exports /usr/java/exports/${jrever}

update-desktop-database /usr/share/applications &> /dev/null || :

touch --no-create /usr/share/icons/hicolor
if [ -x /usr/bin/gtk-update-icon-cache ] ; then
  /usr/bin/gtk-update-icon-cache --quiet /usr/share/icons/hicolor
fi

exit 0
