import json
import re
from pathlib import Path
import shutil

datapack_name = "HideAndSeek"
lang_js = json.load(open("language.json", "r", encoding="utf-8"))
pattern = re.compile(r"\$\{(.+?)\}")
datapack_dir = Path(Path.cwd(), datapack_name)
output_dir = Path(Path.cwd(), "build")

output_dir.mkdir()
Path(output_dir, f"{datapack_name}_zh").mkdir()
Path(output_dir, f"{datapack_name}_en").mkdir()
Path(output_dir, f"{datapack_name}_ja").mkdir()
for path in output_dir.glob("*"):
    Path(path, "data").mkdir()
    shutil.copy(Path(datapack_dir, "pack.mcmeta"), Path(path, "pack.mcmeta"))
    shutil.copy(Path(datapack_dir, "pack.png"), Path(path, "pack.png"))

def replace_as(match, lang):
    key = match.group(1)
    if key not in lang_js:
        raise KeyError(f"Key '{key}' not found in language.json")
    return lang_js[key][lang]

def replace_and_write(path, contents, lang):
    replaced = pattern.sub(lambda match: replace_as(match, lang), contents)
    output_path = Path(output_dir, f"{datapack_name}_{lang}", "data", path.relative_to(Path(datapack_dir, "data")))
    output_path.parent.mkdir(parents=True, exist_ok=True)
    output_path.write_text(replaced, encoding="utf-8")

for path in Path(datapack_dir, "data").rglob("*"):
    if path.is_file():
        contents = path.read_text(encoding="utf-8")
        replace_and_write(path, contents, "zh")
        replace_and_write(path, contents, "en")
        replace_and_write(path, contents, "ja")

shutil.make_archive(Path(output_dir, f"{datapack_name}_zh"), "zip", root_dir=Path(output_dir, f"{datapack_name}_zh"))
shutil.make_archive(Path(output_dir, f"{datapack_name}_en"), "zip", root_dir=Path(output_dir, f"{datapack_name}_en"))
shutil.make_archive(Path(output_dir, f"{datapack_name}_ja"), "zip", root_dir=Path(output_dir, f"{datapack_name}_ja"))
shutil.rmtree(Path(output_dir, f"{datapack_name}_zh"))
shutil.rmtree(Path(output_dir, f"{datapack_name}_en"))
shutil.rmtree(Path(output_dir, f"{datapack_name}_ja"))