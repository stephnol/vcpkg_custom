vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
	OUT_SOURCE_PATH SOURCE_PATH
	REPO            marcobambini/sqlite-createtable-parser
	REF             cf3b9d0721955287b28f8cbd03e34a8fa5224ff1
	SHA512          fcb32470880fa52de700834ec718ed8d33123db78ba40315560dae0f7d72f0acbf8c69ef4ff2ca4525f88c8a2d2f7207d4ca4cb3ff039124128b4bcaa9b14c7d
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
