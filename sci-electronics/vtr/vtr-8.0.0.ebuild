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

IUSE="X parallel"

DEPEND="
	sys-devel/flex
	sys-devel/bison
	sci-mathematics/abc
	X? ( x11-libs/libX11 )
	parallel? ( dev-cpp/tbb )
"
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=(
	"${FILESDIR}"/$P-CMakeFixes.patch
	"${FILESDIR}"/$P-IncludeFixes.patch
	"${FILESDIR}"/$P-TBBMigration.patch
)

S="${WORKDIR}/vtr-verilog-to-routing-$PV"
