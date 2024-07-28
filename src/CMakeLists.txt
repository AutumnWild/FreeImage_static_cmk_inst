cmake_minimum_required(VERSION 3.0.0)

project(FreeImage   LANGUAGES CXX  C VERSION 0.1.1   )

set(CMAKE_C_STANDARD 90)
set(CMAKE_CXX_STANDARD 98)
# set(CMAKE_CXX_STANDARD 11)

if(NOT CMAKE_BUILD_TYPE)
    # set(CMAKE_BUILD_TYPE Debug CACHE STRING "Choose the type of build (Debug or Release)" FORCE)
endif(NOT CMAKE_BUILD_TYPE)

# set(CMAKE_AUTOUIC ON)
# set(CMAKE_AUTOMOC ON)
# set(CMAKE_AUTORCC ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)

# set(CMAKE_CXX_STANDARD 17)
# set(CMAKE_CXX_STANDARD_REQUIRED ON)
# set(CMAKE_CXX_EXTENSIONS ON)


# 改变安装路径可以使用下面的语句，Unix: "/usr/local", Windows: "c:/Program Files/${PROJECT_NAME}" 为默认值，所有的DESTINATION均以此目录为根目录
# set(CMAKE_INSTALL_PREFIX ${CMAKE_BINARY_DIR}/mymath)
# set(CMAKE_INSTALL_PREFIX ${CMAKE_BINARY_DIR}/../${PROJECT_NAME}_${CMAKE_CXX_COMPILER_VERSION}_install)



# #set(CMAKE_DEBUG_POSTFIX  "d")
# #set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS ON)
# if(MSVC)
#     set(CMAKE_DEBUG_POSTFIX "d")
# endif()




if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Debug CACHE STRING "Choose the type of build (Debug or Release)" FORCE)
endif(NOT CMAKE_BUILD_TYPE)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)

# set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS ON)

find_package(QT NAMES Qt6 Qt5 REQUIRED COMPONENTS  Network Xml Multimedia MultimediaWidgets Widgets )# Widgets #WebEngineWidgets WebChannel Widgets LinguistTools Core Gui  WebEngineWidgets PrintSupport
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Network Xml Multimedia MultimediaWidgets Widgets)





if (CMAKE_SYSTEM_NAME MATCHES "Linux")
elseif (CMAKE_SYSTEM_NAME MATCHES "Windows")
elseif (CMAKE_SYSTEM_NAME MATCHES "FreeBSD")
else ()
    MESSAGE(STATUS "other platform: ${CMAKE_SYSTEM_NAME}")
endif (CMAKE_SYSTEM_NAME MATCHES "Linux")


if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
    # using Clang
elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
    # using GCC
elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Intel")
    # using Intel C++
elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "MSVC")
    # using Visual Studio C++
endif ()

set(CMAKE_PREFIX_PATH "D:\\Qt\\Qt5.12.12;D:\\binWin10\\LLVM;D:\\binWin10\\llvm-mingw-20220906-msvcrt-x86_64")

message(STATUS "------------> CMAKE_SYSTEM_NAME= ${CMAKE_SYSTEM_NAME}")

set(toolChainMy "MinGWTCh")
#if (CMAKE_GENERATOR MATCHES "MinGW")
#  message(STATUS "CMake is using MinGW")
#  set(toolChainMy "MinGWTCh")
#elseif (CMAKE_GENERATOR MATCHES "MSVC")
#  set(toolChainMy "MSVCTCh")
#elseif (CMAKE_GENERATOR MATCHES "CYGWIN")
#  set(toolChainMy "CYGWINTCh")
#elseif (CMAKE_GENERATOR MATCHES "GNU")
#  set(toolChainMy "GNUTCh")
#else ()
#  message(STATUS "CMake is not kowning what.")
#  set(toolChainMy "UnkownTCh")
#endif ()
#cmake.exe -G "MinGW Makefiles"
message(STATUS "_________________________________")
# 判断CMAKE_C_COMPILER的类型
if (CMAKE_C_COMPILER MATCHES "gcc")
    if (CMAKE_SYSTEM_NAME MATCHES "Windows")
        message(STATUS "Cygwin/MinGW Compiler")
        set(toolChainMy "CygwinMinGWTCh")
    elseif (CMAKE_SYSTEM_NAME MATCHES "Linux")
        MESSAGE(STATUS "GNU Compiler")
        set(toolChainMy "GNUTCh")
    else ()
        message(STATUS "other Compiler")
        set(toolChainMy "OtherTCh")
    endif ()
