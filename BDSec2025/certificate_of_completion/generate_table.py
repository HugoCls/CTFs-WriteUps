import json
from datetime import datetime

# Charger les fichiers JSON
with open("challs.json", "r", encoding="utf-8") as f:
    challs_data = json.load(f)["data"]

with open("successes.json", "r", encoding="utf-8") as f:
    successes_data = json.load(f)["data"]

# Créer un dictionnaire pour accéder rapidement aux succès par challenge_id
success_by_chall_id = {
    success["challenge_id"]: success
    for success in successes_data
}

# Fusionner les données
merged = []
for chall in challs_data:
    chall_id = chall["id"]
    success = success_by_chall_id.get(chall_id)

    entry = {
        "quest_title": chall["name"],
        "category": chall["category"],
        "points": chall["value"],
        "solved": chall["solved_by_me"],
        "solved_at": None,
        "solver": None
    }

    if success:
        # Formater l'heure (UTC → HH:MM:SS locale si besoin)
        dt_str = success["date"]
        dt = datetime.fromisoformat(dt_str)
        entry["solved_at"] = dt.isoformat()  # ou `.strftime("%Y-%m-%d %H:%M:%S")` si besoin
        entry["solver"] = success["user"]["name"]

    merged.append(entry)

# Sauvegarder le nouveau JSON
with open("merged_challs.json", "w", encoding="utf-8") as f:
    json.dump(merged, f, indent=2, ensure_ascii=False)

import json
from datetime import datetime, timedelta

def generate_markdown(input_path, output_path):
    with open(input_path, "r", encoding="utf-8") as f:
        challs = json.load(f)

    solved = [c for c in challs if c["solved"]]
    unsolved = [c for c in challs if not c["solved"]]

    for c in solved:
        if c["solved_at"]:
            dt = datetime.fromisoformat(c["solved_at"])
            dt += timedelta(hours=2)
            c["solved_at"] = dt.isoformat()

    solved.sort(key=lambda c: datetime.fromisoformat(c["solved_at"]))
    unsolved.sort(key=lambda c: (c["category"], c["quest_title"]))

    ordered = solved + unsolved

    markdown = "| Quest Title | Category | Points | Solver | Solved At |\n"
    markdown += "|-------------|----------|--------|-----------|--------|\n"

    for c in ordered:
        solved_at = (
            datetime.fromisoformat(c["solved_at"]).strftime("%Y-%m-%d %H:%M:%S")
            if c["solved_at"] else ""
        )
        markdown += f"| {c['quest_title']} | {c['category']} | {c['points']} | {c['solver'] or ''} | {solved_at or ''} |\n"

    with open(output_path, "w", encoding="utf-8") as f:
        f.write(markdown)

def generate_html(input_path, output_path):
    with open(input_path, "r", encoding="utf-8") as f:
        challs = json.load(f)

    solved = [c for c in challs if c["solved"]]
    unsolved = [c for c in challs if not c["solved"]]

    for c in solved:
        if c["solved_at"]:
            dt = datetime.fromisoformat(c["solved_at"])
            dt += timedelta(hours=2)
            c["solved_at"] = dt.isoformat()

    solved.sort(key=lambda c: datetime.fromisoformat(c["solved_at"]))
    unsolved.sort(key=lambda c: (c["category"], c["quest_title"]))

    ordered = solved + unsolved

    html = """
<div style="display: table; background-color: black; padding: 0; border-radius: 6px; margin: 0 auto;">
  <table style="color: white; border-collapse: collapse; min-width: 800px;">
    <thead>
      <tr>
        <th style="border: 1px solid red; padding: 6px; text-align: center; color: white; font-weight: bold;">Quest Title</th>
        <th style="border: 1px solid red; padding: 6px; text-align: center; color: white; font-weight: bold;">Category</th>
        <th style="border: 1px solid red; padding: 6px; text-align: center; color: white; font-weight: bold;">Points</th>
        <th style="border: 1px solid red; padding: 6px; text-align: center; color: white; font-weight: bold;">Solver</th>
        <th style="border: 1px solid red; padding: 6px; text-align: center; color: white; font-weight: bold;">Solved At</th>
      </tr>
    </thead>
    <tbody>
"""

    for c in ordered:
        solved_at = (
            datetime.fromisoformat(c["solved_at"]).strftime("%Y-%m-%d %H:%M:%S")
            if c["solved_at"] else ""
        )
        html += f"""      <tr>
        <td style="border: 1px solid red; padding: 6px; text-align: center; color: red;">{c['quest_title']}</td>
        <td style="border: 1px solid red; padding: 6px; text-align: center;">{c['category']}</td>
        <td style="border: 1px solid red; padding: 6px; text-align: center;">{c['points']}</td>
        <td style="border: 1px solid red; padding: 6px; text-align: center;">{c['solver'] or ''}</td>
        <td style="border: 1px solid red; padding: 6px; text-align: center;">{solved_at or ''}</td>
      </tr>\n"""

    html += """    </tbody>
  </table>
</div>
"""

    with open(output_path, "w", encoding="utf-8") as f:
        f.write(html)

generate_markdown("merged_challs.json", "Table.md")
generate_html("merged_challs.json", "Table.html")
