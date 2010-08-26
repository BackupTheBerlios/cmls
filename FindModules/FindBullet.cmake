SET (BULLET_PATHS    
   $ENV{PROGRAMFILES}/Bullet
   $ENV{PROGRAMFILES}/BULLET_PHYSICS
   $ENV{BULLETDIR}
   $ENV{BULLET_DIR}
)

IF (WIN32)
    SET (INCLUDE_PATH_PREFIX "")
ELSE (WIN32)
    SET (INCLUDE_PATH_PREFIX "BULLET_PHYSICS/")
ENDIF (WIN32)

SET (WANTED_MODULE_NAME     BulletMath)
SET (WANTED_INCLUDES        "${INCLUDE_PATH_PREFIX}LinearMath/btVector3.h")
SET (WANTED_LIBRARIES       linearmath bulletmath LinearMath)
SET (WANTED_INCLUDES_PATH   ${BULLET_PATHS}) 
SET (WANTED_LIBRARIES_PATH  ${BULLET_PATHS}) 
INCLUDE (FindCommonModule)

SET (WANTED_MODULE_NAME     BulletCollision)
SET (WANTED_INCLUDES        "${INCLUDE_PATH_PREFIX}btBulletCollisionCommon.h")
SET (WANTED_LIBRARIES       bulletcollision BulletCollision)
SET (WANTED_INCLUDES_PATH   ${BULLET_PATHS}) 
SET (WANTED_LIBRARIES_PATH  ${BULLET_PATHS}) 
INCLUDE (FindCommonModule)

SET (WANTED_MODULE_NAME     BulletDynamics)
SET (WANTED_INCLUDES        "${INCLUDE_PATH_PREFIX}btBulletDynamicsCommon.h")
SET (WANTED_LIBRARIES       bulletdynamics BulletDynamics)
SET (WANTED_INCLUDES_PATH   ${BULLET_PATHS}) 
SET (WANTED_LIBRARIES_PATH  ${BULLET_PATHS}) 
INCLUDE (FindCommonModule)

SET (WANTED_MODULE_NAME     BulletFileLoader)
SET (WANTED_INCLUDES        "${INCLUDE_PATH_PREFIX}/Extras/Serialize/BulletFileLoader/btBulletFile.h")
SET (WANTED_LIBRARIES       bulletfileloader BulletFileLoader)
SET (WANTED_INCLUDES_PATH   ${BULLET_PATHS}) 
SET (WANTED_LIBRARIES_PATH  ${BULLET_PATHS}) 
INCLUDE (FindCommonModule)

SET (WANTED_MODULE_NAME     BulletWorldImporter)
SET (WANTED_INCLUDES        "${INCLUDE_PATH_PREFIX}/Extras/Serialize/BulletWorldImporter/btBulletWorldImporter.h")
SET (WANTED_LIBRARIES       bulletworldimporter BulletWorldImporter)
SET (WANTED_INCLUDES_PATH   ${BULLET_PATHS}) 
SET (WANTED_LIBRARIES_PATH  ${BULLET_PATHS}) 
INCLUDE (FindCommonModule)

# setup variables
IF ( BULLETMATH_FOUND AND BULLETCOLLISION_FOUND AND BULLETDYNAMICS_FOUND )
    SET (BULLET_FOUND TRUE)
ENDIF ( BULLETMATH_FOUND AND BULLETCOLLISION_FOUND AND BULLETDYNAMICS_FOUND )

# correct include path 
SET (Bullet_INCLUDE_DIR ${BulletMath_INCLUDE_DIR}/${INCLUDE_PATH_PREFIX})

SET (Bullet_LIBRARY
    ${BulletDynamics_LIBRARY}
    ${BulletCollision_LIBRARY}
    ${BulletMath_LIBRARY}
)

SET (Bullet_LIBRARIES)

IF (BULLETWORLDIMPORTER_FOUND AND BULLETFILELOADER_FOUND)
	LIST (APPEND Bullet_LIBRARIES
		${BulletWorldImporter_LIBRARIES}
		${BulletFileLoader_LIBRARIES}
	)
ENDIF (BULLETWORLDIMPORTER_FOUND AND BULLETFILELOADER_FOUND)

LIST (APPEND Bullet_LIBRARIES 
    ${BulletDynamics_LIBRARIES}
    ${BulletCollision_LIBRARIES}
    ${BulletMath_LIBRARIES}
)