elseif (CMAKE_C_COMPILER MATCHES "clang")
    message(STATUS "Clang Compiler")
    set(toolChainMy "ClangTCh")
elseif (CMAKE_C_COMPILER MATCHES "cl")
    message(STATUS "MSVC Compiler")
    set(toolChainMy "")
else ()
    message(STATUS "Unknown Compiler")
    set(toolChainMy "UnknownTCh")
endif ()
message(STATUS "_________________________________")
if (0)
    include(CheckCXXSourceCompiles)
    set(CMAKE_REQUIRED_DEFINITIONS -D_MSC_VER)
    CHECK_CXX_SOURCE_COMPILES("
#include <Windows.h>
int main() {
    #ifdef _MSC_VER
    // 如果定义了_MSC_VER，这里的代码将会被编译
    #endif
    return 0;
}" MSCRT_SUPPORTED)

    if (MSCRT_SUPPORTED)
        message(STATUS "MS CRT is supported")
    else ()
        message(STATUS "MS CRT is not supported")
    endif ()
    message(STATUS "_________________________________")
endif ()

if (CMAKE_SYSTEM_NAME MATCHES "Linux")
    MESSAGE(STATUS "current platform: Linux ")
elseif (CMAKE_SYSTEM_NAME MATCHES "Windows")
    MESSAGE(STATUS "current platform: Windows")
elseif (CMAKE_SYSTEM_NAME MATCHES "Darwin")
    MESSAGE(STATUS "current platform: Mac OS X")
else ()
    MESSAGE(STATUS "other platform: ${CMAKE_SYSTEM_NAME}")
endif (CMAKE_SYSTEM_NAME MATCHES "Linux")

cmake_host_system_information(RESULT PRETTY_NAME QUERY DISTRIB_PRETTY_NAME)
message(STATUS "${PRETTY_NAME}")

cmake_host_system_information(RESULT DISTRO QUERY DISTRIB_INFO)
foreach (VAR IN LISTS DISTRO)
    message(STATUS "${VAR}=`${${VAR}}`")
endforeach ()



if(0)
    set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} /MT")
    set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} /MTd")
    if (MSVC)
        set(CompilerFlags
            CMAKE_CXX_FLAGS
            CMAKE_CXX_FLAGS_DEBUG
            CMAKE_CXX_FLAGS_RELEASE
            CMAKE_C_FLAGS
            CMAKE_C_FLAGS_DEBUG
            CMAKE_C_FLAGS_RELEASE
        )
    foreach(CompilerFlag ${CompilerFlags})
        string(REPLACE "/MD" "/MT" ${CompilerFlag} "${${CompilerFlag}}")
    endforeach()
endif(MSVC)
endif( )

if (CMAKE_BUILD_TYPE STREQUAL "Debug")
    set(CMAKE_DEBUG_POSTFIX "d")
endif ()


if (MSVC)
    set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS ON)
    if (CMAKE_BUILD_TYPE STREQUAL "Debug")
        set(CMAKE_DEBUG_POSTFIX "d")
    elseif (CMAKE_BUILD_TYPE STREQUAL "Release")
        set(CMAKE_DEBUG_POSTFIX "")
    endif ()
    #set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /utf-8")
#    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /fexec-charset=utf-8 /source-charset=utf-8 /execution-charset=utf-8")
    #set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /fexec-charset=utf-8 /source-charset:utf-8 /execution-charset:utf-8")
    #set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -fexec-charset=GBK")
    #set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -fexec-charset=GBK")
else ()
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fexec-charset=utf-8")
endif ()
#link_directories(${CMAKE_BINARY_DIR} )

