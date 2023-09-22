cmake_minimum_required(VERSION 3.15)
project(CrowSample)

set(INCLUDE_PATHS /app/boost_1_83_0 /app/crow/include)

add_executable(CrowSample main.cpp)

target_include_directories(CrowSample PUBLIC ${INCLUDE_PATHS})
