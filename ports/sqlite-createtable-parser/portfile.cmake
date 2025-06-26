vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
	OUT_SOURCE_PATH SOURCE_PATH
	REPO            marcobambini/sqlite-createtable-parser
	REF             368ffba73bfc221ff910a15455c6c27f9da5f20d
	SHA512          9c4f261ed9b090da87ee6d9b349f38d06d9387451fbcab9fd16571023a5ebd37e24a8c47ee58bc206a3a1c20a2458ed5bee79549c57cf5527ddb1f7636cbe0c6
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
