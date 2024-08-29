EAPI=8

GIT_COMMIT_ID="5f6e20e173fdc7decb0b47123436e2798b6e3f09"

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
	=sci-electronics/uhdm-24.08.07
	dev-libs/capnproto
	dev-cpp/gtest
	dev-cpp/nlohmann_json"

RDEPEND="${DEPEND}"

BDEPEND="<=virtual/jre-11:*
	=dev-java/antlr-4.9.3:*
	${DEPEND}"

S="${WORKDIR}/Surelog-${GIT_COMMIT_ID}"

src_configure() {
	local mycmakeargs=(
		"-DSURELOG_USE_HOST_ALL=ON"
		"-DANTLR_LIBRARY=/usr/lib64/libantlr4-runtime.so"
	)

	cmake_src_configure
}
