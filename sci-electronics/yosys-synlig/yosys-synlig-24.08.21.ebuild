# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

MYCMAKEARGS=

GIT_RELEASE_ID="2024-08-21-7f99048"

DESCRIPTION="yosys surelog plugin"
HOMEPAGE="https://github.com/chipsalliance/synlig.git"
SRC_URI="https://github.com/chipsalliance/synlig/archive/refs/tags/${GIT_RELEASE_ID}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

DEPEND="=sci-electronics/surelog-24.08.13
	>=sci-electronics/yosys-0.44
	dev-libs/capnproto
	dev-cpp/gtest"
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=(
	"${FILESDIR}"/${P}-FixInstall.patch
)

src_unpack() {
	unpack ${P}.tar.gz
	mv synlig-${GIT_RELEASE_ID} ${P}
}

src_configure() {
	local mycmakeargs=(
		"-DSYNLIG_USE_HOST_ALL=ON"
		"-DSYNLIG_USE_HOST_YOSYS=OFF"
		"-DYOSYS_INCLUDE_DIR=/usr/share/yosys/include"
		"-DYOSYS_CONFIG=yosys-config"
	)
	cmake_src_configure
}

src_install() {
	sh ${S}/install_plugin.sh "${D}"
}
