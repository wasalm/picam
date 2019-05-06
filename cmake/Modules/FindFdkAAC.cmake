# - Try to find FdkAac
# Once done this will define
#  FDKAAC_FOUND - System has FdkAac
#  FDKAAC_INCLUDE_DIRS - The FdkAac include directories
#  FDKAAC_LIBRARIES - The libraries needed to use FdkAac
#  FDKAAC_DEFINITIONS - Compiler switches required for using FdkAac

find_package(PkgConfig)
pkg_check_modules(PC_FDKAAC QUIET fdk-aac)
set(FDKAAC_DEFINITIONS ${PC_FDKAAC_CFLAGS_OTHER})

find_path(FDKAAC_INCLUDE_DIR fdk-aac/FDK_audio.h
	HINTS ${PC_FDKAAC_INCLUDEDIR} ${PC_FDKAAC_INCLUDE_DIRS}
)

find_library(FDKAAC_LIBRARY NAMES fdk-aac libfdk-aac
	HINTS ${PC_FDKAAC_LIBDIR} ${PC_FDKAAC_LIBRARY_DIRS}
)

include(FindPackageHandleStandardArgs)
# handle the QUIETLY and REQUIRED arguments and set FDKAAC_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args(FdkAac  DEFAULT_MSG
                                  FDKAAC_LIBRARY FDKAAC_INCLUDE_DIR)

mark_as_advanced(FDKAAC_INCLUDE_DIR FDKAAC_LIBRARY )

set(FDKAAC_LIBRARIES ${FDKAAC_LIBRARY} )
set(FDKAAC_INCLUDE_DIRS ${FDKAAC_INCLUDE_DIR} )