# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8..9} )

inherit python-single-r1 systemd

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/YoyPa/isw.git"
else
	SRC_URI="https://github.com/YoyPa/isw/archive/${PV}.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="Ice-Sealed Wyvern"
HOMEPAGE="https://github.com/YoyPa/isw"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

DOCS="README.md"

src_prepare() {
	default
}

src_install() {
	python_doscript isw
	systemd_dounit usr/lib/systemd/system/isw@.service

	insinto /etc
	doins etc/isw.conf

	insinto /etc/modprobe.d
	doins etc/modprobe.d/isw-ec_sys.conf

	insinto /etc/modules-load.d
	doins etc/modules-load.d/isw-ec_sys.conf
}
