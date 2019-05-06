# - Try to find vcos
# Once done this will define
#  VCOS_FOUND - System has vcos
#  VCOS_INCLUDE_DIRS - The vcos include directories
#  VCOS_LIBRARIES - The libraries needed to use vcos
#  VCOS_DEFINITIONS - Compiler switches required for using vcos


find_path(VCOS_INCLUDE_DIR interface/vcos/vcos.h
	HINTS /opt/vc/include
)

find_library(VCOS_LIBRARY NAMES vcos libvcos
	HINTS	/opt/vc/lib
)

include(FindPackageHandleStandardArgs)
# handle the QUIETLY and REQUIRED arguments and set VCOS_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args(vcos  DEFAULT_MSG
                                  VCOS_LIBRARY VCOS_INCLUDE_DIR)

mark_as_advanced(VCOS_INCLUDE_DIR VCOS_LIBRARY )

set(VCOS_LIBRARIES ${VCOS_LIBRARY} )
set(VCOS_INCLUDE_DIRS ${VCOS_INCLUDE_DIR} )