import os
import json
import re

# Define the directory containing the posts and the output JSON file
posts_dir = "_posts"
json_file = "posts.json"

# List to store post metadata
posts = []

# Regex patterns for extracting title and excerpt
title_pattern = re.compile(r"^title:\s*(.+)", re.MULTILINE)
excerpt_pattern = re.compile(r"^excerpt:\s*(.+)", re.MULTILINE)

# Process each Markdown file in the _posts directory
for filename in os.listdir(posts_dir):
    if filename.endswith(".md"):
        file_path = os.path.join(posts_dir, filename)

        with open(file_path, "r", encoding="utf-8") as file:
            lines = file.readlines()

        # Extract YAML front matter
        if lines[0].strip() == "---":
            yaml_content = []
            for line in lines[1:]:
                if line.strip() == "---":
                    break
                yaml_content.append(line)

            yaml_text = "".join(yaml_content)

            # Extract title and excerpt
            title_match = title_pattern.search(yaml_text)
            excerpt_match = excerpt_pattern.search(yaml_text)

            title = title_match.group(1).strip() if title_match else "Untitled"
            excerpt = excerpt_match.group(1).strip() if excerpt_match else ""

            # Store metadata
            posts.append({
                "filename": filename,
                "title": title,
                "excerpt": excerpt
            })

# Save data to JSON file
with open(json_file, "w", encoding="utf-8") as json_out:
    json.dump(posts, json_out, indent=2, ensure_ascii=False)

print(f"Updated {json_file} with post metadata.")
