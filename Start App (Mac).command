#!/bin/bash

# JSON Formatter - Startup Script (macOS)
# Double-click this file to set up and launch the app.

cd "$(dirname "$0")"

echo "================================================"
echo "  JSON Formatter - Startup Script (macOS)"
echo "================================================"
echo

# ---------------------------------------------------------
# Function: pause and keep window open on error
# ---------------------------------------------------------
fail_and_wait () {
    echo
    echo "================================================"
    echo "  The script stopped because of an error above."
    echo "================================================"
    read -n 1 -s -r -p "Press any key to close this window..."
    echo
    exit 1
}

# ---------------------------------------------------------
# 1. Verify Python is installed
# ---------------------------------------------------------
echo "[1/6] Checking for Python..."
if command -v python3 >/dev/null 2>&1; then
    PYTHON_CMD=python3
elif command -v python >/dev/null 2>&1; then
    PYTHON_CMD=python
else
    echo
    echo "ERROR: Python was not found on this system."
    echo "Please install Python 3.9 or later from https://www.python.org/downloads/"
    fail_and_wait
fi
$PYTHON_CMD --version
echo "Python found successfully."
echo

# ---------------------------------------------------------
# 2. Create a virtual environment if necessary
# ---------------------------------------------------------
echo "[2/6] Checking for virtual environment..."
if [ ! -f "venv/bin/activate" ]; then
    echo "Virtual environment not found. Creating one now..."
    $PYTHON_CMD -m venv venv || fail_and_wait
    echo "Virtual environment created."
else
    echo "Virtual environment already exists."
fi
echo

# ---------------------------------------------------------
# 3. Activate the virtual environment
# ---------------------------------------------------------
echo "[3/6] Activating virtual environment..."
source venv/bin/activate || fail_and_wait
echo "Virtual environment activated."
echo

# ---------------------------------------------------------
# 4. Install missing dependencies
# ---------------------------------------------------------
echo "[4/6] Checking dependencies..."
if ! python -c "import customtkinter" >/dev/null 2>&1; then
    echo "customtkinter not found. Installing dependencies..."
    if [ -f "requirements.txt" ]; then
        pip install -r requirements.txt || fail_and_wait
    else
        pip install customtkinter || fail_and_wait
    fi
else
    echo "Dependencies already satisfied."
fi
echo

# ---------------------------------------------------------
# 5. Verify the .env file (informational only - not required by this app)
# ---------------------------------------------------------
echo "[5/6] Checking for .env file..."
if [ -f ".env" ]; then
    echo ".env file found."
else
    echo "No .env file found. This app does not currently require one, so this is OK."
fi
echo

# ---------------------------------------------------------
# 6. Launch the application
# ---------------------------------------------------------
echo "[6/6] Launching JSON Formatter..."
echo
if [ -f "JSON_Formatter.py" ]; then
    python "JSON_Formatter.py"
    APP_EXIT_CODE=$?
else
    echo
    echo "ERROR: JSON_Formatter.py was not found in this folder."
    fail_and_wait
fi

if [ "$APP_EXIT_CODE" -ne 0 ]; then
    fail_and_wait
fi

echo
echo "App closed normally. You can close this window."
read -n 1 -s -r -p "Press any key to close..."
echo
