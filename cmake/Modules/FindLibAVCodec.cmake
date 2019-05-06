# - Try to find AVCodec
# Once done this will define
#  LIBAVCODEC_FOUND - System has AVCodec
#  LIBAVCODEC_INCLUDE_DIRS - The AVCodec include directories
#  LIBAVCODEC_LIBRARIES - The libraries needed to use AVCodec
#  LIBAVCODEC_DEFINITIONS - Compiler switches required for using AVCodec

find_package(PkgConfig)
pkg_check_modules(PC_LIBAVCODEC QUIET libavcodec)
set(LIBAVCODEC_DEFINITIONS ${PC_LIBAVCODEC_CFLAGS_OTHER})

find_path(LIBAVCODEC_INCLUDE_DIR libavcodec/avcodec.h
	HINTS ${PC_LIBAVCODEC_INCLUDEDIR} ${PC_LIBAVCODEC_INCLUDE_DIRS}
)

find_library(LIBAVCODEC_LIBRARY NAMES avcodec libavcodec
	HINTS ${PC_LIBAVCODEC_LIBDIR} ${PC_LIBAVCODEC_LIBRARY_DIRS}
)

include(FindPackageHandleStandardArgs)
# handle the QUIETLY and REQUIRED arguments and set LIBAVCODEC_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args(AVCodec  DEFAULT_MSG
                                  LIBAVCODEC_LIBRARY LIBAVCODEC_INCLUDE_DIR)

mark_as_advanced(LIBAVCODEC_INCLUDE_DIR LIBAVCODEC_LIBRARY )

set(LIBAVCODEC_LIBRARIES ${LIBAVCODEC_LIBRARY} )
set(LIBAVCODEC_INCLUDE_DIRS ${LIBAVCODEC_INCLUDE_DIR} )