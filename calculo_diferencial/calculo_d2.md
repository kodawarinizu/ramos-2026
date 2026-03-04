# Cálculo Diferencial — CBCD01
> Guía de estudio con fundamentos, conceptos y problemas reales

---

## Mapa general del ramo

```d2
direction: right

u1: "Unidad 1\nLímites y Continuidad" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}
u2: "Unidad 2\nDerivadas" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
u3: "Unidad 3\nAplicaciones" {style.fill: "#fef9c3"; style.stroke: "#eab308"}

u1 -> u2 -> u3

opt: "Optimización" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}
tc: "Tasas de cambio" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}
af: "Análisis de funciones" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}

u3 -> opt
u3 -> tc
u3 -> af
```

---

## Unidad 1 · Límites y Continuidad

### ¿Qué es un límite?

Un **límite** describe el comportamiento de una función $f(x)$ cuando $x$ se **acerca** a un valor $a$, sin necesariamente llegar a él.

$$\lim_{x \to a} f(x) = L$$

> "A medida que $x$ se aproxima a $a$, la función $f(x)$ se aproxima a $L$."

---

### Límites laterales

| Notación | Significado |
|---|---|
| $\lim_{x \to a^-} f(x)$ | $x$ se acerca a $a$ por la **izquierda** |
| $\lim_{x \to a^+} f(x)$ | $x$ se acerca a $a$ por la **derecha** |

> El límite existe **si y solo si** ambos límites laterales son iguales:
> $$\lim_{x \to a^-} f(x) = \lim_{x \to a^+} f(x) = L$$

---

### Propiedades de los límites

Sea $\lim_{x \to a} f(x) = L$ y $\lim_{x \to a} g(x) = M$:

$$\lim_{x \to a} [f(x) + g(x)] = L + M$$
$$\lim_{x \to a} [f(x) \cdot g(x)] = L \cdot M$$
$$\lim_{x \to a} \frac{f(x)}{g(x)} = \frac{L}{M}, \quad M \neq 0$$
$$\lim_{x \to a} [f(x)]^n = L^n$$

---

### Formas indeterminadas — flujo de resolución

```d2
direction: down

inicio: "Sustituir x = a" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}

ok: "Resultado definido\nEse es el límite ✓" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
ind: "Forma indeterminada\n0/0 ó infinito/infinito" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}

inicio -> ok: "sin problema"
inicio -> ind: "falla"

fact: "Factorizar\nCancelar factor común" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
rac: "Racionalizar\nMultiplicar por conjugado" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
lhop: "Regla de L'Hôpital\nDerivar num. y den." {style.fill: "#fef9c3"; style.stroke: "#eab308"}

ind -> fact: "polinomios"
ind -> rac: "raíces"
ind -> lhop: "funciones complejas"

eval: "Evaluar de nuevo → L ✓" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}

fact -> eval
rac -> eval
lhop -> eval
```

**Ejemplo — factorización:**

$$\lim_{x \to 2} \frac{x^2 - 4}{x - 2} = \lim_{x \to 2} \frac{(x-2)(x+2)}{x-2} = \lim_{x \to 2} (x+2) = 4$$

**Regla de L'Hôpital:**

$$\lim_{x \to a} \frac{f(x)}{g(x)} = \lim_{x \to a} \frac{f'(x)}{g'(x)}$$

---

### Continuidad — las tres condiciones

```d2
direction: right

c1: "1. f(a) está definida" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}
c2: "2. El límite existe\ncuando x tiende a a" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}
c3: "3. El límite es igual\na f(a)" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}
ok: "Continua en x = a ✓" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}

c1 -> c2 -> c3 -> ok

d1: "Discontinuidad\nesencial" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}
d2: "Discontinuidad\nde salto" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}
d3: "Discontinuidad\nevitable" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}

c1 -> d1: "falla" {style.stroke-dash: 4}
c2 -> d2: "falla" {style.stroke-dash: 4}
c3 -> d3: "falla" {style.stroke-dash: 4}
```

---

### Problema real — Límites

> Una empresa modela sus costos con $C(x) = \frac{x^2 - 9}{x - 3}$. ¿Cuál es el costo cuando $x \to 3$?

$$\lim_{x \to 3} \frac{x^2 - 9}{x - 3} = \lim_{x \to 3}(x+3) = 6$$

El costo se aproxima a **6 mil pesos** por unidad.

---

## Unidad 2 · Derivadas

### ¿Qué es una derivada?

La **derivada** mide la **tasa de cambio instantánea** de una función. Geométricamente, es la pendiente de la recta tangente en un punto.

$$f'(x) = \lim_{h \to 0} \frac{f(x+h) - f(x)}{h}$$

---

### Notaciones equivalentes

