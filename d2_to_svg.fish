#!/usr/bin/env fish
# d2_to_svg.fish
# Convierte bloques ```d2 a SVG en todos los .md del proyecto
#
# Uso (desde la raíz del proyecto, con ambos archivos en la misma carpeta):
#   chmod +x d2_to_svg.fish
#   ./d2_to_svg.fish

if not command -q d2
    echo "❌ D2 no encontrado. Instalar con: yay -S d2"
    exit 1
end

if not command -q python3
    echo "❌ python3 no encontrado"
    exit 1
end

# Ruta al script Python (misma carpeta que este script)
set script_dir (dirname (status --current-filename))
set py_script "$script_dir/d2_to_svg.py"

if not test -f $py_script
    echo "❌ No se encontró d2_to_svg.py en $script_dir"
    exit 1
end

echo "🔍 Buscando archivos .md..."
echo ""

for md_file in (find . -name "*.md" -not -name "README.md" -not -path "./.git/*")
    python3 $py_script $md_file
end

echo ""
echo "✅ Conversión completa."
echo ""
echo "Próximos pasos:"
echo "  git add ."
echo "  git commit -m 'chore: convert D2 diagrams to SVG for GitHub rendering'"
echo "  git push"
