cmake_minimum_required(VERSION 3.20)
project(material_benchmarks LANGUAGES CXX)

set(CMAKE_EXPORT_COMPILE_COMMANDS 1)

add_compile_definitions(_SILENCE_ALL_CXX17_DEPRECATION_WARNINGS)

set(CMAKE_CXX_STANDARD 17)

if (ENABLE_ASAN)
  add_link_options(-fsanitize=address)
  add_compile_options(-fsanitize=address)
endif()

add_subdirectory(enoki)

file(GLOB_RECURSE cxx_sources ${PROJECT_SOURCE_DIR}/src/*.cpp ${PROJECT_SOURCE_DIR}/inc/*.hpp)
add_library(materials ${cxx_sources})

if (ENABLE_CUDA)
  enable_language(CUDA)
  file(GLOB_RECURSE cu_sources ${PROJECT_SOURCE_DIR}/src/*.cu)
  target_sources(materials PUBLIC ${cu_sources})
  #set_target_properties(materials PROPERTIES CUDA_SEPARABLE_COMPILATION ON)
endif()

target_include_directories(materials PUBLIC inc)
target_include_directories(materials SYSTEM PUBLIC enoki/include)
target_compile_options(materials PUBLIC ${ENOKI_NATIVE_FLAGS}) # for enabling SIMD instructions
#target_compile_options(materials PUBLIC -save-temps) # for viewing disassembly

add_executable(perf_test main.cpp)
target_link_libraries(perf_test PUBLIC materials)

if (ENABLE_CUDA) 
  add_executable(cuda_perf_test main.cu)
  target_link_libraries(cuda_perf_test PUBLIC materials)
  set_target_properties(cuda_perf_test PROPERTIES CUDA_SEPARABLE_COMPILATION ON)
  target_compile_options(cuda_perf_test PUBLIC --ptxas-options=-v)
endif()

add_executable(input_file material_from_input_file.cpp)
target_link_libraries(input_file PUBLIC materials)
