# - Try to find SWResample
# Once done this will define
#  SWRESAMPLE_FOUND - System has SWResample
#  SWRESAMPLE_INCLUDE_DIRS - The SWResample include directories
#  SWRESAMPLE_LIBRARIES - The libraries needed to use SWResample
#  SWRESAMPLE_DEFINITIONS - Compiler switches required for using SWResample

find_package(PkgConfig)
pkg_check_modules(PC_SWRESAMPLE QUIET libswresample)
set(SWRESAMPLE_DEFINITIONS ${PC_SWRESAMPLE_CFLAGS_OTHER})

find_path(SWRESAMPLE_INCLUDE_DIR libswresample/swresample.h
	HINTS ${PC_SWRESAMPLE_INCLUDEDIR} ${PC_SWRESAMPLE_INCLUDE_DIRS}
)

find_library(SWRESAMPLE_LIBRARY NAMES swresample libswresample
	HINTS ${PC_SWRESAMPLE_LIBDIR} ${PC_SWRESAMPLE_LIBRARY_DIRS}
)

include(FindPackageHandleStandardArgs)
# handle the QUIETLY and REQUIRED arguments and set SWRESAMPLE_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args(SWResample  DEFAULT_MSG
                                  SWRESAMPLE_LIBRARY SWRESAMPLE_INCLUDE_DIR)

mark_as_advanced(SWRESAMPLE_INCLUDE_DIR SWRESAMPLE_LIBRARY )

set(SWRESAMPLE_LIBRARIES ${SWRESAMPLE_LIBRARY} )
set(SWRESAMPLE_INCLUDE_DIRS ${SWRESAMPLE_INCLUDE_DIR} )