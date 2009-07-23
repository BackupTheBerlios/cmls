# Find dependencies
FIND_PACKAGE ( Boost 1.36.0 	REQUIRED	COMPONENTS signals thread )
FIND_PACKAGE ( XML++            REQUIRED )
FIND_PACKAGE ( SimpleGL         REQUIRED )
FIND_PACKAGE ( SDL       		REQUIRED )

# Find SlonEngine
SET (WANTED_MODULE_NAME     SlonEngine)
SET (WANTED_INCLUDES        SlonEngine/Engine.h)
SET (WANTED_LIBRARIES       SlonEngine)
SET (WANTED_DEPENDENCIES    Boost XML++ SimpleGL SDL)
INCLUDE (FindCommonModule)
