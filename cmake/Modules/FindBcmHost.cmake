# - Try to find BcmHost
# Once done this will define
#  BCMHOST_FOUND - System has BcmHost
#  BCMHOST_INCLUDE_DIRS - The BcmHost include directories
#  BCMHOST_LIBRARIES - The libraries needed to use BcmHost
#  BCMHOST_DEFINITIONS - Compiler switches required for using BcmHost


find_path(BCMHOST_INCLUDE_DIR bcm_host.h
	HINTS /opt/vc/include
)

find_library(BCMHOST_LIBRARY NAMES bcm_host libbcm_host
	HINTS	/opt/vc/lib
)

include(FindPackageHandleStandardArgs)
# handle the QUIETLY and REQUIRED arguments and set BCMHOST_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args(BcmHost  DEFAULT_MSG
                                  BCMHOST_LIBRARY BCMHOST_INCLUDE_DIR)

mark_as_advanced(BCMHOST_INCLUDE_DIR BCMHOST_LIBRARY )

set(BCMHOST_LIBRARIES ${BCMHOST_LIBRARY} )
set(BCMHOST_INCLUDE_DIRS ${BCMHOST_INCLUDE_DIR} )
