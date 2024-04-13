EAPI=8

PYTHON_COMPAT=( python3_{10,11} )
MYCMAKEARGS="-DSURELOG_USE_HOST_ALL=ON -DANTLR_LIBRARY=\"/usr/lib64/libantlr4-runtime.so\""

inherit python-r1
inherit cmake

DESCRIPTION="SV2017 parser"
HOMEPAGE="https://github.com/chipsalliance/Surelog.git"
SRC_URI="https://github.com/chipsalliance/Surelog/archive/refs/tags/v$PV.tar.gz -> $P.tar.gz"
LICENSE="Apache-2.0"
SLOT=0
KEYWORDS=~amd64

PATCHES=(
	"${FILESDIR}"/${P}-FindANTLR.patch
	"${FILESDIR}"/${P}-CMakeLists.patch
)

BDEPEND="<=virtual/jre-11:*
	=dev-java/antlr-4.9.3:*"

DEPEND="=dev-cpp/antlr-cpp-4.9.3:*
	dev-python/orderedmultidict[${PYTHON_USEDEP}]
	sci-electronics/UHDM
	dev-libs/capnproto
	dev-cpp/gtest
	dev-cpp/nlohmann_json"
