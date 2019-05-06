# - Try to find AVUtil
# Once done this will define
#  LIBAVUTIL_FOUND - System has AVUtil
#  LIBAVUTIL_INCLUDE_DIRS - The AVUtil include directories
#  LIBAVUTIL_LIBRARIES - The libraries needed to use AVUtil
#  LIBAVUTIL_DEFINITIONS - Compiler switches required for using AVUtil

find_package(PkgConfig)
pkg_check_modules(PC_LIBAVUTIL QUIET libavutil)
set(LIBAVUTIL_DEFINITIONS ${PC_LIBAVUTIL_CFLAGS_OTHER})

find_path(LIBAVUTIL_INCLUDE_DIR libavutil/avutil.h
	HINTS ${PC_LIBAVUTIL_INCLUDEDIR} ${PC_LIBAVUTIL_INCLUDE_DIRS}
)

find_library(LIBAVUTIL_LIBRARY NAMES avutil libavutil
	HINTS ${PC_LIBAVUTIL_LIBDIR} ${PC_LIBAVUTIL_LIBRARY_DIRS}
)

include(FindPackageHandleStandardArgs)
# handle the QUIETLY and REQUIRED arguments and set LIBAVUTIL_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args(AVUtil  DEFAULT_MSG
                                  LIBAVUTIL_LIBRARY LIBAVUTIL_INCLUDE_DIR)

mark_as_advanced(LIBAVUTIL_INCLUDE_DIR LIBAVUTIL_LIBRARY )

set(LIBAVUTIL_LIBRARIES ${LIBAVUTIL_LIBRARY} )
set(LIBAVUTIL_INCLUDE_DIRS ${LIBAVUTIL_INCLUDE_DIR} )