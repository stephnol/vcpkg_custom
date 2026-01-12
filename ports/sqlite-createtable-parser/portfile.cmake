vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
	OUT_SOURCE_PATH SOURCE_PATH
	REPO            marcobambini/sqlite-createtable-parser
	REF             4ae7652141fe2d7c62b2d0d546c14c4106037f26
	SHA512          c9489ba9e5b4f662490bcc0b31070961e85f001f93f91cc07a206146bc9b75a228125216f7f2a5e74198149ed54ae72725144380499db13395ac6d19ebc11b8f
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
