SET ( SIMPLE_GL_PATH
	${SIMPLE_GL_PATH}	
	"$ENV{SIMPLE_GL_DIR}"
	"$ENV{PROGRAMFILES}/SimpleGL"
	"${3RD_PARTY_DIRECTORY}/SimpleGL"	
)

# simple gl
FIND_PATH ( 
	SIMPLE_GL_INCLUDE_DIR
	sgl/Device.h
	PATH_SUFFIXES "include" "SimpleGL"
	PATHS ${SIMPLE_GL_PATH}	
)

FIND_LIBRARY ( 
	SIMPLE_GL_LIBRARY_DEBUG
	NAMES sgld
	PATH_SUFFIXES "lib/" "lib64/"		
	PATHS ${SIMPLE_GL_PATH}
)

FIND_LIBRARY ( 
	SIMPLE_GL_LIBRARY_RELEASE
	NAMES sgl
	PATH_SUFFIXES "lib/" "lib64/"		
	PATHS ${SIMPLE_GL_PATH}
)
		
IF ( NOT SIMPLE_GL_LIBRARY_RELEASE AND SIMPLE_GL_LIBRARY_DEBUG )
	SET ( SIMPLE_GL_LIBRARY_RELEASE ${SIMPLE_GL_LIBRARY_DEBUG} )
ENDIF ( NOT SIMPLE_GL_LIBRARY_RELEASE AND SIMPLE_GL_LIBRARY_DEBUG )

IF ( NOT SIMPLE_GL_LIBRARY_DEBUG AND SIMPLE_GL_LIBRARY_RELEASE )
	SET ( SIMPLE_GL_LIBRARY_DEBUG ${SIMPLE_GL_LIBRARY_RELEASE} )
ENDIF ( NOT SIMPLE_GL_LIBRARY_DEBUG AND SIMPLE_GL_LIBRARY_RELEASE )

SET( SIMPLE_GL_LIBRARY ${SIMPLE_GL_LIBRARY_RELEASE} )
SET( SIMPLE_GL_LIBRARIES 
	debug ${SIMPLE_GL_LIBRARY_DEBUG}	optimized ${SIMPLE_GL_LIBRARY_RELEASE}
)

IF ( SIMPLE_GL_INCLUDE_DIR AND SIMPLE_GL_LIBRARY )
	SET ( SIMPLE_GL_FOUND YES )
	MESSAGE( STATUS "Simple gl found: ${SIMPLE_GL_LIBRARY}" )
ENDIF ( SIMPLE_GL_INCLUDE_DIR AND SIMPLE_GL_LIBRARY ) 
 
