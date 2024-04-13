# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

S=${WORKDIR}/ghdl-yosys-plugin-master

DESCRIPTION="VHDL synthesis (based on ghdl)"
HOMEPAGE="https://github.com/ghdl/ghdl-yosys-plugin.git"
SRC_URI="https://github.com/ghdl/ghdl-yosys-plugin/archive/refs/heads/master.zip -> ${P}.zip"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="sci-electronics/yosys
	sci-electronics/ghdl"
DEPEND="${BDEPEND}"
RDEPEND="${DEPEND}"
