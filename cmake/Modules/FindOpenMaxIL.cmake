# - Try to find OpenMaxIL
# Once done this will define
#  OPENMAXIL_FOUND - System has OpenMaxIL
#  OPENMAXIL_INCLUDE_DIRS - The OpenMaxIL include directories
#  OPENMAXIL_LIBRARIES - The libraries needed to use OpenMaxIL
#  OPENMAXIL_DEFINITIONS - Compiler switches required for using OpenMaxIL


find_path(OPENMAXIL_INCLUDE_DIR IL/OMX_Core.h
	HINTS /opt/vc/include
)

find_library(OPENMAXIL_LIBRARY NAMES openmaxil libopenmaxil
	HINTS	/opt/vc/lib
)

include(FindPackageHandleStandardArgs)
# handle the QUIETLY and REQUIRED arguments and set OPENMAXIL_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args(OpenMaxIL  DEFAULT_MSG
                                  OPENMAXIL_LIBRARY OPENMAXIL_INCLUDE_DIR)

mark_as_advanced(OPENMAXIL_INCLUDE_DIR OPENMAXIL_LIBRARY )

set(OPENMAXIL_LIBRARIES ${OPENMAXIL_LIBRARY} )
set(OPENMAXIL_INCLUDE_DIRS ${OPENMAXIL_INCLUDE_DIR} )
