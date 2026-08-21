import json
import re
import os

log_path = "C:/Users/kesha/.gemini/antigravity/brain/2b29b108-eba5-4b94-8a41-5346eb786168/.system_generated/logs/transcript_full.jsonl"
with open(log_path, "r", encoding="utf-8") as f:
    lines = f.readlines()

for line in lines:
    try:
        data = json.loads(line)
        if "tool_calls" in data:
            for tc in data["tool_calls"]:
                if tc.get("name") == "run_command":
                    args = tc.get("args", {})
                    if isinstance(args, str):
                        try:
                            args = json.loads(args)
                        except:
                            pass
                    cmd = args.get("CommandLine", "")
                    if "New-Item" in cmd and "-Value" in cmd and "apps/web" in cmd:
                        # Simple regex to extract path and value
                        path_match = re.search(r'-Path\s+"([^"]+)"', cmd)
                        if not path_match:
                            path_match = re.search(r"-Path\s+'([^']+)'", cmd)
                        
                        value_match = re.search(r"-Value\s+'(.*)'$", cmd, re.DOTALL)
                        if not value_match:
                            value_match = re.search(r'-Value\s+"(.*)"$', cmd, re.DOTALL)
                            
                        if path_match and value_match:
                            filepath = path_match.group(1)
                            content = value_match.group(1)
                            
                            # Handle powershell single quote escaping
                            if cmd.find("-Value '") != -1:
                                content = content.replace("''", "'")
                                
                            print("Restoring", filepath)
                            os.makedirs(os.path.dirname(filepath), exist_ok=True)
                            with open(filepath, "w", encoding="utf-8") as out:
                                out.write(content)
    except Exception as e:
        pass
print("Recovery complete.")
