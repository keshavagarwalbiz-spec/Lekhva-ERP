import re
import os

with open("recover_commands.ps1", "r", encoding="utf-8") as f:
    content = f.read()

# Find all occurrences of New-Item
matches = re.finditer(r"New-Item -Path \"([^\"]+)\" -ItemType File -Force -Value '((?:[^']|'')*)'", content)
for m in matches:
    filepath = m.group(1)
    filecontent = m.group(2).replace("''", "'")
    print("Writing", filepath)
    os.makedirs(os.path.dirname(filepath), exist_ok=True)
    with open(filepath, "w", encoding="utf-8") as out:
        out.write(filecontent)
