# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop unpacker xdg

DESCRIPTION="An Open Source YouTube app for privacy"
HOMEPAGE="https://freetubeapp.io"
SRC_URI="https://github.com/FreeTubeApp/FreeTube/releases/download/v${PV}-beta/${PN}_${PV}_amd64.deb"
S=${WORKDIR}

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	app-accessibility/at-spi2-atk:2
	app-accessibility/at-spi2-core:2
	dev-libs/atk
	dev-libs/expat
	dev-libs/glib:2
	dev-libs/nspr
	dev-libs/nss
	media-libs/alsa-lib
	media-libs/mesa
	net-print/cups
	sys-apps/dbus
	x11-libs/cairo
	x11-libs/gdk-pixbuf:2
	x11-libs/gtk+:3
	x11-libs/libX11
	x11-libs/libXcomposite
	x11-libs/libXdamage
	x11-libs/libXext
	x11-libs/libXfixes
	x11-libs/libXrandr
	x11-libs/libdrm
	x11-libs/libxcb
	x11-libs/libxkbcommon
	x11-libs/libxshmfence
	x11-libs/pango"
BDEPEND="app-arch/unzip"

QA_PREBUILT="
	/opt/${PN}/freetube
	/opt/${PN}/libEGL.so
	/opt/${PN}/libffmpeg.so
	/opt/${PN}/libGLESv2.so
	/opt/${PN}/libvulkan.so*
	/opt/${PN}/chrome-sandbox
	/opt/${PN}/libvk_swiftshader.so
	/opt/${PN}/swiftshader/libEGL.so
	/opt/${PN}/swiftshader/libGLESv2.so
"

src_install() {
	insinto /opt/${PN}
	doins -r opt/FreeTube/.
	fperms +x /opt/${PN}/freetube /opt/${PN}/chrome-sandbox
	dosym -r /opt/${PN}/freetube /usr/bin/freetube
	domenu "${FILESDIR}/FreeTube.desktop"
	doicon -s 256 "${FILESDIR}/FreeTube.svg"
}

pkg_postinst() {
	xdg_pkg_postinst
}