$$f'(x) = \frac{dy}{dx} = \frac{d}{dx}[f(x)] = \dot{y}$$

---

### Reglas de derivación

| Regla | Fórmula |
|---|---|
| Constante | $\frac{d}{dx}[c] = 0$ |
| Potencia | $\frac{d}{dx}[x^n] = n \cdot x^{n-1}$ |
| Suma/Resta | $\frac{d}{dx}[f \pm g] = f' \pm g'$ |
| Producto | $\frac{d}{dx}[f \cdot g] = f'g + fg'$ |
| Cociente | $\frac{d}{dx}\left[\frac{f}{g}\right] = \frac{f'g - fg'}{g^2}$ |
| Cadena | $\frac{d}{dx}[f(g(x))] = f'(g(x)) \cdot g'(x)$ |

---

### Regla de la cadena — cómo aplicarla

```d2
direction: right

comp: "f(g(x))\nfunción compuesta" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}

ext: "Capa exterior f\nDerivar manteniendo g(x)" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
int: "Capa interior g\nDerivar g(x) → g'(x)" {style.fill: "#fef9c3"; style.stroke: "#eab308"}

res: "Multiplicar\nf'(g(x)) · g'(x)" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}

comp -> ext: "identificar"
comp -> int: "identificar"
ext -> res
int -> res
```

---

### Derivadas de funciones comunes

$$\frac{d}{dx}[\sin x] = \cos x \qquad \frac{d}{dx}[\cos x] = -\sin x$$

$$\frac{d}{dx}[e^x] = e^x \qquad \frac{d}{dx}[\ln x] = \frac{1}{x}$$

$$\frac{d}{dx}[\tan x] = \sec^2 x$$

---

### Problema real — Derivadas

> Un proyectil sigue $h(t) = -5t^2 + 20t + 3$ metros. ¿Cuál es su velocidad en $t = 2$ s?

$$h'(t) = -10t + 20 \implies h'(2) = 0 \text{ m/s}$$

En $t = 2$ el proyectil está en su **punto más alto**.

---

## Unidad 3 · Aplicaciones de las Derivadas

### Análisis completo de una función

```d2
direction: down

f: "Función f(x)" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}

fp: "Primera derivada f'(x)" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
fpp: "Segunda derivada f''(x)" {style.fill: "#fef9c3"; style.stroke: "#eab308"}

f -> fp
f -> fpp

crec: "f'(x) > 0\ncreciente" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
decrec: "f'(x) < 0\ndecreciente" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}
crit: "f'(x) = 0\npunto crítico x₀" {style.fill: "#fef9c3"; style.stroke: "#eab308"}

fp -> crec
fp -> decrec
fp -> crit

min: "f''(x₀) > 0\nmínimo local" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
max: "f''(x₀) < 0\nmáximo local" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}
inc: "f''(x₀) = 0\nno concluyente" {style.fill: "#f1f5f9"; style.stroke: "#94a3b8"}

crit -> min
crit -> max
crit -> inc

cup: "f''(x) > 0\ncóncava hacia arriba" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
cdown: "f''(x) < 0\ncóncava hacia abajo" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}
infl: "f''(x) = 0\nposible inflexión" {style.fill: "#fef9c3"; style.stroke: "#eab308"}

fpp -> cup
fpp -> cdown
fpp -> infl
```

---

### Optimización — Procedimiento

```d2
direction: down

p1: "1. Función objetivo f(x)" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}
p2: "2. Restricciones del problema" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}
p3: "3. Reducir a una variable" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
p4: "4. Derivar: f'(x) = 0" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
p5: "5. Verificar con f''(x)" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
p6: "6. Interpretar en contexto ✓" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}

p1 -> p2 -> p3 -> p4 -> p5 -> p6
```

---

### Problema real — Optimización

> Caja sin tapa, base cuadrada, $V = 32$ m³. ¿Dimensiones que minimizan el material?

Sea lado $x$ y altura $h = \frac{32}{x^2}$:

$$S = x^2 + \frac{128}{x} \implies S'(x) = 2x - \frac{128}{x^2} = 0 \implies x = 4 \text{ m}, \quad h = 2 \text{ m}$$

---

## Resumen de Fórmulas Clave

$$\lim_{x \to a} f(x) = L \iff \lim_{x \to a^-} f(x) = \lim_{x \to a^+} f(x) = L$$

$$f'(x) = \lim_{h \to 0} \frac{f(x+h)-f(x)}{h}$$

$$\frac{d}{dx}[f(g(x))] = f'(g(x)) \cdot g'(x)$$

$$\text{Optimización: } f'(x_0) = 0 \text{ y } f''(x_0) \neq 0$$

---

*Herramientas recomendadas: GeoGebra, calculadora científica, emuladores.*
