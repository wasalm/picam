# - Try to find BrcmEGL
# Once done this will define
#  BRCMEGL_FOUND - System has BrcmEGL
#  BRCMEGL_INCLUDE_DIRS - The BrcmEGL include directories
#  BRCMEGL_LIBRARIES - The libraries needed to use BrcmEGL
#  BRCMEGL_DEFINITIONS - Compiler switches required for using BrcmEGL


find_path(BRCMEGL_INCLUDE_DIR EGL/egl.h
	HINTS /opt/vc/include
)

find_library(BRCMEGL_LIBRARY NAMES brcmEGL libbrcmEGL
	HINTS	/opt/vc/lib
)

include(FindPackageHandleStandardArgs)
# handle the QUIETLY and REQUIRED arguments and set BRCMEGL_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args(BrcmEGL  DEFAULT_MSG
                                  BRCMEGL_LIBRARY BRCMEGL_INCLUDE_DIR)

mark_as_advanced(BRCMEGL_INCLUDE_DIR BRCMEGL_LIBRARY )

set(BRCMEGL_LIBRARIES ${BRCMEGL_LIBRARY} )
set(BRCMEGL_INCLUDE_DIRS ${BRCMEGL_INCLUDE_DIR} )
