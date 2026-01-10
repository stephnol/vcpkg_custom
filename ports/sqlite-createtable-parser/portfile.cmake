vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
	OUT_SOURCE_PATH SOURCE_PATH
	REPO            stephnol/sqlite-createtable-parser
	REF             10779e7a92b453ca9c077e126931a2f73655780e
	SHA512          c7d7f810ca684e5a3bb51a6198657f485d6e1d2df7d38f02f3d30c14be73f382dc23a11c0fa09a43137ec8636ca17627c7e1229a3895a738707f197fc2ba8f8a
	HEAD_REF        feature/AUTOINCREMENT-CHECK-GENERATED
)

file(COPY "${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt"  DESTINATION "${SOURCE_PATH}")
file(COPY "${CMAKE_CURRENT_LIST_DIR}/config.cmake.in" DESTINATION "${SOURCE_PATH}")

vcpkg_cmake_configure(
	SOURCE_PATH "${SOURCE_PATH}"
	OPTIONS
		-DTARGET_NAME=${PORT}
	OPTIONS_DEBUG
		-DDISABLE_INSTALL_HEADERS=ON
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup()

vcpkg_copy_pdbs()

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
