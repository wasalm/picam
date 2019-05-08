cmake_minimum_required (VERSION 3.0)
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/Modules/")

message(STATUS "${CMAKE_MODULE_PATH}")
project (picam)

#
# Find packages
#

# Packages included by CMake
find_package (Threads REQUIRED)
find_package (ALSA REQUIRED) 
find_package (OpenSSL REQUIRED) 
find_package (ZLIB REQUIRED)

#Packages included by pkgconfig
find_package (Harfbuzz REQUIRED)
find_package (Freetype2 REQUIRED)
find_package (Fontconfig REQUIRED)
find_package (LibAVFormat REQUIRED)
find_package (LibAVCodec REQUIRED)

find_package (FdkAAC REQUIRED)
find_package (SWResample REQUIRED)
find_package (LibAVUtil REQUIRED)

#Package included pi Rapberry pi Userland
find_package (BcmHost REQUIRED)
find_package (BrcmEGL REQUIRED)
find_package (BrcmGLES2 REQUIRED)
find_package (OpenMaxIL REQUIRED)
find_package (VCOS REQUIRED)
find_package (VCHIQ_ARM REQUIRED)
find_package (VHOST REQUIRED)


#Other
find_package (LibM REQUIRED)

#
# Set include directories
#

include_directories(SYSTEM
	${HARFBUZZ_INCLUDE_DIRS}
	${FREETYPE2_INCLUDE_DIRS}
	${FONTCONFIG_INCLUDE_DIRS}
	${LIBAVFORMAT_INCLUDE_DIRS}
	${LIBAVCODEC_INCLUDE_DIRS}

	${FDKAAC_INCLUDE_DIRS}
	${SWRESAMPLE_INCLUDE_DIRS}
	${LIBAVUTIL_INCLUDE_DIRS}

	${BCMHOST_INCLUDE_DIRS}
	${BRCMEGL_INCLUDE_DIRS}
	${BRCMGLES_INCLUDE_DIRS}
	${OPENMAXIL_INCLUDE_DIRS}
	${VCOS_INCLUDE_DIRS}
	${VCHIQ_ARM_INCLUDE_DIRS}
	${VCHOST_INCLUDE_DIRS}

	${LIBM_INCLUDE_DIRS}
	${ZLIB_INCLUDE_DIRS}
)

#
#	Create Executable
#

add_definitions( -DOMX_SKIP64BIT )
add_executable(picam src/stream.c src/hooks.c src/mpegts.c src/httplivestreaming.c src/state.c src/log.c src/text.c src/timestamp.c src/subtitle.c src/dispmanx.c src/ilclient/ilclient.c)

#
# Link libraries to picam
#
target_link_libraries(picam PUBLIC
	${CMAKE_THREAD_LIBS_INIT}
	${ALSA_LIBRARIES}
	${OPENSSL_CRYPTO_LIBRARY}

	${HARFBUZZ_LIBRARIES}
	${FREETYPE2_LIBRARIES}
	${FONTCONFIG_LIBRARIES}
	${LIBAVFORMAT_LIBRARIES}
	${LIBAVCODEC_LIBRARIES}

	${FDKAAC_LIBRARIES}
	${SWRESAMPLE_LIBRARIES}
	${LIBAVUTIL_LIBRARIES}

	${BCMHOST_LIBRARIES}
	${BRCMEGL_LIBRARIES}
	${BRCMGLES_LIBRARIES}
	${OPENMAXIL_LIBRARIES}
	${VCOS_LIBRARIES}
	${VCHIQ_ARM_LIBRARIES}
	${VCHOST_LIBRARIES}

	${LIBM_LIBRARIES}
	${ZLIB_LIBRARIES}
)

install (TARGETS picam DESTINATION bin)