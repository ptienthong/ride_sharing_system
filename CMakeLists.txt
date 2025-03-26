cmake_minimum_required(VERSION 3.10)
#list( APPEND CMAKE_CXX_FLAGS "-std=c++0x ${CMAKE_CXX_FLAGS} -g -ftest-coverage -fprofile-arcs")
# Set the C++ standard to C++14
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Add debugging and coverage flags
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g -ftest-coverage -fprofile-arcs")
project(ride_sharing_system)


include_directories(include)

add_executable(ride_system src/main.cpp src/ridesystem.cpp)
