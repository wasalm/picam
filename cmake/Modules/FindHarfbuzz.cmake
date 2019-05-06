# - Try to find Harfbuzz
# Once done this will define
#  HARFBUZZ_FOUND - System has Harfbuzz
#  HARFBUZZ_INCLUDE_DIRS - The Harfbuzz include directories
#  HARFBUZZ_LIBRARIES - The libraries needed to use Harfbuzz
#  HARFBUZZ_DEFINITIONS - Compiler switches required for using Harfbuzz

find_package(PkgConfig)
pkg_check_modules(PC_HARFBUZZ QUIET harfbuzz)
set(HARFBUZZ_DEFINITIONS ${PC_HARFBUZZ_CFLAGS_OTHER})

find_path(HARFBUZZ_INCLUDE_DIR hb.h
	HINTS ${PC_HARFBUZZ_INCLUDEDIR} ${PC_HARFBUZZ_INCLUDE_DIRS}
)

find_library(HARFBUZZ_LIBRARY NAMES harfbuzz libharfbuzz
	HINTS ${PC_HARFBUZZ_LIBDIR} ${PC_HARFBUZZ_LIBRARY_DIRS}
)

include(FindPackageHandleStandardArgs)
# handle the QUIETLY and REQUIRED arguments and set HARFBUZZ_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args(Harfbuzz  DEFAULT_MSG
                                  HARFBUZZ_LIBRARY HARFBUZZ_INCLUDE_DIR)

mark_as_advanced(HARFBUZZ_INCLUDE_DIR HARFBUZZ_LIBRARY )

set(HARFBUZZ_LIBRARIES ${HARFBUZZ_LIBRARY} )
set(HARFBUZZ_INCLUDE_DIRS ${HARFBUZZ_INCLUDE_DIR} )
