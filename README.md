# JSON Formatter

A lightweight desktop GUI application for pasting raw JSON, validating it, and viewing a cleanly indented, human-readable version. Built with Python and [CustomTkinter](https://github.com/TomSchimansky/CustomTkinter).

![Python](https://img.shields.io/badge/python-3.9%2B-blue)
![License](https://img.shields.io/badge/license-MIT-green)
![Platform](https://img.shields.io/badge/platform-Windows%20%7C%20macOS%20%7C%20Linux-lightgrey)

## Features

- 🎨 Clean, dark-themed desktop UI
- ⚡ One-click JSON formatting and validation
- 🧹 Automatically normalizes smart/curly quotes (e.g. copied from web pages or chat apps) into standard double quotes
- ❌ Friendly, detailed error messages when JSON is invalid
- 📋 Read-only output box to safely view and copy formatted results

## Screenshot

> _Add a screenshot of the app here (e.g. `docs/screenshot.png`) once available._

## Requirements

- Python 3.9 or later
- [customtkinter](https://pypi.org/project/customtkinter/)

## Installation

```bash
# Clone the repository
git clone https://github.com/<your-username>/<your-repo>.git
cd <your-repo>

# (Recommended) create and activate a virtual environment
python -m venv venv
# Windows
venv\Scripts\activate
# macOS/Linux
source venv/bin/activate

# Install dependencies
pip install customtkinter
```

> New to Python, Git, or virtual environments? See [INSTRUCTION.md](INSTRUCTION.md) for a complete beginner-friendly walkthrough.

## Usage

Run the application:

```bash
python "JSON_Formatter.py"
```

Or, on Windows/macOS, double-click the included startup scripts:

- **Windows:** `Start App.bat`
- **macOS:** `Start App (Mac).command`

Then:

1. Paste any raw JSON (or near-JSON) text into the top box.
2. Click **Format & Validate JSON ⚡**.
3. View the formatted, indented result in the bottom box, or an error message describing what's wrong with the input.

## How It Works

The app reads the raw text you paste in, normalizes common copy-paste quirks (curly quotes, single quotes), then attempts to parse it using Python's built-in `json` module. If parsing succeeds, the result is re-serialized with 4-space indentation. If parsing fails, a `JSONDecodeError` message is shown, including the line/column where the problem was found.

## Known Limitations

- The automatic single-quote-to-double-quote replacement can corrupt valid JSON strings that legitimately contain apostrophes (e.g. `"it's"` becomes `"it"s"`). See [PROJECT_REVIEW.md](PROJECT_REVIEW.md) for details and a suggested fix.
- Only `JSONDecodeError` is caught; other unexpected input can raise unhandled exceptions.

## Contributing

Issues and pull requests are welcome. Please open an issue first to discuss any significant changes.

## License

This project does not yet include a license file. See [PROJECT_REVIEW.md](PROJECT_REVIEW.md) for a recommendation on choosing and adding one (e.g. MIT) before making the repository public.
