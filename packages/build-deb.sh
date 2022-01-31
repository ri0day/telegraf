#!/bin/sh
set -eux

# @echo $(basename $@)
  # amd64
# @echo $(DESTDIR)
  # build/linux-amd64-deb/telegraf-1.22.0
# @echo $(pkgdir)
  # build/dist
# @echo $(deb_version)
  # 1.22.0~253fbe3d-1

rm -f debian/changelog
cat << EOF > debian/changelog
telegraf (1.0) stable; urgency=medium

  * Initial release.

 -- Builder <tbd@test.com>  Thu, 30 Jul 2020 11:50:58 -0400
EOF

dpkg-buildpackage -us -uc -b

rm -f debian/changelog