message("CMAKE_C_COMPILER = ${CMAKE_C_COMPILER}")
message("CMAKE_C_COMPILER_VERSION = ${CMAKE_C_COMPILER_VERSION}")
message("CMAKE_C_COMPILER_ID = ${CMAKE_C_COMPILER_ID}")
message("CMAKE_CXX_PLATFORM_ID = ${CMAKE_CXX_PLATFORM_ID}")
message("CMAKE_CXX_COMPILER_TARGET = ${CMAKE_CXX_COMPILER_TARGET}")
message("CMAKE_CXX_COMPILER_AR = ${CMAKE_CXX_COMPILER_AR}")
message("CMAKE_C_COMPILER_ABI = ${CMAKE_C_COMPILER_ABI}")
message("CMAKE_C_COMPILER_TARGET = ${CMAKE_C_COMPILER_TARGET}")
message("CMAKE_HOST_SYSTEM = ${CMAKE_HOST_SYSTEM}")
message("CMAKE_HOST_SYSTEM_NAME = ${CMAKE_HOST_SYSTEM_NAME}")
message("CMAKE_VS_PLATFORM_NAME = ${CMAKE_VS_PLATFORM_NAME}")
message("CMAKE_VS_PLATFORM_TOOLSET = ${CMAKE_VS_PLATFORM_TOOLSET}")
message("CMAKE_CXX_COMPILER_VERSION = ${CMAKE_CXX_COMPILER_VERSION}")
#message("CMAKE_CXX_COMPILER_TARGET= ${CMAKE_CXX_COMPILER_TARGET}")
message("CMAKE_CXX_COMPILER_ABI= ${CMAKE_CXX_COMPILER_ABI}")
message("CMAKE_CXX_COMPILER_EXTERNAL_TOOLCHAIN= ${CMAKE_CXX_COMPILER_EXTERNAL_TOOLCHAIN}")
message("CMAKE_CXX_COMPILER_ID= ${CMAKE_CXX_COMPILER_ID}")
message("CMAKE_CXX_COMPILER_ARCHITECTURE_ID= ${CMAKE_CXX_COMPILER_ARCHITECTURE_ID}")
#message("CMAKE_HOST_SYSTEM_NAME= ${CMAKE_HOST_SYSTEM_NAME}")
message("CMAKE_Fortran_FORMAT= ${CMAKE_Fortran_FORMAT}")
message("CMAKE_Fortran_COMPILER= ${CMAKE_Fortran_COMPILER}")
message("CMAKE_Fortran_COMPILER_VERSION= ${CMAKE_Fortran_COMPILER_VERSION}")
message("CMAKE_Fortran_COMPILER_ID= ${CMAKE_Fortran_COMPILER_ID}")
message("CMAKE_GENERATOR= ${CMAKE_GENERATOR}")
message("CMAKE_SYSTEM_NAME= ${CMAKE_SYSTEM_NAME}")
message("{QT_VERSION_MAJOR}=${QT_VERSION_MAJOR}")
message("{QT_VERSION_MAJORREVISION}=${QT_VERSION_MAJORREVISION}")
#MajorRevision
message("{QT_VERSION_MINOR}=${QT_VERSION_MINOR}")
message("{QT_VERSION_MINORREVISION}=${QT_VERSION_MINORREVISION}")
#MinorRevision
message("{QT_VERSION_PATCH}=${QT_VERSION_PATCH}")
message("{QT_VERSION_BUILD}=${QT_VERSION_BUILD}")
#Build


