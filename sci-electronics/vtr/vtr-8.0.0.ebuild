# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Verilog to Routing -- Open Source CAD Flow for FPGA Research"
HOMEPAGE=""
SRC_URI="https://github.com/verilog-to-routing/vtr-verilog-to-routing/archive/refs/tags/v$PV.tar.gz -> $P.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

IUSE="X"

DEPEND="
	sys-devel/flex
	sys-devel/bison
	X? ( x11-libs/libX11 )
"
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=(
	"${FILESDIR}"/$P-CMakeFixes.patch
)

S="${WORKDIR}/vtr-verilog-to-routing-$PV"
