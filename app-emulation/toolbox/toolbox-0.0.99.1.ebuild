# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="Unprivileged development environment"
HOMEPAGE="https://github.com/containers/toolbox"
SRC_URI="https://github.com/containers/${PN}/archive/${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test systemd"
RESTRICT="network-sandbox"

DEPEND="
	app-emulation/podman
	sys-apps/flatpak
	systemd? ( sys-apps/systemd )
"
RDEPEND="${DEPEND}"
BDEPEND="
	dev-go/go-md2man
	dev-lang/go
	dev-util/meson
	virtual/pkgconfig
"

src_configure() {
	default
	meson_src_configure -Dprofile_dir=/etc/profile.d
}
