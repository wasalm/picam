# - Try to find vchost
# Once done this will define
#  VCHOST_FOUND - System has vchost
#  VCHOST_INCLUDE_DIRS - The vchost include directories
#  VCHOST_LIBRARIES - The libraries needed to use vchost
#  VCHOST_DEFINITIONS - Compiler switches required for using vchost


find_path(VCHOST_INCLUDE_DIR interface/vmcs_host/vc_dispmanx.h
	HINTS /opt/vc/include
)

find_library(VCHOST_LIBRARY NAMES vchostif libvchostif vchost
	HINTS	/opt/vc/lib
)

include(FindPackageHandleStandardArgs)
# handle the QUIETLY and REQUIRED arguments and set VCHOST_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args(vchost  DEFAULT_MSG
                                  VCHOST_LIBRARY VCHOST_INCLUDE_DIR)

mark_as_advanced(VCHOST_INCLUDE_DIR VCHOST_LIBRARY )

set(VCHOST_LIBRARIES ${VCHOST_LIBRARY} )
set(VCHOST_INCLUDE_DIRS ${VCHOST_INCLUDE_DIR} )