# 改变安装路径可以使用下面的语句，Unix: "/usr/local", Windows: "c:/Program Files/${PROJECT_NAME}" 为默认值，所有的DESTINATION均以此目录为根目录
# set(CMAKE_INSTALL_PREFIX ${CMAKE_BINARY_DIR}/mymath)
#set(CMAKE_INSTALL_PREFIX ${CMAKE_BINARY_DIR}/../${PROJECT_NAME}_${PROJECT_VERSION}_${CMAKE_HOST_SYSTEM}_${CMAKE_CXX_COMPILER_ID}_${CMAKE_CXX_COMPILER_VERSION}_install)
#set(CMAKE_INSTALL_PREFIX ${CMAKE_BINARY_DIR}/../${PROJECT_NAME}_${PROJECT_VERSION}_${CMAKE_CXX_COMPILER_ID}_${CMAKE_CXX_COMPILER_VERSION}_${CMAKE_Fortran_COMPILER_ID}_${CMAKE_Fortran_COMPILER_VERSION}_install)
#set(CMAKE_INSTALL_PREFIX ${CMAKE_BINARY_DIR}/../${PROJECT_NAME}_${PROJECT_VERSION}_${CMAKE_HOST_SYSTEM_NAME}_${CMAKE_CXX_PLATFORM_ID}_${CMAKE_CXX_COMPILER_ID}_${CMAKE_CXX_COMPILER_VERSION}_${CMAKE_Fortran_COMPILER_ID}_${CMAKE_Fortran_COMPILER_VERSION}_CXX_${CMAKE_CXX_STANDARD}_${CMAKE_SYSTEM_PROCESSOR}_install)
set(CMAKE_INSTALL_PREFIX ${CMAKE_SOURCE_DIR}/../${PROJECT_NAME}_${PROJECT_VERSION}_QT_${QT_VERSION_MAJOR}_${QT_VERSION_MINOR}_${QT_VERSION_PATCH}_${toolChainMy}_${CMAKE_C_COMPILER_ID}_${CMAKE_C_COMPILER_VERSION}_${CMAKE_CXX_COMPILER_ID}_${CMAKE_CXX_COMPILER_VERSION}_${CMAKE_Fortran_COMPILER_ID}_${CMAKE_Fortran_COMPILER_VERSION}_CXX_${CMAKE_CXX_STANDARD}_${CMAKE_SYSTEM_PROCESSOR}_${CMAKE_CXX_COMPILER_ARCHITECTURE_ID}_install)
# CMAKE_SYSTEM_NAME  toolChainMy

set(OUTPUT_DIR_KENT ${CMAKE_SOURCE_DIR}/../${PROJECT_NAME}_${PROJECT_VERSION}_QT_${QT_VERSION_MAJOR}_${QT_VERSION_MINOR}_${QT_VERSION_PATCH}_${toolChainMy}_${CMAKE_C_COMPILER_ID}_${CMAKE_C_COMPILER_VERSION}_${CMAKE_CXX_COMPILER_ID}_${CMAKE_CXX_COMPILER_VERSION}_${CMAKE_Fortran_COMPILER_ID}_${CMAKE_Fortran_COMPILER_VERSION}_CXX_${CMAKE_CXX_STANDARD}_${CMAKE_SYSTEM_PROCESSOR}_${CMAKE_CXX_COMPILER_ARCHITECTURE_ID}_bin)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${OUTPUT_DIR_KENT})
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${OUTPUT_DIR_KENT})
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${OUTPUT_DIR_KENT})

# install
include(CMakePackageConfigHelpers)

# aux_source_directory(./  sourceAll )
# file(GLOB_RECURSE  ./*.cpp  all_source_files )
#file(GLOB_RECURSE sources  *.cpp *.h)
#file(GLOB_RECURSE sourcesBuild  build/*.cpp  )
#list(REMOVE_ITEM sources ${sourcesBuild})










#set(FI_SRCS_FILE fipMakefile.srcs)
set(FI_SRCS_FILE Makefile.srcs CACHE FILEPATH ".srcs file from freeimage source code")
message(STATUS "Generate Project From ${FI_SRCS_FILE}")

# read file content
file(STRINGS ${FI_SRCS_FILE} SRCS_File)

# find VER_MAJOR
string(REGEX MATCH "VER_MAJOR = ([0-9.]*);" VER_MAJOR_STR "${SRCS_File}")
set(VER_MAJOR ${CMAKE_MATCH_1})

# find VER_MINOR
string(REGEX MATCH "VER_MINOR = ([0-9.]*);" VER_MINOR_STR "${SRCS_File}")
set(VER_MINOR ${CMAKE_MATCH_1})

message(STATUS "FreeImage Version ${VER_MAJOR}.${VER_MINOR}")

# find SRCS
string(REGEX MATCH "SRCS = ([^;]*);" SRCS_STR "${SRCS_File}")
set(SRCS ${CMAKE_MATCH_1})

