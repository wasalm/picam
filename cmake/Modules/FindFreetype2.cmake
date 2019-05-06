# - Try to find Freetype2
# Once done this will define
#  FREETYPE2_FOUND - System has Freetype2
#  FREETYPE2_INCLUDE_DIRS - The Freetype2 include directories
#  FREETYPE2_LIBRARIES - The libraries needed to use Freetype2
#  FREETYPE2_DEFINITIONS - Compiler switches required for using Freetype2

find_package(PkgConfig)
pkg_check_modules(PC_FREETYPE2 QUIET freetype2)
set(FREETYPE2_DEFINITIONS ${PC_FREETYPE2_CFLAGS_OTHER})

find_path(FREETYPE2_INCLUDE_DIR ft2build.h freetype/config/ftheader.h 
	HINTS ${PC_FREETYPE2_INCLUDEDIR} ${PC_FREETYPE2_INCLUDE_DIRS}
)

find_library(FREETYPE2_LIBRARY NAMES freetype libfreetype
	HINTS ${PC_FREETYPE2_LIBDIR} ${PC_FREETYPE2_LIBRARY_DIRS}
)

include(FindPackageHandleStandardArgs)
# handle the QUIETLY and REQUIRED arguments and set FREETYPE2_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args(Freetype2  DEFAULT_MSG
                                  FREETYPE2_LIBRARY FREETYPE2_INCLUDE_DIR)

mark_as_advanced(FREETYPE2_INCLUDE_DIR FREETYPE2_LIBRARY )

set(FREETYPE2_LIBRARIES ${FREETYPE2_LIBRARY} )
set(FREETYPE2_INCLUDE_DIRS ${FREETYPE2_INCLUDE_DIR} )