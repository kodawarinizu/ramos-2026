#!/usr/bin/env fish
# d2_to_svg.fish
# Convierte todos los bloques ```d2 en los .md a archivos SVG
# y reemplaza cada bloque por una imagen ![](img/archivo.svg)
#
# Uso:
#   chmod +x d2_to_svg.fish
#   ./d2_to_svg.fish
#
# Requisitos: d2 instalado y en el PATH

if not command -q d2
    echo "❌ D2 no encontrado. Instalar con: yay -S d2"
    exit 1
end

echo "🔍 Buscando archivos .md..."
echo ""

for md_file in (find . -name "*.md" -not -name "README.md" -not -path "./.git/*")
    python3 - $md_file << 'PYEOF'
import sys, os, subprocess, re, pathlib

md_path = sys.argv[1]
img_dir = os.path.join(os.path.dirname(md_path), "img")
md_base = pathlib.Path(md_path).stem

content = pathlib.Path(md_path).read_text(encoding="utf-8")
pattern = re.compile(r'```d2\n(.*?)```', re.DOTALL)
matches = list(pattern.finditer(content))

if not matches:
    sys.exit(0)

os.makedirs(img_dir, exist_ok=True)

results = {}
for i, m in enumerate(matches):
    svg_name = f"{md_base}_{i+1}.svg"
    svg_path = os.path.join(img_dir, svg_name)
    tmp      = "/tmp/_d2tmp.d2"
    pathlib.Path(tmp).write_text(m.group(1), encoding="utf-8")
    r = subprocess.run(["d2", "--theme=0", tmp, svg_path], capture_output=True, text=True)
    if r.returncode == 0:
        results[i] = svg_path
        print(f"    ✓ diagrama {i+1} → img/{svg_name}")
    else:
        print(f"    ⚠️  diagrama {i+1} falló: {r.stderr.strip()}")

counter = [0]
def replacer(m):
    i = counter[0]
    counter[0] += 1
    if i in results:
        rel = os.path.relpath(results[i], os.path.dirname(md_path))
        rel = rel.replace("\\", "/")
        return f"![Diagrama {i+1}]({rel})\n"
    return m.group(0)

final = pattern.sub(replacer, content)
pathlib.Path(md_path).write_text(final, encoding="utf-8")
print(f"  → {md_path} ({len(results)}/{len(matches)} diagramas convertidos)")
PYEOF
end

echo ""
echo "✅ Conversión completa."
echo ""
echo "Próximos pasos:"
echo "  git add ."
echo "  git commit -m 'chore: convert D2 diagrams to SVG for GitHub rendering'"
echo "  git push"