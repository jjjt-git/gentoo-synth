# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..14} )

inherit cmake python-any-r1

DESCRIPTION="SystemVerilog compiler and language services"
HOMEPAGE="https://sv-lang.com/"
SRC_URI="https://github.com/MikePopoloski/slang/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

IUSE="-test threads -static -mimalloc -tools"

DEPEND="
	>=dev-libs/libfmt-12.1.0
	>=dev-libs/boost-1.87.0
	test? ( >=dev-cpp/catch-3.14.0 )"
RDEPEND="
	${DEPEND}
	mimalloc? ( >=dev-libs/mimalloc-2.2.0 )
"
BDEPEND="${PYTHON_DEPS}"

src_configure() {
	local mycmakeargs=(
		-DSLANG_INCLUDE_PYLIB=OFF
		-DSLANG_INCLUDE_TESTS=$(usex test ON OFF)
		-DSLANG_INCLUDE_TOOLS=$(usex tools ON OFF)
		-DBUILD_SHARED_LILBS=$(usex static OFF ON)
		-DSLANG_USE_MIMALLOC=$(usex mimalloc ON OFF)
		-DSLANG_USE_THREADS=$(usex threads ON OFF)
	)
	cmake_src_configure
}
