# INSTRUCTION.md - Complete Beginner's Guide

This guide assumes you have **never used Python, Git, Visual Studio Code, a terminal, or a virtual environment before**. Follow it from top to bottom and you will end up with a working JSON Formatter app on your computer.

---

## Table of Contents

1. [Installing Python](#1-installing-python)
2. [Installing Git](#2-installing-git)
3. [Installing Visual Studio Code](#3-installing-visual-studio-code)
4. [Recommended VS Code Extensions](#4-recommended-vs-code-extensions)
5. [Opening the Project](#5-opening-the-project)
6. [Creating a Virtual Environment](#6-creating-a-virtual-environment)
7. [Activating the Virtual Environment](#7-activating-the-virtual-environment)
8. [Installing Dependencies](#8-installing-dependencies)
9. [The .env File](#9-the-env-file)
10. [Running the Application](#10-running-the-application)
11. [Testing the Application](#11-testing-the-application)
12. [Using Every Feature](#12-using-every-feature)
13. [Troubleshooting](#13-troubleshooting)
14. [FAQ](#14-faq)
15. [Common Mistakes](#15-common-mistakes)
16. [Security Recommendations](#16-security-recommendations)
17. [Next Learning Steps](#17-next-learning-steps)

---

## 1. Installing Python

Python is the programming language this app is written in.

1. Go to [https://www.python.org/downloads/](https://www.python.org/downloads/).
2. Click the big **Download Python 3.x.x** button (any version 3.9 or newer works).
3. Run the installer.
   - **Windows:** On the first screen, check the box that says **"Add Python to PATH"** before clicking **Install Now**. This step is easy to miss and causes most beginner problems.
   - **macOS:** Run the downloaded `.pkg` file and follow the prompts (Continue -> Continue -> Agree -> Install).
4. When installation finishes, verify it worked:
   - **Windows:** Open the **Start Menu**, type `cmd`, press Enter to open Command Prompt, then type:
     ```
     python --version
     ```
   - **macOS:** Open **Terminal** (press `Cmd + Space`, type "Terminal", press Enter), then type:
     ```
     python3 --version
     ```
   You should see something like `Python 3.11.5`. If you see an error, restart your computer and try again.

## 2. Installing Git

Git lets you download ("clone") and manage the project's code.

1. Go to [https://git-scm.com/downloads](https://git-scm.com/downloads).
2. Download the installer for your operating system.
3. Run it and click **Next** through the default options (the defaults are fine for beginners).
4. Verify installation by opening a terminal (Command Prompt on Windows, Terminal on macOS) and typing:
   ```
   git --version
   ```

## 3. Installing Visual Studio Code

Visual Studio Code (VS Code) is a free code editor.

1. Go to [https://code.visualstudio.com/](https://code.visualstudio.com/).
2. Click **Download**.
3. Run the installer and accept the default options.
4. Open VS Code once installation finishes to confirm it launches.

## 4. Recommended VS Code Extensions

Inside VS Code:

1. Click the **Extensions** icon in the left sidebar (it looks like four squares).
2. Search for and install:
   - **Python** (by Microsoft) - adds Python language support, debugging, and IntelliSense.
   - **Pylance** (by Microsoft) - usually installs automatically with the Python extension; improves code suggestions.
3. No other extensions are required for this project.

## 5. Opening the Project

1. Download or clone the project folder to your computer.
   - If you have the project as a `.zip` file, right-click it and choose **Extract All** (Windows) or double-click it (macOS) to unzip it.
   - If using Git, open a terminal, navigate to where you want the project, and run:
     ```
     git clone <repository-url>
     ```
2. Open VS Code.
3. Go to **File -> Open Folder...** and select the project folder you just extracted or cloned.

## 6. Creating a Virtual Environment

A virtual environment is an isolated space for this project's Python packages, so they don't conflict with other projects on your computer.

1. In VS Code, open a terminal: **Terminal -> New Terminal**.
2. Make sure you're in the project folder (the terminal usually opens there automatically).
3. Run:
   - **Windows:**
     ```
     python -m venv venv
     ```
   - **macOS:**
     ```
     python3 -m venv venv
     ```
4. This creates a new folder called `venv` inside your project - this is your virtual environment.

## 7. Activating the Virtual Environment

Activating "switches on" the virtual environment so installed packages go into it instead of your system.

- **Windows (Command Prompt):**
  ```
  venv\Scripts\activate
  ```
- **Windows (PowerShell):**
  ```
  venv\Scripts\Activate.ps1
  ```
  If PowerShell blocks this with a script-execution error, see [Troubleshooting](#13-troubleshooting).
- **macOS/Linux:**
  ```
  source venv/bin/activate
  ```

When activated, you'll see `(venv)` appear at the start of your terminal line.

## 8. Installing Dependencies

With the virtual environment activated, install the one required package:

```
pip install customtkinter
```

If the project includes a `requirements.txt` file, you can instead run:

```
pip install -r requirements.txt
```

## 9. The .env File

This particular project **does not use any API keys or secrets**, so no `.env` file is required to run it. If you see references to `.env` in general programming tutorials, know that it's simply a file used to store secret configuration values (like API keys) outside of your code - this project currently has no such values.

## 10. Running the Application

With your virtual environment still activated, run:

- **Windows:**
  ```
  python "JSON_Formatter.py"
  ```
- **macOS:**
  ```
  python3 "JSON_Formatter.py"
  ```

A window titled **"JSON Reader & Formatter"** should appear.

Alternatively, double-click:
- `Start App.bat` on Windows
- `Start App (Mac).command` on macOS

These scripts handle setup and launch automatically (see below).

## 11. Testing the Application

1. Launch the app using any method above.
2. In the top box, paste this sample text:
   ```
   {"name": "Alice", "age": 30, "city": "London"}
   ```
3. Click **Format & Validate JSON ⚡**.
4. You should see a neatly indented version appear in the bottom box.
5. Now try pasting invalid text, such as `{name: Alice}`, and click the button again - you should see a red-flag error message explaining what's wrong.

## 12. Using Every Feature

| Feature | How to Use It |
|---|---|
| **Paste raw JSON box** | Click inside the top text area and paste or type any JSON text. |
| **Format & Validate JSON ⚡ button** | Click to parse and format the text currently in the top box. |
| **Parsed Output view** | Read-only box showing either the formatted JSON or an error message. You can select and copy this text, but not edit it. |
| **Smart quote handling** | You can paste text copied from Word, websites, or chat apps that use "curly quotes" - the app converts them automatically. |

## 13. Troubleshooting

- **"python is not recognized as an internal or external command"** (Windows): Python wasn't added to PATH during install. Reinstall Python and make sure to check "Add Python to PATH".
- **"command not found: python3"** (macOS): Use `python3` instead of `python`, since macOS ships with an older system Python.
- **PowerShell won't let me activate the virtual environment**: Run this once in PowerShell (as Administrator), then try again:
  ```
  Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
  ```
- **`ModuleNotFoundError: No module named 'customtkinter'`**: Your virtual environment isn't activated, or the package wasn't installed. Re-run steps 7 and 8.
- **The app window doesn't appear at all**: Check the terminal for a red error message and copy it into a search engine, or re-check steps 6-8.
- **Nothing happens when I click the button**: Make sure you actually pasted text into the top box before clicking.

## 14. FAQ

**Q: Do I need an internet connection to use the app?**
A: No, once dependencies are installed, the app runs completely offline.

**Q: Can I use this on Linux?**
A: Yes - run it the same way as macOS (`python3 "JSON_Formatter.py"`), though no dedicated Linux launch script is included yet.

**Q: Will pasting single quotes always work?**
A: Mostly, but not always - see the "Known Limitations" section in `README.md` and the detailed explanation in `PROJECT_REVIEW.md`.

**Q: Do I need to reinstall dependencies every time I run the app?**
A: No. Once installed inside the `venv` folder, they stay installed. You only need to activate the virtual environment each time you open a new terminal session.

## 15. Common Mistakes

- Forgetting to activate the virtual environment before running the app or installing packages.
- Installing packages globally instead of inside the virtual environment (works, but defeats the purpose of isolation).
- Editing the file `JSON_Formatter.py` in a plain text editor without saving it with UTF-8 encoding, which can cause odd character issues.
- Closing the terminal window while the app is still starting up.

## 16. Security Recommendations

- Never paste sensitive personal data (passwords, credit card numbers, private keys) into any online JSON formatter - this app is safe because it works entirely offline, but get in the habit of being cautious.
- If this project is later extended to call external APIs, always store API keys in a `.env` file and add `.env` to `.gitignore` so keys are never uploaded to GitHub.
- Keep Python and your packages updated to receive security fixes: `pip install --upgrade customtkinter`.

## 17. Next Learning Steps

- Learn more about Python's built-in [`json` module](https://docs.python.org/3/library/json.html).
- Explore the [CustomTkinter documentation](https://customtkinter.tomschimansky.com/) to learn how to customize or extend the UI.
- Learn the basics of Git branching and pull requests to start contributing to open-source projects.
- Look into Python's `unittest` or `pytest` frameworks to learn how to write automated tests for code like `format_json()`.
