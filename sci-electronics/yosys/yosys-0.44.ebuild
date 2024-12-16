EAPI=8

S=$WORKDIR/$PN-$PN-$PV

DESCRIPTION="framework for Verilog RTL synthesis"
HOMEPAGE="http://www.clifford.at/yosys/"
SRC_URI="https://github.com/YosysHQ/yosys/archive/refs/tags/$P.tar.gz"
LICENSE=ISC
SLOT=0
KEYWORDS=amd64

DEPEND="dev-vcs/git
	media-gfx/xdot
	dev-libs/boost
	llvm-core/clang
	sci-mathematics/abc"

src_unpack() {
	unpack $P.tar.gz
}

src_compile() {
	emake DESTDIR="$D" PREFIX=/usr ABCEXTERNAL=abc
}

src_install() {
	emake DESTDIR="$D" PREFIX=/usr ABCEXTERNAL=abc install
	newbin ${FILESDIR}/$PN-abc-wrapper.sh yosys-abc # this "binary" is needed by tools like sby or eqy, because they assume yosys is built with in-tree abc
}
