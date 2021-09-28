# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DISTUTILS_OPTIONAL=1
PYTHON_COMPAT=( python{3_8,3_9,3_10} )

inherit cmake distutils-r1

DESCRIPTION="Unicorn CPU emulator framework (ARM, AArch64, M68K, Mips, Sparc, X86)"
HOMEPAGE="http://www.unicorn-engine.org/"
SRC_URI="https://github.com/unicorn-engine/${PN}/archive/${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

IUSE="python"
RDEPEND="python? ( ${PYTHON_DEPS} )"
DEPEND="${RDEPEND}
	python? ( dev-python/setuptools[${PYTHON_USEDEP}] )
"
REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} )"

wrap_python() {
	local phase=$1
	shift

	if use python; then
		pushd bindings/python >/dev/null || die
		echo distutils-r1_${phase} "$@"
		pwd
		distutils-r1_${phase} "$@"
		popd >/dev/null
	fi
}

src_prepare() {
	cmake_src_prepare

	wrap_python ${FUNCNAME}
}

src_configure() {
	local mycmakeargs=(
		# -DCMAKE_INSTALL_PREFIX=${D}
	)
	cmake_src_configure

	wrap_python ${FUNCNAME}
}

src_compile() {
	cmake_src_compile

	wrap_python ${FUNCNAME}
}

src_install() {
	cmake_src_install

	wrap_python ${FUNCNAME}
}
