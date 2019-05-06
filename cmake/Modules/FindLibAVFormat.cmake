# - Try to find AVFormat
# Once done this will define
#  LIBAVFORMAT_FOUND - System has AVFormat
#  LIBAVFORMAT_INCLUDE_DIRS - The AVFormat include directories
#  LIBAVFORMAT_LIBRARIES - The libraries needed to use AVFormat
#  LIBAVFORMAT_DEFINITIONS - Compiler switches required for using AVFormat

find_package(PkgConfig)
pkg_check_modules(PC_LIBAVFORMAT QUIET libavformat)
set(LIBAVFORMAT_DEFINITIONS ${PC_LIBAVFORMAT_CFLAGS_OTHER})

find_path(LIBAVFORMAT_INCLUDE_DIR libavformat/avformat.h
	HINTS ${PC_LIBAVFORMAT_INCLUDEDIR} ${PC_LIBAVFORMAT_INCLUDE_DIRS}
)

find_library(LIBAVFORMAT_LIBRARY NAMES avformat libavformat
	HINTS ${PC_LIBAVFORMAT_LIBDIR} ${PC_LIBAVFORMAT_LIBRARY_DIRS}
)

include(FindPackageHandleStandardArgs)
# handle the QUIETLY and REQUIRED arguments and set LIBAVFORMAT_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args(AVFormat  DEFAULT_MSG
                                  LIBAVFORMAT_LIBRARY LIBAVFORMAT_INCLUDE_DIR)

mark_as_advanced(LIBAVFORMAT_INCLUDE_DIR LIBAVFORMAT_LIBRARY )

set(LIBAVFORMAT_LIBRARIES ${LIBAVFORMAT_LIBRARY} )
set(LIBAVFORMAT_INCLUDE_DIRS ${LIBAVFORMAT_INCLUDE_DIR} )