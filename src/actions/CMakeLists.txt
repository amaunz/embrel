SET(CMAKE_MODULE_PATH  ${CMAKE_MODULE_PATH} ${CMAKE_SOURCE_DIR}/../CMakeModules )

# const-char* -> char* conversion, needed for Nana
IF( CMAKE_COMPILER_IS_GNUCXX )
	SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-write-strings -Wall" )
ENDIF()

include_directories( 
	. 
	${CMAKE_SOURCE_DIR}/configuration
	${CMAKE_SOURCE_DIR}/graphs
	${CMAKE_SOURCE_DIR}/tools
	${CMAKE_SOURCE_DIR}/third_party
)


add_library( actions SHARED 
    action_cfg.cpp 
	action.hpp action.cpp
    count.hpp count.cpp
	code_data_gen.cpp
)

target_link_libraries( actions gnuplotcpp erltools ${MATIO_LIBRARIES})