# FreeImagePlus.DllMain confilct with FreeImage.DllMain
string(REPLACE "FreeImagePlus.cpp" "" SRCS ${SRCS})

string(REPLACE " " ";" SRCS ${SRCS})


# find INCLS
string(REGEX MATCH "INCLS = ([^;]*);" INCLS_STR "${SRCS_File}")
set(INCLS ${CMAKE_MATCH_1})
if(INCLS)
    # remove missing FreeImage.h file
    string(REPLACE "./Dist/FreeImage.h" "" INCLS ${INCLS})
    string(REPLACE " " ";" INCLS ${INCLS})
endif()

# find INCLUDE
string(REGEX MATCH "INCLUDE = ([^;]*)" INCLUDE_STR "${SRCS_File}")
set(INCLUDE ${CMAKE_MATCH_1})
string(REGEX REPLACE " ?-I" ";" INCLUDE ${INCLUDE})

# source_group
foreach(FILE ${SRCS} ${INCLS})
    get_filename_component(PARENT_DIR "${FILE}" PATH)

    # ignore .
    string(REGEX REPLACE "\\.[/\\\\]" "" GROUP "${PARENT_DIR}")
    string(REPLACE "/" "\\" GROUP "${GROUP}")

    # group into "Source Files" and "Header Files"
    if ("${FILE}" MATCHES ".*\\.cp{0,2}")
        set(GROUP "Source Files\\${GROUP}")
    elseif("${FILE}" MATCHES ".*\\.h")
        set(GROUP "Header Files\\${GROUP}")
    endif()

    source_group("${GROUP}" FILES "${FILE}")
endforeach()






# add library
add_library(FreeImage ${SRCS} ${INCLS})

# config library
target_compile_definitions(FreeImage PRIVATE LIBRAW_NODLL OPJ_STATIC DISABLE_PERF_MEASUREMENT)
if(NOT MSVC)
    target_compile_definitions(FreeImage PRIVATE __ANSI__)
endif()

if(BUILD_SHARED_LIBS)
    target_compile_definitions(FreeImage PRIVATE FIP_EXPORTS FREEIMAGE_EXPORTS)
else()
    target_compile_definitions(FreeImage PUBLIC FREEIMAGE_LIB)
endif()

target_include_directories(FreeImage PRIVATE ${INCLUDE})


















#-------------------install  destation ---------------------------
#set( DESTINATION  "../install/")
#set(CMAKE_INSTALL_PREFIX "../install_FreeImage_VC14/")
#          And to the end of the top-level CMakeLists.txt we add:
#install(TARGETS ${PROJECT_NAME} DESTINATION bin)
#install(FILES "${PROJECT_BINARY_DIR}/TutorialConfig.h"  DESTINATION include  )


