vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
	OUT_SOURCE_PATH SOURCE_PATH
	REPO            stephnol/sqlite-createtable-parser
	REF             fe62c6c8060a14b445e1bf7b859e799f80a813c9
	SHA512          751f73ef083c7a88473528f8bb5b0a69283cce398d827e396a25b5b10dc3c2b9eadbc0e681eb3f51f9908378f3c96c8785f9fd1abfeefa6aac3b89e6e2eceff8
	HEAD_REF        feature/Support-Multiple-Check-Constraints
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
