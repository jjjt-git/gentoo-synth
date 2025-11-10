# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

GIT_COMMIT_ID="f44908907726e684965ba71959cc147df50c0357"

S="${WORKDIR}/${PN}-${GIT_COMMIT_ID}"

DESCRIPTION="SystemVerilog frontend for Yosys"
HOMEPAGE="https://github.com/povik/yosys-slang"
SRC_URI="https://github.com/povik/yosys-slang/archive/${GIT_COMMIT_ID}.tar.gz -> ${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	=sci-electronics/slang-9.1
	>=dev-libs/libfmt-12.1.0
	>=sci-electronics/yosys-0.44
"
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=(
	"${FILESDIR}"/${P}-CMakeLists.patch
)
