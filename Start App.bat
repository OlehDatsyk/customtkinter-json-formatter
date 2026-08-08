@echo off
setlocal enabledelayedexpansion
title JSON Formatter - Startup
cd /d "%~dp0"

echo =======================================================================
echo   JSON Formatter - Startup Script (Windows) (Was made by Oleh Datsyk)
echo =======================================================================
echo.

REM ---------------------------------------------------------
REM 1. Verify Python is installed
REM ---------------------------------------------------------
echo [1/6] Checking for Python...
where python >nul 2>nul
if errorlevel 1 (
    echo.
    echo ERROR: Python was not found on this system.
    echo Please install Python 3.9 or later from https://www.python.org/downloads/
    echo IMPORTANT: During installation, check the box "Add Python to PATH".
    echo.
    pause
    exit /b 1
)
python --version
echo Python found successfully.
echo.

REM ---------------------------------------------------------
REM 2. Create a virtual environment if necessary
REM ---------------------------------------------------------
echo [2/6] Checking for virtual environment...
if not exist "venv\Scripts\activate.bat" (
    echo Virtual environment not found. Creating one now...
    python -m venv venv
    if errorlevel 1 (
        echo.
        echo ERROR: Failed to create the virtual environment.
        pause
        exit /b 1
    )
    echo Virtual environment created.
) else (
    echo Virtual environment already exists.
)
echo.

REM ---------------------------------------------------------
REM 3. Activate the virtual environment
REM ---------------------------------------------------------
echo [3/6] Activating virtual environment...
call "venv\Scripts\activate.bat"
if errorlevel 1 (
    echo.
    echo ERROR: Failed to activate the virtual environment.
    pause
    exit /b 1
)
echo Virtual environment activated.
echo.

REM ---------------------------------------------------------
REM 4. Install missing dependencies
REM ---------------------------------------------------------
echo [4/6] Checking dependencies...
python -c "import customtkinter" >nul 2>nul
if errorlevel 1 (
    echo customtkinter not found. Installing dependencies...
    if exist "requirements.txt" (
        pip install -r requirements.txt
    ) else (
        pip install customtkinter
    )
    if errorlevel 1 (
        echo.
        echo ERROR: Failed to install dependencies. Check your internet connection.
        pause
        exit /b 1
    )
) else (
    echo Dependencies already satisfied.
)
echo.

REM ---------------------------------------------------------
REM 5. Verify the .env file (informational only - not required by this app)
REM ---------------------------------------------------------
echo [5/6] Checking for .env file...
if exist ".env" (
    echo .env file found.
) else (
    echo No .env file found. This app does not currently require one, so this is OK.
)
echo.

REM ---------------------------------------------------------
REM 6. Launch the application
REM ---------------------------------------------------------
echo [6/6] Launching JSON Formatter...
echo.
if exist "JSON_Formatter.py" (
    python "JSON_Formatter.py"
) else (
    echo.
    echo ERROR: JSON_Formatter.py was not found in this folder.
    pause
    exit /b 1
)

if errorlevel 1 (
    echo.
    echo ================================================
    echo   The application closed with an error.
    echo   See the message above for details.
    echo ================================================
    pause
    exit /b 1
)

endlocal
