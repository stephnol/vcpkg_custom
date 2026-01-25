vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
	OUT_SOURCE_PATH SOURCE_PATH
	REPO            marcobambini/sqlite-createtable-parser
	REF             d0e68e0e7fc5170cd79a827feaf0cfc0fff93453
	SHA512          60fa7464f62a6953db8136c35ee229ccc625dfab0a78ba02c0a77e42a78cc40e05da3b1fbc2b6fa9d6fb63b76adeaff26f583ddf900492460c6ed48a171311b8
	HEAD_REF        master
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
