# - Try to find LibILClient
# Once done this will define
#  LIBILCLIENT_FOUND - System has LibILClient
#  LIBILCLIENT_INCLUDE_DIRS - The LibILClient include directories
#  LIBILCLIENT_LIBRARIES - The libraries needed to use LibILClient
#  LIBILCLIENT_DEFINITIONS - Compiler switches required for using LibILClient


find_path(LIBILCLIENT_INCLUDE_DIR ilclient.h
	HINTS /opt/vc/src/hello_pi/libs/ilclient
)

find_library(LIBILCLIENT_LIBRARY NAMES ilclient libilclient
	HINTS	/opt/vc/src/hello_pi/libs/ilclient
)

include(FindPackageHandleStandardArgs)
# handle the QUIETLY and REQUIRED arguments and set LIBILCLIENT_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args(LibILClient  DEFAULT_MSG
                                  LIBILCLIENT_LIBRARY LIBILCLIENT_INCLUDE_DIR)

mark_as_advanced(LIBILCLIENT_INCLUDE_DIR LIBILCLIENT_LIBRARY )

set(LIBILCLIENT_LIBRARIES ${LIBILCLIENT_LIBRARY} )
set(LIBILCLIENT_INCLUDE_DIRS ${LIBILCLIENT_INCLUDE_DIR} )
