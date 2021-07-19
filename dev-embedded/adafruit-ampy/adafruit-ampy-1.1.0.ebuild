# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8,9,10} )
inherit distutils-r1

DESCRIPTION="Utility to interact with a MicroPython board over a serial connection."
HOMEPAGE="https://github.com/scientifichackers/ampy"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-python/click
	dev-python/pyserial
	dev-python/python-dotenv"

RDEPEND="${DEPEND}"
BDEPEND=""

distutils_enable_tests unittest

python_prepare_all() {
	# Required for test discovery
	use test && touch tests/__init__.py

	distutils-r1_python_prepare_all
}
