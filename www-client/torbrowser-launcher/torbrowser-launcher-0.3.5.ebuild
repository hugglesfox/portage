# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )
DISTUTILS_USE_SETUPTOOLS=no

inherit distutils-r1 xdg

DESCRIPTION="Securely and easily download, verify, install, and launch Tor Browser in Linux"
HOMEPAGE="https://github.com/micahflee/torbrowser-launcher"
SRC_URI="https://github.com/micahflee/torbrowser-launcher/archive/refs/tags/v${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	app-crypt/gpgme[python]
	dev-python/PyQt5
	dev-python/PySocks
	dev-python/packaging
	dev-python/requests
"
RDEPEND="${DEPEND}"
BDEPEND="dev-python/distro"
