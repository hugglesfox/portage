# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6..9} )
DISTUTILS_USE_SETUPTOOLS=rdepend

inherit distutils-r1 udev

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/Askannz/msi-perkeyrgb.git"
else
	SRC_URI="https://github.com/Askannz/msi-perkeyrgb/archive/v${PV}.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="Linux CLI tool to control per-key RGB lighting on MSI laptops."
HOMEPAGE="https://github.com/Askannz/msi-perkeyrgb"

LICENSE="MIT"
SLOT="0"

DEPEND="dev-libs/hidapi
		sys-apps/usbutils"
RDEPEND="${DEPEND}"
BDEPEND=""

DOCS="README.md"
PATCHES=( "${FILESDIR}/msi-perkeyrgb-2.1-default-model.patch" )

python_install() {
	distutils-r1_python_install
	udev_dorules 99-msi-rgb.rules
}
