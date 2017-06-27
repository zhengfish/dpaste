IF(glibmm_FIND_REQUIRED)
    FIND_PACKAGE(glib REQUIRED)
    FIND_PACKAGE(sigc++ REQUIRED)
ELSE(glibmm_FIND_REQUIRED)
    FIND_PACKAGE(glib)
    FIND_PACKAGE(sigc++)
ENDIF(glibmm_FIND_REQUIRED)

IF(GLIB_FOUND)

    #use pkg-config
    FIND_PACKAGE(PkgConfig)
    PKG_CHECK_MODULES(PC_GLIBMM glibmm-2.4)

    FIND_PATH(glibmm_INCLUDE_DIR NAMES glibmm/main.h HINTS ${PC_GLIBMM_INCLUDEDIR} ${PC_GLIBMM_INCLUDE_DIRS})
    FIND_PATH(glibmm_config_INCLUDE_DIR NAMES glibmmconfig.h HINTS ${PC_GLIBMM_INCLUDEDIR} ${PC_GLIBMM_INCLUDE_DIRS})
    FIND_LIBRARY(glibmm_LIBRARY NAMES glibmm glibmm-2.4 HINTS ${PC_GLIBMM_LIBDIR} ${PC_GLIBMM_LIBRARY_DIRS})

    SET(glibmm_LIBRARIES ${glibmm_LIBRARY} ${PC_GLIBMM_PKGCONF_LIBRARIES} ${glib_LIBRARIES} ${sigc++_LIBRARIES})
    SET(glibmm_INCLUDE_DIRS ${glibmm_INCLUDE_DIR} ${glibmm_config_INCLUDE_DIR} ${PC_GLIBMM_PKGCONF_INCLUDE_DIRS} ${glib_INCLUDE_DIRS} ${sigc++_INCLUDE_DIRS})

ENDIF(GLIB_FOUND)

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(glibmm DEFAULT_MSG glibmm_LIBRARY glibmm_INCLUDE_DIR)

MARK_AS_ADVANCED(glibmm_INCLUDE_DIR glibmm_config_INCLUDE_DIR glibmm_LIBRARY)