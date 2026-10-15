# Set build-directive (used in core to tell which buildtype we used)
target_compile_definitions(trinity-compile-option-interface
  INTERFACE
    -D_BUILD_DIRECTIVE="$<CONFIG>")

# See cmake/compiler/gcc/settings.cmake for the full rationale: C++20 deprecates implicit
# enum<->enum and enum<->float arithmetic (P1120R0); this is pervasive in old ported script
# content and is not itself a bug. Suppressed unconditionally, same as the GCC settings.
target_compile_options(trinity-compile-option-interface
  INTERFACE
    -Wno-deprecated-enum-enum-conversion
    -Wno-deprecated-enum-float-conversion
    -Wno-deprecated-declarations
    -Wno-deprecated)

if(WITH_WARNINGS)
  target_compile_options(trinity-warning-interface
    INTERFACE
      -W
      -Wall
      -Wextra
      -Winit-self
      -Wfatal-errors
      -Wno-mismatched-tags
      -Woverloaded-virtual)

  message(STATUS "Clang: All warnings enabled")
endif()

if(WITH_COREDEBUG)
  target_compile_options(trinity-compile-option-interface
    INTERFACE
      -g3)

  message(STATUS "Clang: Debug-flags set (-g3)")
endif()

# -Wno-narrowing needed to suppress a warning in g3d
# -Wno-deprecated-register is needed to suppress 185 gsoap warnings on Unix systems.
target_compile_options(trinity-compile-option-interface
  INTERFACE
    -Wno-narrowing
    -Wno-deprecated-register)

if (BUILD_SHARED_LIBS)
  # -fPIC is needed to allow static linking in shared libs.
  # -fvisibility=hidden sets the default visibility to hidden to prevent exporting of all symbols.
  target_compile_options(trinity-compile-option-interface
    INTERFACE
      -fPIC)

  target_compile_options(trinity-hidden-symbols-interface
    INTERFACE
      -fvisibility=hidden)

  # --no-undefined to throw errors when there are undefined symbols
  # (caused through missing TRINITY_*_API macros).
  set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} --no-undefined")

  message(STATUS "Clang: Disallow undefined symbols")
endif()
