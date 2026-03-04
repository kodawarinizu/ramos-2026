# Programación Front End — TI3031
> Guía de estudio: HTML5, CSS3, JavaScript y React

---

## Mapa general del ramo

```d2
direction: right

u1: "Unidad 1\nHTML5 y CSS3" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}
u2: "Unidad 2\nJavaScript y DOM" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
u3: "Unidad 3\nReact y SPAs" {style.fill: "#fef9c3"; style.stroke: "#eab308"}

u1 -> u2 -> u3

git: "Git / GitHub" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}
ia: "GitHub Copilot" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}

u1 -> git
u3 -> ia
```

---

## Unidad 1 · Sitio Web Estático con HTML5 y CSS3

### ¿Qué es el Front End?

El **Front End** es la parte de una aplicación web que el usuario **ve e interactúa directamente**.

| Tecnología | Rol |
|---|---|
| **HTML** | Estructura y contenido |
| **CSS** | Apariencia visual |
| **JavaScript** | Comportamiento e interactividad |

---

### HTML5 — Árbol del documento

```d2
direction: down

doc: "document" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}
html: "html" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}
head: "head" {style.fill: "#f1f5f9"; style.stroke: "#94a3b8"}
body: "body" {style.fill: "#f1f5f9"; style.stroke: "#94a3b8"}

header: "header" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
nav: "nav" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
main: "main" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
footer: "footer" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}

section: "section" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
article: "article" {style.fill: "#fef9c3"; style.stroke: "#eab308"}

doc -> html
html -> head
html -> body
body -> header
body -> nav
body -> main
body -> footer
main -> section
main -> article
```

```html
<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="UTF-8">
    <title>Mi sitio</title>
    <link rel="stylesheet" href="styles.css">
  </head>
  <body>
    <header>...</header>
    <nav>...</nav>
    <main>
      <section>...</section>
      <article>...</article>
    </main>
    <footer>...</footer>
  </body>
</html>
```

---

### CSS3 — Box Model

```d2
direction: down

margin: "margin\n(espacio exterior)" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}
border: "border\n(borde visible)" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
padding: "padding\n(espacio interior)" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
content: "content\n(contenido real)" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}

margin -> border -> padding -> content
```

**Flexbox** — layout de una dimensión:

```css
.contenedor {
  display: flex;
  justify-content: space-between;
  align-items: center;
  gap: 16px;
}
```

**CSS Grid** — layout de dos dimensiones:

```css
.grilla {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 24px;
}
```

**Media Queries** — diseño responsivo:

```css
.columna { width: 100%; }

@media (min-width: 768px) {
  .columna { width: 50%; }
}
```

---

### Git — Flujo de trabajo

```d2
direction: right

wd: "Working Directory\neditar archivos" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}
stage: "Staging Area\ngit add" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
repo: "Local Repository\ngit commit" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
remote: "Remote (GitHub)\ngit push" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}

wd -> stage -> repo -> remote
remote -> wd: "git pull" {style.stroke-dash: 4}
```

---

## Unidad 2 · JavaScript y Manipulación del DOM

### El DOM como árbol

```d2
direction: down

doc: "document" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}
body: "body" {style.fill: "#f1f5f9"; style.stroke: "#94a3b8"}
header: "header" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
main: "main" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
footer: "footer" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
section: "section" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
p: "p  ← JS puede modificar esto" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}

doc -> body
body -> header
body -> main
body -> footer
main -> section
section -> p
```

---

### Variables y tipos de datos

```js
let nombre = "Ana";     // string  — reasignable
const PI = 3.14159;     // number  — constante
let activo = true;      // boolean
let datos = null;       // null    — vacío intencional
let x;                  // undefined
```

> Preferir `const` por defecto, usar `let` solo si necesitas reasignar.

---

### Arreglos y Objetos

```js
// Arreglo
const frutas = ["manzana", "pera", "uva"];
frutas.push("naranja");
frutas.filter(f => f !== "pera");

// Objeto
const usuario = { nombre: "Ana", edad: 25, activo: true };
console.log(usuario.nombre); // "Ana"
```

---

### Funciones

```js
function sumar(a, b) { return a + b; }

const multiplicar = (a, b) => a * b;

const saludar = (nombre = "visitante") => `Hola, ${nombre}!`;
```

---

### Manipulación del DOM — flujo

