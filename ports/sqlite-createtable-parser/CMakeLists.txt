cmake_minimum_required(VERSION 3.1)

############
# Generate #
############

# Project and library
project(${TARGET_NAME} C)
add_library(${TARGET_NAME})

# Source file(s)
target_sources(${TARGET_NAME} PRIVATE
	sql3parse_table.c
)

# Header file(s)
set(HEADER_FILES
	sql3parse_table.h
)

###########
# Install #
###########

include(GNUInstallDirs)

# Specify header file(s)' location for this target
target_include_directories(${TARGET_NAME} INTERFACE
	$<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>
)

if(NOT DISABLE_INSTALL_HEADERS)
	# Install header file(s)
	install(
		FILES		${HEADER_FILES}
		DESTINATION	${CMAKE_INSTALL_INCLUDEDIR}/${TARGET_NAME}
	)
endif()

# Install binary file(s)
install(
	TARGETS	${TARGET_NAME}
	EXPORT	${TARGET_NAME}-targets
	ARCHIVE
	LIBRARY
	RUNTIME
)

# Generate and install ${TARGET_NAME}-targets.cmake and
# ${TARGET_NAME}-targets-{debug|release}.cmake files
install(
	EXPORT		${TARGET_NAME}-targets
	DESTINATION	${CMAKE_INSTALL_DATAROOTDIR}/${TARGET_NAME}
	NAMESPACE	${TARGET_NAME}::
)

# Generate and install ${TARGET_NAME}-config.cmake file
include(CMakePackageConfigHelpers)
configure_package_config_file(
	config.cmake.in
	"${CMAKE_CURRENT_BINARY_DIR}/${TARGET_NAME}-config.cmake"
	INSTALL_DESTINATION ${CMAKE_INSTALL_DATAROOTDIR}/${TARGET_NAME}
)
install(
	FILES		"${CMAKE_CURRENT_BINARY_DIR}/${TARGET_NAME}-config.cmake"
	DESTINATION	${CMAKE_INSTALL_DATAROOTDIR}/${TARGET_NAME}
)
