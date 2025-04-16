import json

with open('test.json', 'r', encoding='utf-8') as f:
    try:
        data = json.load(f)
        print("JSON parsed successfully")
    except json.JSONDecodeError as e:
        print(f"JSON parsing error: {e}")
        print(f"Error position: {e.pos}")
        print(f"Error line: {e.lineno}")
        print(f"Error column: {e.colno}")
        
        # Print the problematic section
        f.seek(max(0, e.pos - 50))
        context = f.read(100)
        print(f"Context around error: {context}") 