# 📚 Guías de Estudio — Ingeniería en Ciberseguridad INACAP

Kit de estudio con diagramas D2, tablas y ejemplos de código para los ramos del semestre.

---

## 📂 Contenido

| Archivo | Ramo | Código |
|---|---|---|
| `calculo_diferencial.md` | Cálculo Diferencial | CBCD01 |
| `frontend_TI3031.md` | Programación Front End | TI3031 |
| `nosql_TI3032.md` | Bases de Datos No Estructuradas | TI3032 |
| `calidad_software_TILE11.md` | Calidad de Componentes de Software | TILE11 |
| `sistemas_operativos_TI3035.md` | Sistemas Operativos | TI3035 |
| `innovacion_emprendimiento_FGIE01.md` | Innovación y Emprendimiento I | FGIE01 |
| `seguridad_informacion_TI3034.md` | Fundamentos de Seguridad de la Información | TI3034 |

---

## 🛠️ Setup — Lo que necesitas instalar

### 1. Editor — VS Code

**Arch Linux**
```bash
sudo pacman -S code
```

**Windows**
Descargar instalador desde [code.visualstudio.com](https://code.visualstudio.com) y ejecutar normalmente.

---

### 2. D2 — Motor de diagramas

**Arch Linux**
```bash
# AUR
yay -S d2

# O con el instalador oficial
curl -fsSL https://d2lang.com/install.sh | sh
```

**Windows**

Opción A — con winget (recomendado):
```powershell
winget install terrastruct.d2
```

Opción B — con Chocolatey:
```powershell
choco install d2
```

Opción C — manual: descargar el `.zip` desde [github.com/terrastruct/d2/releases](https://github.com/terrastruct/d2/releases), extraer y agregar la carpeta al PATH del sistema.

> ⚠️ Después de instalar en Windows, **reiniciar VS Code** para que detecte D2 en el PATH.

### 3. Extensiones VS Code

Instálalas desde el Marketplace (`Ctrl+Shift+X`):

| Extensión | ID | Para qué sirve |
|---|---|---|
| **D2 Markdown Preview** | `kdheepak.d2-markdown-preview` | Renderizar diagramas D2 dentro de `.md` |
| **Markdown Preview Enhanced** | `shd101wyy.markdown-preview-enhanced` | Preview completo de Markdown con math, diagramas |
| **Markdown All in One** | `yzhang.markdown-all-in-one` | Atajos, tabla de contenidos, formato |
| **LaTeX Workshop** | `james-yu.latex-workshop` | Renderizar fórmulas LaTeX en el preview |
| **Better Comments** | `aaron-bond.better-comments` | Comentarios con color en código |

> ⚠️ Para que los diagramas D2 funcionen dentro de Markdown, usar la extensión de **kdheepak**, no la de Terrastruct.

---

## 📖 Cómo abrir y estudiar

### Ver el preview de una guía

1. Abrir el archivo `.md` en VS Code
2. `Ctrl+Shift+P` → buscar **"D2 Markdown: Open Preview"**
3. O usar el ícono de preview en la esquina superior derecha

### Navegar entre secciones

- `Ctrl+Shift+P` → **"Markdown: Open Preview to the Side"**
- En Markdown All in One: `Ctrl+T` para la tabla de contenidos

---

## ✏️ Herramientas por tipo de tarea

### Diagramas

| Herramienta | Uso | Link |
|---|---|---|
| **D2** (en las guías) | Diagramas de flujo, árboles, arquitecturas dentro de Markdown | [d2lang.com](https://d2lang.com) |
| **draw.io / diagrams.net** | Diagramas más visuales, libre y gratuito, exporta SVG/PNG | [diagrams.net](https://app.diagrams.net) |
| **Excalidraw** | Bocetos rápidos con estilo dibujado a mano | [excalidraw.com](https://excalidraw.com) |

### Tomar apuntes / escribir

| Herramienta | Uso |
|---|---|
| **Obsidian** | Notas en Markdown con links entre archivos, soporta D2 con plugin |
| **VS Code** | Editar las guías directamente |
| **Notion** | Alternativa web si prefieres interfaz gráfica |

### Planificación

| Herramienta | Uso |
|---|---|
| **Obsidian + Daily Notes** | Planificación diaria en Markdown |
| **Trello** | Tablero Kanban para tareas por ramo |
| **GitHub Projects** | Si ya usas Git para versionar tus apuntes |

### Matemáticas (Cálculo)

| Herramienta | Uso |
|---|---|
| **GeoGebra** | Graficar funciones, derivadas, límites | [geogebra.org](https://geogebra.org) |
| **Wolfram Alpha** | Verificar cálculos y derivadas | [wolframalpha.com](https://wolframalpha.com) |
| **Desmos** | Graficadora rápida y simple | [desmos.com](https://desmos.com) |

### Ciberseguridad (laboratorios)

| Herramienta | Uso |
|---|---|
| **Kali Linux** | Distribución para pentesting |
| **Metasploitable** | VM vulnerable para practicar |
| **DVWA** | App web vulnerable (SQL injection, XSS) |
| **CVSS Calculator** | Calcular score de vulnerabilidades — [first.org/cvss](https://www.first.org/cvss/calculator/3.1) |

---

## 🗂️ Estructura recomendada de carpetas

```
apuntes/
├── README.md
├── guias/
│   ├── calculo_diferencial.md
│   ├── frontend_TI3031.md
│   ├── nosql_TI3032.md
│   ├── calidad_software_TILE11.md
│   ├── sistemas_operativos_TI3035.md
│   ├── innovacion_emprendimiento_FGIE01.md
│   └── seguridad_informacion_TI3034.md
├── laboratorios/
│   ├── vlsm_ejercicios.md
│   ├── kali_notas.md
│   └── react_practicas/
└── resumenes/
    └── evaluaciones/
```

---

## ⚙️ Verificar que todo funciona

**Linux (fish shell)**
```bash
# Verificar D2
d2 --version

# Test rápido
echo 'a -> b' > test.d2 && d2 test.d2 test.svg && echo "D2 OK"

# Si no encuentra d2:
which d2
fish_add_path /usr/sbin
```

**Windows (PowerShell)**
```powershell
# Verificar D2
d2 --version

# Test rápido
"a -> b" | Out-File test.d2; d2 test.d2 test.svg; echo "D2 OK"

# Si no encuentra d2, verificar PATH:
$env:PATH -split ";" | Select-String "d2"
```

> Si VS Code sigue sin renderizar los diagramas en Windows, ir a **Configuración** → buscar `d2` → en la extensión de kdheepak, asegurarse de que el campo `D2: Path` apunte al ejecutable (ej: `C:\Program Files\d2\d2.exe`).

---