```d2
direction: right

js: "JavaScript" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}
sel: "querySelector\nquerySelectorAll" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
nodo: "Nodo del DOM" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}

mod: "Modificar contenido\ntextContent / innerHTML" {style.fill: "#f1f5f9"; style.stroke: "#94a3b8"}
est: "Modificar estilos\nstyle / classList" {style.fill: "#f1f5f9"; style.stroke: "#94a3b8"}
evt: "Escuchar eventos\naddEventListener" {style.fill: "#f1f5f9"; style.stroke: "#94a3b8"}

js -> sel -> nodo
nodo -> mod
nodo -> est
nodo -> evt
```

```js
const titulo = document.querySelector("h1");
titulo.textContent = "Nuevo título";
titulo.classList.add("activo");

document.querySelector("#btn").addEventListener("click", () => {
  alert("¡Clic!");
});
```

---

### Validación de formularios — flujo

```d2
direction: down

sub: "Usuario hace submit" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}
prev: "e.preventDefault()\nevitar recarga" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
leer: "Leer valores del formulario" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
val: "Validar campos" {style.fill: "#fef9c3"; style.stroke: "#eab308"}

err: "Inválido\nmostrar error" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}
ok: "Válido\nenviar datos ✓" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}

sub -> prev -> leer -> val
val -> err: "falla" {style.stroke-dash: 4}
val -> ok: "pasa"
```

---

## Unidad 3 · React y SPAs

### Página tradicional vs SPA

```d2
direction: down

trad: "Página Tradicional" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}
t1: "Clic del usuario"
t2: "Solicitud al servidor"
t3: "Nueva página HTML"
t4: "Recarga visual completa"
trad -> t1 -> t2 -> t3 -> t4

spa: "SPA con React" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
s1: "Clic del usuario"
s2: "JS actualiza el DOM"
s3: "UI actualizada sin recarga ✓"
spa -> s1 -> s2 -> s3
```

---

### Árbol de componentes React

```d2
direction: down

app: "App (raíz)" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}
header: "Header" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
main: "Main" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
footer: "Footer" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}

t1: "Tarjeta" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
t2: "Tarjeta" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
t3: "Tarjeta" {style.fill: "#fef9c3"; style.stroke: "#eab308"}

app -> header
app -> main
app -> footer
main -> t1: "props"
main -> t2: "props"
main -> t3: "props"
```

```jsx
function Tarjeta({ titulo, descripcion }) {
  return (
    <div className="card">
      <h3>{titulo}</h3>
      <p>{descripcion}</p>
    </div>
  );
}
```

---

### Ciclo de useState

```d2
direction: right

render: "Render inicial\ncontador = 0" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}
evt: "Usuario hace clic" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
setter: "setContador(contador + 1)" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
rerender: "React re-renderiza\ncontador = 1" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}

render -> evt -> setter -> rerender -> evt: "ciclo" {style.stroke-dash: 4}
```

```jsx
const [contador, setContador] = useState(0);
```

---

### useEffect — cuándo ejecuta

| Dependencias | Cuándo ejecuta |
|---|---|
| `[]` | Solo al montar el componente |
| `[valor]` | Al montar y cuando `valor` cambia |
| Sin array | En cada render |

---

### Consumo de API — flujo async/await

```d2
direction: down

montar: "Componente se monta" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}
fetch: "fetch(url)" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
json: "res.json()" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
estado: "setDatos(datos)" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
render: "React renderiza la lista ✓" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
err: "catch → manejar error" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}

montar -> fetch -> json -> estado -> render
fetch -> err: "falla" {style.stroke-dash: 4}
```

```jsx
useEffect(() => {
  async function cargarDatos() {
    try {
      const res = await fetch("https://api.example.com/users");
      const datos = await res.json();
      setUsuarios(datos);
    } catch (error) {
      console.error("Error:", error);
    }
  }
  cargarDatos();
}, []);
```

---

### Local Storage — CRUD

```js
// Create / Update
localStorage.setItem("usuario", JSON.stringify({ nombre: "Ana" }));

// Read
const usuario = JSON.parse(localStorage.getItem("usuario"));

// Delete
localStorage.removeItem("usuario");
```

---

## Resumen del Stack

```d2
direction: right

html: "HTML5\nestructura" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}
css: "CSS3\nestilos" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}
js: "JavaScript\nlógica" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
react: "React\ncomponentes" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
api: "APIs\ndatos externos" {style.fill: "#f1f5f9"; style.stroke: "#94a3b8"}
ls: "Local Storage\npersistencia" {style.fill: "#f1f5f9"; style.stroke: "#94a3b8"}

html -> js
css -> js
js -> react
react -> api
react -> ls
```

---

*Documentación oficial: [react.dev](https://es.react.dev) · MDN Web Docs*
