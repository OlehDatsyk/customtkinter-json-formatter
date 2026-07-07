import customtkinter as ctk
import json

# App appearance
ctk.set_appearance_mode("dark")
ctk.set_default_color_theme("blue")

# Main window
app = ctk.CTk()
app.title("JSON Reader & Formatter")
app.geometry("500x620")
app.resizable(False, False)

def format_json():
    # Grab the string from the raw entry input box area
    raw_input = input_box.get("1.0", "end").strip()
    
    # Check if empty
    if not raw_input:
        output_box.configure(state="normal")
        output_box.delete("1.0", "end")
        output_box.insert("1.0", "Please paste a raw JSON string above.")
        output_box.configure(state="disabled")
        return
        
    try:
        # Standardize smart/curly quotes copied from text chats or web pages
        cleaned_input = raw_input.replace("“", '"').replace("”", '"')
        
        # Automatically fix non-standard single quotes to match the official JSON specification
        cleaned_input = cleaned_input.replace("'", '"')

        # Parse text string data directly into a valid Python structure dictionary 
        parsed_data = json.loads(cleaned_input)
        
        # Re-encode it back into a string with beautiful structural indentation formatting
        formatted_str = json.dumps(parsed_data, indent=4)
        
        # Output result display update handling
        output_box.configure(state="normal")
        output_box.delete("1.0", "end")
        output_box.insert("1.0", formatted_str)
        output_box.configure(state="disabled")
        
    except json.JSONDecodeError as err:
        # Graceful error handling presentation block
        output_box.configure(state="normal")
        output_box.delete("1.0", "end")
        output_box.insert("1.0", f"Invalid JSON Structure! ❌\n\nDetails:\n{str(err)}")
        output_box.configure(state="disabled")

# UI Layout Setup 
title_label = ctk.CTkLabel(app, text="JSON Formatter", height=50, font=("Arial", 26, "bold"))
title_label.pack(fill="x", padx=20, pady=(15, 5))

lbl_input = ctk.CTkLabel(app, text="Paste Raw JSON Here:", font=("Arial", 14))
lbl_input.pack(anchor="w", padx=20)

input_box = ctk.CTkTextbox(app, height=180, font=("Courier", 14), corner_radius=12, border_width=1)
input_box.pack(fill="x", padx=20, pady=5)

btn_format = ctk.CTkButton(app, text="Format & Validate JSON ⚡", font=("Arial", 15, "bold"), height=45, corner_radius=12, command=format_json)
btn_format.pack(fill="x", padx=20, pady=10)

lbl_output = ctk.CTkLabel(app, text="Parsed Output View:", font=("Arial", 14))
lbl_output.pack(anchor="w", padx=20)

# Displays results cleanly inside an anchored border element context block
output_box = ctk.CTkTextbox(app, height=220, font=("Courier", 14), corner_radius=12, border_width=2, border_color="#1f6aa5", state="disabled")
output_box.pack(fill="x", padx=20, pady=5)

# Start app
app.mainloop()
