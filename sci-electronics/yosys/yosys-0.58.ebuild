EAPI=8

S=$WORKDIR/

DESCRIPTION="framework for Verilog RTL synthesis"
HOMEPAGE="http://www.clifford.at/yosys/"
SRC_URI="https://github.com/YosysHQ/yosys/releases/download/v$PV/yosys.tar.gz -> $P.tar.gz"
LICENSE=ISC
SLOT=0
KEYWORDS=amd64

DEPEND="dev-vcs/git
	media-gfx/xdot
	dev-libs/boost
	llvm-core/clang
	sci-mathematics/abc"

src_compile() {
	emake DESTDIR="$D" PREFIX=/usr ABCEXTERNAL=abc
}

src_install() {
	emake DESTDIR="$D" PREFIX=/usr ABCEXTERNAL=abc install
	newbin ${FILESDIR}/$PN-abc-wrapper.sh yosys-abc # this "binary" is needed by tools like sby or eqy, because they assume yosys is built with in-tree abc
}
