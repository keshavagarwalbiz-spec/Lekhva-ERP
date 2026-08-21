import json

log_path = "C:/Users/kesha/.gemini/antigravity/brain/2b29b108-eba5-4b94-8a41-5346eb786168/.system_generated/logs/transcript_full.jsonl"
with open(log_path, "r", encoding="utf-8") as f:
    lines = f.readlines()

with open("recover_commands.ps1", "w", encoding="utf-8") as out:
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
                        if "New-Item -Path \"apps/web/src/app" in cmd or "New-Item -Path \"apps/web/src/components" in cmd or "New-Item -Path \"apps/web/package.json" in cmd:
                            print("FOUND A MATCH:")
                            print(cmd[:100].replace("\n", " ") + "...")
                            out.write(cmd + "\n\n")
        except Exception as e:
            pass
