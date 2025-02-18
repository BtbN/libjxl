# Copyright (c) the JPEG XL Project Authors. All rights reserved.
#
# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.

include(jxl_lists.cmake)

# This is the Google benchmark project (https://github.com/google/benchmark).
find_package(benchmark QUIET)

if(benchmark_FOUND)
  # Compiles all the benchmark files into a single binary. Individual benchmarks
  # can be run with --benchmark_filter.
  add_executable(jxl_gbench "${JPEGXL_INTERNAL_GBENCH_SOURCES}" gbench_main.cc)

  target_compile_definitions(jxl_gbench PRIVATE
    -DTEST_DATA_PATH="${JPEGXL_TEST_DATA_PATH}")
  target_link_libraries(jxl_gbench
    jxl_extras-internal
    jxl-internal
    benchmark::benchmark
  )
endif() # benchmark_FOUND