if ( 0 )
    #
    # Format the project using the `clang-format` target (i.e: cmake --build build --target clang-format)
    #

    #add_clang_format_target()

    #
    # Install library for easy downstream inclusion
    #

    include(GNUInstallDirs)
    install(
        TARGETS
        ${PROJECT_NAME}
        EXPORT
        ${PROJECT_NAME}Targets
        LIBRARY DESTINATION
        ${CMAKE_INSTALL_LIBDIR}
        RUNTIME DESTINATION
        ${CMAKE_INSTALL_BINDIR}
        ARCHIVE DESTINATION
        ${CMAKE_INSTALL_LIBDIR}
        INCLUDES DESTINATION
        include
        PUBLIC_HEADER DESTINATION
        include
        )

    install(
        EXPORT
        ${PROJECT_NAME}Targets
        FILE
        ${PROJECT_NAME}Targets.cmake
        NAMESPACE
        ${PROJECT_NAME}::
        DESTINATION
        ${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME}
        )

    #
    # Add version header
    #

    configure_file(
        ${CMAKE_CURRENT_LIST_DIR}/cmake/version.hpp.in
        include/${PROJECT_NAME_LOWERCASE}/version.hpp
        @ONLY
        )

    install(
        FILES
        ${CMAKE_CURRENT_BINARY_DIR}/include/${PROJECT_NAME_LOWERCASE}/version.hpp
        DESTINATION
        include/${PROJECT_NAME_LOWERCASE}
        )

    #
    # Install the `include` directory
    #

    #install(
    #    DIRECTORY
    ##    include/${PROJECT_NAME_LOWERCASE}
    #    BasicDef/${PROJECT_NAME_LOWERCASE}
    #     exportApi/${PROJECT_NAME_LOWERCASE}
    #     DESTINATION
    #    include
    #    )

    install(
        FILES
        #    include/${PROJECT_NAME_LOWERCASE}
        #  inc/SOIL/image_DXT.h
        #  inc/SOIL/image_helper.h
        #  inc/SOIL/SOIL.h
        #  inc/SOIL/stb_image_aug.h
        #  inc/SOIL/stbi_DDS_aug_c.h
        #  inc/SOIL/stbi_DDS_aug.h
        Source/FreeImage.h
        #  exportApi/${PROJECT_NAME_LOWERCASE}/api_vision.h
        #     exportApi/${PROJECT_NAME_LOWERCASE}
        DESTINATION
        include/
        )


    #verbose_message("Install targets succesfully build. Install with `cmake --build <build_directory> --target install --config <build_config>`.")

    #
    # Quick `ConfigVersion.cmake` creation
    #

    include(CMakePackageConfigHelpers)
    write_basic_package_version_file(
        ${PROJECT_NAME}ConfigVersion.cmake
        VERSION
        ${PROJECT_VERSION}
        COMPATIBILITY
        SameMajorVersion
        )

    configure_package_config_file(
        ${CMAKE_CURRENT_LIST_DIR}/cmake/${PROJECT_NAME}Config.cmake.in
        ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}Config.cmake
        INSTALL_DESTINATION
        ${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME}
        )

    install(
        FILES
        ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}Config.cmake
        ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}ConfigVersion.cmake
        DESTINATION
        ${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME}
        )

    #
    # Generate export header if specified
    #

    if (${PROJECT_NAME}_GENERATE_EXPORT_HEADER)
        include(GenerateExportHeader)
        generate_export_header(${PROJECT_NAME})
        install(
            FILES
            ${PROJECT_BINARY_DIR}/${PROJECT_NAME_LOWERCASE}_export.h
            DESTINATION
            include
            )
        message(STATUS "Generated the export header `${PROJECT_NAME_LOWERCASE}_export.h` and installed it.")
    endif ()

    message(STATUS "Finished building requirements for installing the package.\n")

    #
    # Unit testing setup
    #
    if (0)
        if (${PROJECT_NAME}_ENABLE_UNIT_TESTING)
            enable_testing()
            message(STATUS "Build unit tests for the project. Tests should always be found in the test folder\n")
            add_subdirectory(test)
        endif ()
    endif ()


endif ()







#//-------------------------------------------------------------------------

target_include_directories(FreeImage PRIVATE  ${CMAKE_SOURCE_DIR}/Source )
set_target_properties(FreeImage PROPERTIES PUBLIC_HEADER ${CMAKE_SOURCE_DIR}/Source/FreeImage.h)



#//---MyMath---------------------------------------------
# 写入库的版本信息
# install
include(CMakePackageConfigHelpers)
write_basic_package_version_file(
    FreeImageConfigVersion.cmake
    VERSION ${PACKAGE_VERSION}
    COMPATIBILITY AnyNewerVersion
)

# 将库文件，可执行文件，头文件安装到指定目录
install(TARGETS FreeImage
    EXPORT FreeImageTargets
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    RUNTIME DESTINATION bin
    PUBLIC_HEADER DESTINATION include
)

# 将库的相关信息输出为MyMathConfig.cmake，供find_package查找
install(EXPORT FreeImageTargets
    FILE FreeImageTargets.cmake
    NAMESPACE FreeImage::
    DESTINATION lib/cmake/FreeImage
)

configure_file( FreeImageConfig.cmake.in  FreeImage/FreeImageConfig.cmake @ONLY)
install(FILES "${CMAKE_CURRENT_BINARY_DIR}/FreeImage/FreeImageConfig.cmake"
    "${CMAKE_CURRENT_BINARY_DIR}/FreeImageConfigVersion.cmake"
    DESTINATION lib/cmake/FreeImage
)


