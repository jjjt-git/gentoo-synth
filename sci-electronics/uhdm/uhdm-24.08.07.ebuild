# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

GIT_COMMIT_ID="af8bb5e7b456811d64a7bc647d52410b66a953ca"

CMAKE_REMOVE_MODULES_LIST=(third_party)
MYCMAKEARGS="-DUHDM_USE_HOST_CAPNP=ON -DUHDM_USE_HOST_GTEST=ON"

inherit cmake

DESCRIPTION="Universal Hardware Data Model"
HOMEPAGE="https://github.com/chipsalliance/UHDM.git"
SRC_URI="https://github.com/chipsalliance/UHDM/archive/${GIT_COMMIT_ID}.tar.gz -> $P.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-libs/capnproto
	dev-cpp/gtest"
RDEPEND="${DEPEND}"
BDEPEND="dev-python/boltons
	>=dev-lang/python-3.10.0
"

PATCHES=(
	"${FILESDIR}"/${P}-CMakeLists.patch
	"${FILESDIR}"/${P}-scripts.patch
)

S="${WORKDIR}/UHDM-${GIT_COMMIT_ID}"
