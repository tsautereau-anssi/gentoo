# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_TEST="forceoptional"
KMNAME="kdev-python"
PYTHON_COMPAT=( python3_{5,6,7} )
inherit kde5 python-single-r1

if [[ ${KDE_BUILD_TYPE} = release ]]; then
	KEYWORDS="~amd64 x86"
fi

DESCRIPTION="Python plugin for KDevelop"
HOMEPAGE="https://www.kdevelop.org/"
IUSE=""

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="${PYTHON_DEPS}
	$(add_frameworks_dep kcompletion)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kitemmodels)
	$(add_frameworks_dep knewstuff)
	$(add_frameworks_dep kparts)
	$(add_frameworks_dep ktexteditor)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kxmlgui)
	$(add_frameworks_dep threadweaver)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	dev-util/kdevelop:5=
"
RDEPEND="${DEPEND}
	dev-python/pycodestyle[${PYTHON_USEDEP}]
"

RESTRICT+=" test"

pkg_setup() {
	python-single-r1_pkg_setup
	kde5_pkg_setup
}
