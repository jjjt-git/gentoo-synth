# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="SymbiYosys (sby) -- Front-end for Yosys-based formal verification flows "
HOMEPAGE="https://yosyshq.readthedocs.io/projects/sby/en/latest/#"
SRC_URI="https://github.com/YosysHQ/sby/archive/refs/tags/yosys-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="sci-electronics/yosys"
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=(
	"${FILESDIR}"/${P}-abc-opts.patch
	)

src_compile() {
	echo "nothing to do for compile"
}
