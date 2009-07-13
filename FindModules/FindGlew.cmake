SET ( GLEW_PATH
	${GLEW_PATH}
	"$ENV{PROGRAMFILES}/glew"
)

# glew
FIND_PATH ( 
	GLEW_INCLUDE_DIR
	GL/glew.h
	PATH_SUFFIXES "include"
	PATHS ${GLEW_PATH} "C:/Program Files/glew/include"
)

IF (GLEW_USE_STATIC_LIB)
	SET (GLEW_LIB_NAMES "GLEWs" "glew32s")
ELSE (GLEW_USE_STATIC_LIB)
	SET (GLEW_LIB_NAMES "GLEW" "glew32")
ENDIF (GLEW_USE_STATIC_LIB)
	

FIND_LIBRARY ( 
	GLEW_LIBRARY_STATIC
	NAMES "GLEWs" "glew32s"
	PATH_SUFFIXES "lib" "lib64"
	PATHS ${GLEW_PATH}	
)

FIND_LIBRARY ( 
	GLEW_LIBRARY
	NAMES "GLEW" "glew32"
	PATH_SUFFIXES "lib" "lib64"
	PATHS ${GLEW_PATH}	
)

IF (GLEW_INCLUDE_DIR AND GLEW_LIBRARY_STATIC OR GLEW_LIBRARY)
	SET (GLEW_FOUND TRUE)
ENDIF (GLEW_INCLUDE_DIR AND GLEW_LIBRARY_STATIC OR GLEW_LIBRARY)

IF (GLEW_USE_STATIC_LIB AND GLEW_FOUND)
	IF (GLEW_LIBRARY_STATIC)
		SET (GLEW_LIBRARY ${GLEW_LIBRARY_STATIC})
	ELSE (GLEW_LIBRARY_STATIC)
		MESSAGE (STATUS "GLEW_USE_STATIC_LIB is set, but static glew replacement not found. Using dynamic glew instead")
	ENDIF (GLEW_LIBRARY_STATIC)
ENDIF (GLEW_USE_STATIC_LIB AND GLEW_FOUND)

IF (GLEW_FOUND AND NOT GLEW_FIND_QUIETLY)
	MESSAGE(STATUS "Found glew: ${GLEW_LIBRARY}")
ENDIF (GLEW_FOUND AND NOT GLEW_FIND_QUIETLY)

