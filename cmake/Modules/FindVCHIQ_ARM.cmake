# - Try to find vchiq_arm
# Once done this will define
#  VCHIQ_ARM_FOUND - System has vchiq_arm
#  VCHIQ_ARM_INCLUDE_DIRS - The vchiq_arm include directories
#  VCHIQ_ARM_LIBRARIES - The libraries needed to use vchiq_arm
#  VCHIQ_ARM_DEFINITIONS - Compiler switches required for using vchiq_arm


find_path(VCHIQ_ARM_INCLUDE_DIR interface/vchiq_arm/vchiq.h
	HINTS /opt/vc/include
)

find_library(VCHIQ_ARM_LIBRARY NAMES vchiq_arm libvchiq_arm
	HINTS	/opt/vc/lib
)

include(FindPackageHandleStandardArgs)
# handle the QUIETLY and REQUIRED arguments and set VCHIQ_ARM_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args(vchiq_arm  DEFAULT_MSG
                                  VCHIQ_ARM_LIBRARY VCHIQ_ARM_INCLUDE_DIR)

mark_as_advanced(VCHIQ_ARM_INCLUDE_DIR VCHIQ_ARM_LIBRARY )

set(VCHIQ_ARM_LIBRARIES ${VCHIQ_ARM_LIBRARY} )
set(VCHIQ_ARM_INCLUDE_DIRS ${VCHIQ_ARM_INCLUDE_DIR} )
