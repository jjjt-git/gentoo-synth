# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

GIT_COMMIT_ID="511412f984d64ed7c46c4bdbd839f4b3c48f6fa5"

S="${WORKDIR}/ghdl-yosys-plugin-${GIT_COMMIT_ID}"

DESCRIPTION="VHDL synthesis (based on ghdl)"
HOMEPAGE="https://github.com/ghdl/ghdl-yosys-plugin.git"
SRC_URI="https://github.com/ghdl/ghdl-yosys-plugin/archive/${GIT_COMMIT_ID}.zip -> ${P}.zip"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="sci-electronics/yosys
	sci-electronics/ghdl"
DEPEND="${BDEPEND}"
RDEPEND="${DEPEND}"
