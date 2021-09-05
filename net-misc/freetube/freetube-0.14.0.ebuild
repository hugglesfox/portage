# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop xdg

DESCRIPTION="An Open Source YouTube app for privacy"
HOMEPAGE="https://freetubeapp.io"
SRC_URI="https://github.com/FreeTubeApp/FreeTube/releases/download/v${PV}-beta/${P}-linux-portable-x64.zip"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
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

src_unpack() {
	# HACK
	mkdir ${P}
	cd ${P}
	default_src_unpack
}

src_install() {
	insinto /opt/${PN}
	doins -r *
	fperms +x /opt/${PN}/freetube /opt/${PN}/chrome-sandbox
	dosym ../../opt/${PN}/freetube usr/bin/freetube
	domenu "${FILESDIR}/FreeTube.desktop"
	doicon -s 256 "${FILESDIR}/FreeTube.svg"
}

pkg_postinst() {
	xdg_pkg_postinst
}
