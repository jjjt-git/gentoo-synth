# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

COQ_VERSION="8.19.2"

DESCRIPTION="A function definition package for Coq"
HOMEPAGE="https://github.com/mattam82/Coq-Equations"
SRC_URI="https://github.com/mattam82/Coq-Equations/archive/refs/tags/v1.3-$PV.tar.gz -> $P.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="=sci-mathematics/coq-${COQ_VERSION}"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/Coq-Equations-1.3-$PV"

src_configure() {
	./configure.sh
}
