# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

GIT_COMMIT_ID="b918b5d5c82cfbaf71e04f87ab69fc7e182e41aa"

PYTHON_COMPAT=( python3_{10,11} )
CMAKE_REMOVE_MODULES_LIST=(third_party)
MYCMAKEARGS="-DUHDM_USE_HOST_CAPNP=ON -DUHDM_USE_HOST_GTEST=ON"

inherit python-r1
inherit cmake

DESCRIPTION="Universal Hardware Data Model"
HOMEPAGE="https://github.com/chipsalliance/UHDM.git"
SRC_URI="https://github.com/chipsalliance/UHDM/archive/${GIT_COMMIT_ID}.tar.gz -> $P.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-python/orderedmultidict[${PYTHON_USEDEP}]
	dev-libs/capnproto
	dev-cpp/gtest"
RDEPEND="${DEPEND} ${PYTHON_DEPS}"
BDEPEND=""

REQUIRED_USE="( ${PYTHON_REQUIRED_USE} )"

PATCHES=(
	"${FILESDIR}"/${P}-CMakeLists.patch
)

S="${WORKDIR}/UHDM-${GIT_COMMIT_ID}"
