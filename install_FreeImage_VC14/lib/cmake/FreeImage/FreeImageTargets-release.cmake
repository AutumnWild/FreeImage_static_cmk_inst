#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "FreeImage::FreeImage" for configuration "Release"
set_property(TARGET FreeImage::FreeImage APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(FreeImage::FreeImage PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/FreeImage.lib"
  )

list(APPEND _IMPORT_CHECK_TARGETS FreeImage::FreeImage )
list(APPEND _IMPORT_CHECK_FILES_FOR_FreeImage::FreeImage "${_IMPORT_PREFIX}/lib/FreeImage.lib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
