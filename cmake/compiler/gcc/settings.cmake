# Set build-directive (used in core to tell which buildtype we used)
target_compile_definitions(trinity-compile-option-interface
  INTERFACE
    -D_BUILD_DIRECTIVE="$<CONFIG>")

set(GCC_EXPECTED_VERSION 6.3.0)

if(CMAKE_CXX_COMPILER_VERSION VERSION_LESS GCC_EXPECTED_VERSION)
  message(FATAL_ERROR "GCC: TrinityCore requires version ${GCC_EXPECTED_VERSION} to build but found ${CMAKE_CXX_COMPILER_VERSION}")
endif()

if(PLATFORM EQUAL 32)
  # Required on 32-bit systems to enable SSE2 (standard on x64)
  target_compile_options(trinity-compile-option-interface
    INTERFACE
      -msse2
      -mfpmath=sse)
endif()
target_compile_definitions(trinity-compile-option-interface
  INTERFACE
    -DHAVE_SSE2
    -D__SSE2__)
message(STATUS "GCC: SFMT enabled, SSE2 flags forced")

# C++20 deprecates (but still permits) implicit arithmetic between unrelated enum types and
# between enums and floating-point types (P1120R0), and keeps warning on a handful of other
# constructs ([[deprecated]] attributes, old-style deprecated declarations) that were silently
# fine pre-C++20. This is pervasive in ported boss/spell script content across every expansion
# (Northrend/Outland/Draenor/Pandaria scripts, spell_dh.cpp, spell_druid.cpp, ...) and is not
# itself a bug - it accounts for 158 of 198 warnings seen with a clean -DWITH_WARNINGS=0 build.
# Suppressed unconditionally (not just under WITH_WARNINGS) so a WITH_WARNINGS=1 "hunt for new
# issues" build isn't buried in this known, understood noise either.
target_compile_options(trinity-compile-option-interface
  INTERFACE
    -Wno-deprecated-enum-enum-conversion
    -Wno-deprecated-enum-float-conversion
    -Wno-deprecated-declarations
    -Wno-deprecated)

if( WITH_WARNINGS )
  target_compile_options(trinity-warning-interface
    INTERFACE
      -W
      -Wall
      -Wextra
      -Winit-self
      -Winvalid-pch
      -Wfatal-errors
      -Woverloaded-virtual)

  message(STATUS "GCC: All warnings enabled")
endif()

if( WITH_COREDEBUG )
  target_compile_options(trinity-compile-option-interface
    INTERFACE
      -g3)

  message(STATUS "GCC: Debug-flags set (-g3)")
endif()

if (BUILD_SHARED_LIBS)
  target_compile_options(trinity-compile-option-interface
    INTERFACE
      -fPIC
      -Wno-attributes)

  target_compile_options(trinity-hidden-symbols-interface
    INTERFACE
      -fvisibility=hidden)

  # Should break the build when there are TRINITY_*_API macros missing
  # but it complains about missing references in precompiled headers.
  # set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wl,--no-undefined")
  # set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wl,--no-undefined")

  message(STATUS "GCC: Enabled shared linking")
endif()
