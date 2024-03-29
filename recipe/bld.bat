:: MSVC is preferred.
set CC=cl.exe
set CXX=cl.exe

mkdir build_src
cd build_src
cmake ^
    -G "Ninja" ^
    -DALLOW_IN_SOURCE_BUILD=ON ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DBUILD_SHARED_LIBS=ON ^
    -DJAS_STDC_VERSION=201112L ^
    -DCMAKE_INSTALL_SYSTEM_RUNTIME_LIBS_SKIP=ON ^
    -DJAS_ENABLE_AUTOMATIC_DEPENDENCIES=False ^
    %SRC_DIR%
if errorlevel 1 exit 1

:: Build.
cmake --build . --config Release
if errorlevel 1 exit 1

:: Install.
cmake --build . --config Release --target install
if errorlevel 1 exit 1
