@echo off
setlocal enabledelayedexpansion

:: Set console colors
color 0F
title Registry Uninstaller

:: Display header
echo.
echo  =======================================================
echo   WINDOWS REGISTRY UNINSTALLER
echo  =======================================================
echo.
echo    This script creates an uninstaller for registry edits
echo    contained in .reg files. Just drop a .reg file onto
echo    this script or let it search the current directory.
echo.
echo  =======================================================
echo.

:: Check for drag and drop
if "%~1" neq "" (
    set "inputFile=%~1"
    echo Processing dropped file: "!inputFile!"
) else (
    :: Find first .reg file in current directory
    set "inputFile="
    for %%i in (*.reg) do (
        if not defined inputFile set "inputFile=%%i"
    )
    if not defined inputFile (
        echo No .reg files found in this directory.
        echo Please drag a .reg file onto this script.
        goto end
    )
    echo Found registry file: "!inputFile!"
)

:: Create uninstaller file
set "outputFile=uninstaller.reg"

echo Creating uninstaller: "!outputFile!"...
echo.

:: Write registry header
echo Windows Registry Editor Version 5.00 > "!outputFile!"
echo. >> "!outputFile!"

:: Process registry file
set "count=0"
for /f "usebackq delims=" %%a in ("!inputFile!") do (
    set "line=%%a"
    :: Skip comments and empty lines
    if not "!line:~0,1!"==";" (
        if not "!line!"=="" (
            :: Extract registry paths
            if "!line:~0,1!"=="[" (
                set "keyPath=!line:~1,-1!"
                echo [-!keyPath!] >> "!outputFile!"
                set /a "count+=1"
                echo Found registry key: !keyPath!
            )
        )
    )
)

:: Results
echo.
if !count! gtr 0 (
    echo Successfully created uninstaller with !count! registry entries.
    echo.
    echo To uninstall:
    echo   1. Double-click "!outputFile!"
    echo   2. Confirm registry changes when prompted
    echo   3. Restart your computer to complete uninstallation
) else (
    echo No valid registry keys found in "!inputFile!"
    del "!outputFile!" >nul 2>&1
)

:end
echo.
echo Press any key to exit...
pause >nul
