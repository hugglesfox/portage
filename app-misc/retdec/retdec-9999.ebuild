# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CMAKE_MAKEFILE_GENERATOR="emake"
inherit cmake

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/avast/${PN}.git"
else
	SRC_URI="https://github.com/avast/${PN}/archive/refs/tags/v${PV}.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="RetDec is a retargetable machine-code decompiler based on LLVM."
HOMEPAGE="https://retdec.com/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="network-sandbox"

IUSE="graphviz upx"

DEPEND="
	graphviz? ( dev-python/graphviz )
	upx? ( app-arch/upx )"
RDEPEND="${DEPEND}"
BDEPEND=""
