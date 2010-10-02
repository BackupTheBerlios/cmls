FIND_PACKAGE ( OpenGL       REQUIRED )
FIND_PACKAGE ( Glew   		REQUIRED )

SET (WANTED_MODULE_NAME     SimpleGL)
SET (WANTED_INCLUDES        sgl/Device.h)
SET (WANTED_LIBRARIES       sgl)
SET (WANTED_DEPENDENCIES    OpenGL Glew)
INCLUDE (FindCommonModule)
