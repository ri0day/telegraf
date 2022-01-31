#!/bin/sh
set -eux


## build-deb --arch --dest --src --version
## build-deb --arch amd64 --version 1.22.0~253fbe3d-1 --dest build/linux-amd64-deb/telegraf-1.22.0 --src build/dist

# $(basename $@)
# amd64

# THIS IS WHERE THE BINARY IS
# @echo $(DESTDIR)
  # build/linux-amd64-deb/telegraf-1.22.0

# THIS IS WHERE TO PUT STUFF TOO
# @echo $(pkgdir)
  # build/dist

# THIS IS THE VERSION TO USE
# @echo $(deb_version)
  # 1.22.0~253fbe3d-1

rm -f debian/changelog
cat << EOF > debian/changelog
telegraf ($VERSION) stable; urgency=low

  * Local build of Telegraf.

 -- Builder <tbd@test.com>  Thu, 30 Jul 2020 11:50:58 -0400
EOF

dpkg-buildpackage -us -uc -b --target-arch $ARCH

rm -f debian/changelog
