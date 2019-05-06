# - Try to find Fontconfig
# Once done this will define
#  FONTCONFIG_FOUND - System has Fontconfig
#  FONTCONFIG_INCLUDE_DIRS - The Fontconfig include directories
#  FONTCONFIG_LIBRARIES - The libraries needed to use Fontconfig
#  FONTCONFIG_DEFINITIONS - Compiler switches required for using Fontconfig

find_package(PkgConfig)
pkg_check_modules(PC_FONTCONFIG QUIET fontconfig)
set(FONTCONFIG_DEFINITIONS ${PC_FONTCONFIG_CFLAGS_OTHER})

find_path(FONTCONFIG_INCLUDE_DIR fontconfig/fontconfig.h
	HINTS ${PC_FONTCONFIG_INCLUDEDIR} ${PC_FONTCONFIG_INCLUDE_DIRS}
)

find_library(FONTCONFIG_LIBRARY NAMES fontconfig libfontconfig
	HINTS ${PC_FONTCONFIG_LIBDIR} ${PC_FONTCONFIG_LIBRARY_DIRS}
)

include(FindPackageHandleStandardArgs)
# handle the QUIETLY and REQUIRED arguments and set FONTCONFIG_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args(Fontconfig  DEFAULT_MSG
                                  FONTCONFIG_LIBRARY FONTCONFIG_INCLUDE_DIR)

mark_as_advanced(FONTCONFIG_INCLUDE_DIR FONTCONFIG_LIBRARY )

set(FONTCONFIG_LIBRARIES ${FONTCONFIG_LIBRARY} )
set(FONTCONFIG_INCLUDE_DIRS ${FONTCONFIG_INCLUDE_DIR} )
