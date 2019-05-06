# - Try to find BrcmGLES
# Once done this will define
#  BRCMGLES_FOUND - System has BrcmGLES
#  BRCMGLES_INCLUDE_DIRS - The BrcmGLES include directories
#  BRCMGLES_LIBRARIES - The libraries needed to use BrcmGLES
#  BRCMGLES_DEFINITIONS - Compiler switches required for using BrcmGLES


find_path(BRCMGLES_INCLUDE_DIR GLES2/gl2.h
	HINTS /opt/vc/include
)

find_library(BRCMGLES_LIBRARY NAMES brcmGLESv2 libbrcmGLESv2
	HINTS	/opt/vc/lib
)

include(FindPackageHandleStandardArgs)
# handle the QUIETLY and REQUIRED arguments and set BRCMGLES_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args(BrcmGLES  DEFAULT_MSG
                                  BRCMGLES_LIBRARY BRCMGLES_INCLUDE_DIR)

mark_as_advanced(BRCMGLES_INCLUDE_DIR BRCMGLES_LIBRARY )

set(BRCMGLES_LIBRARIES ${BRCMGLES_LIBRARY} )
set(BRCMGLES_INCLUDE_DIRS ${BRCMGLES_INCLUDE_DIR} )
