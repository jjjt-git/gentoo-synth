EAPI=8

GIT_COMMIT_ID="37ce1bbf98ca26ba2e18603a271b55ac05e121d5"

PYTHON_COMPAT=( python3_{10,11} )

inherit python-r1
inherit cmake

DESCRIPTION="SV2017 parser"
HOMEPAGE="https://github.com/chipsalliance/Surelog.git"
SRC_URI="https://github.com/chipsalliance/Surelog/archive/${GIT_COMMIT_ID}.tar.gz -> $P.tar.gz"
LICENSE="Apache-2.0"
SLOT=0
KEYWORDS=~amd64

PATCHES=(
	"${FILESDIR}"/${P}-FindANTLR.patch
	"${FILESDIR}"/${P}-CMakeLists.patch
)

DEPEND="=dev-cpp/antlr-cpp-4.9.3:*
	dev-python/orderedmultidict[${PYTHON_USEDEP}]
	sci-electronics/UHDM
	dev-libs/capnproto
	dev-cpp/gtest
	dev-cpp/nlohmann_json"

RDEPEND="${DEPEND}"

BDEPEND="<=virtual/jre-11:*
	=dev-java/antlr-4.9.3:*
	${DEPEND}"

src_unpack() {
	unpack ${P}.tar.gz
	mv ${WORKDIR}/Surelog-${GIT_COMMIT_ID} ${S}
}

src_configure() {
	local mycmakeargs=(
		"-DSURELOG_USE_HOST_ALL=ON"
		"-DANTLR_LIBRARY=/usr/lib64/libantlr4-runtime.so"
	)

	cmake_src_configure
}
