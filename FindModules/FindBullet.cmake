SET (BULLET_PATHS    
   $ENV{PROGRAMFILES}/Bullet
   $ENV{BULLETDIR}
   $ENV{BULLET_DIR}
)

SET (WANTED_MODULE_NAME     BulletMath)
SET (WANTED_INCLUDES        "bullet/LinearMath/btVector3.h")
SET (WANTED_LIBRARIES       bulletmath)
SET (WANTED_INCLUDES_PATH   ${BULLET_PATHS}) 
SET (WANTED_LIBRARIES_PATH  ${BULLET_PATHS}) 
INCLUDE (FindCommonModule)

SET (WANTED_MODULE_NAME     BulletCollision)
SET (WANTED_INCLUDES        "bullet/btBulletCollisionCommon.h")
SET (WANTED_LIBRARIES       bulletcollision)
SET (WANTED_INCLUDES_PATH   ${BULLET_PATHS}) 
SET (WANTED_LIBRARIES_PATH  ${BULLET_PATHS}) 
INCLUDE (FindCommonModule)

SET (WANTED_MODULE_NAME     BulletDynamics)
SET (WANTED_INCLUDES        "bullet/btBulletDynamicsCommon.h")
SET (WANTED_LIBRARIES       bulletdynamics)
SET (WANTED_INCLUDES_PATH   ${BULLET_PATHS}) 
SET (WANTED_LIBRARIES_PATH  ${BULLET_PATHS}) 
INCLUDE (FindCommonModule)

# setup variables
SET (BULLET_FOUND 
    ${BULLETMATH_FOUND} 
    AND ${BULLETCOLLISION_FOUND}
    AND ${BULLETDYNAMICS_FOUND}
)

SET (Bullet_INCLUDE_DIR ${BulletMath_INCLUDE_DIR})

SET (Bullet_LIBRARY
    ${BulletMath_LIBRARY}
    ${BulletCollision_LIBRARY}
    ${BulletDynamics_LIBRARY}
)

SET (Bullet_LIBRARIES 
    ${BulletMath_LIBRARIES}
    ${BulletCollision_LIBRARIES}
    ${BulletDynamics_LIBRARIES}
)

