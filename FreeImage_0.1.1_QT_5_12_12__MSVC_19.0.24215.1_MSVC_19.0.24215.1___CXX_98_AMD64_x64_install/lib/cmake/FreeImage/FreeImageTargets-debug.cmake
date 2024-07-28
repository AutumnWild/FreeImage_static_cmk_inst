#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "FreeImage::FreeImage" for configuration "Debug"
set_property(TARGET FreeImage::FreeImage APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(FreeImage::FreeImage PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "C;CXX"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/FreeImaged.lib"
  )

list(APPEND _cmake_import_check_targets FreeImage::FreeImage )
list(APPEND _cmake_import_check_files_for_FreeImage::FreeImage "${_IMPORT_PREFIX}/lib/FreeImaged.lib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
