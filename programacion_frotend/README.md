# Programación Front End — TI3031
> Guía de estudio: HTML5, CSS3, JavaScript y React

---

## Mapa general del ramo

![Diagrama 1](img/frontend_d2_1.svg)


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

![Diagrama 2](img/frontend_d2_2.svg)


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

![Diagrama 3](img/frontend_d2_3.svg)


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

![Diagrama 4](img/frontend_d2_4.svg)


---

## Unidad 2 · JavaScript y Manipulación del DOM

### El DOM como árbol

![Diagrama 5](img/frontend_d2_5.svg)


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

![Diagrama 6](img/frontend_d2_6.svg)


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

![Diagrama 7](img/frontend_d2_7.svg)


---

## Unidad 3 · React y SPAs

### Página tradicional vs SPA

![Diagrama 8](img/frontend_d2_8.svg)


---

### Árbol de componentes React

![Diagrama 9](img/frontend_d2_9.svg)


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

![Diagrama 10](img/frontend_d2_10.svg)


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

![Diagrama 11](img/frontend_d2_11.svg)


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

![Diagrama 12](img/frontend_d2_12.svg)


---

*Documentación oficial: [react.dev](https://es.react.dev) · MDN Web Docs*
