cmake_minimum_required(VERSION 3.8)
project(material_benchmarks LANGUAGES CXX)

set(CMAKE_EXPORT_COMPILE_COMMANDS 1)

add_compile_definitions(_SILENCE_ALL_CXX17_DEPRECATION_WARNINGS)

set(CMAKE_CXX_STANDARD 17)

if (ENABLE_ASAN)
  add_link_options(-fsanitize=address)
  add_compile_options(-fsanitize=address)
endif()

add_subdirectory(enoki)

file(GLOB_RECURSE sources ${PROJECT_SOURCE_DIR}/src/*.cpp ${PROJECT_SOURCE_DIR}/inc/*.hpp)
add_library(materials ${sources})
target_include_directories(materials PUBLIC inc enoki/include)
target_compile_options(materials PUBLIC ${ENOKI_NATIVE_FLAGS}) # for enabling SIMD instructions
target_compile_options(materials PUBLIC -save-temps) # for viewing disassembly
if (ENABLE_PCH)
  add_library(pch INTERFACE)
  target_precompile_headers(pch INTERFACE ${PROJECT_SOURCE_DIR}/pch.hpp)
  target_link_libraries(materials PUBLIC pch)
endif()

add_executable(perf_test main.cpp)
target_link_libraries(perf_test PUBLIC materials)

