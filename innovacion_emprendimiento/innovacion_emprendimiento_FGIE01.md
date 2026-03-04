# Innovación y Emprendimiento I — FGIE01
> Guía de estudio: ciclo de innovación, modelo de negocio y pitch

---

## Mapa general del ramo

```d2
direction: right

u1: "Unidad 1\nDeteccion de\nOportunidades" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}
u2: "Unidad 2\nIdeacion de\nPropuestas" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
u3: "Unidad 3\nModelo de Negocio\ny Experimentacion" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
u4: "Unidad 4\nDifusion y\nFormalizacion" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}

u1 -> u2 -> u3 -> u4
```

---

## El Ciclo de Innovación INACAP

El ramo sigue un **ciclo completo**: desde detectar un problema real hasta presentar una empresa. Cada unidad es una fase de ese ciclo.

```d2
direction: down

diagnostico: "1. Diagnostico\nidentificar necesidades" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}
seleccion: "2. Seleccion de oportunidad\nelegir el problema a resolver" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}
generacion: "3. Generacion de ideas\nbrainstorming y metodos creativos" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
modelo: "4. Modelo de negocio\ncomo se sustenta la solucion" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
prototipo: "5. Prototipado\nprobar la solucion con usuarios" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
propuesta: "6. Propuesta de valor\nque hace unica la solucion" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}
pitch: "7. Pitch\npresentar y formalizar" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}

diagnostico -> seleccion -> generacion -> modelo -> prototipo -> propuesta -> pitch
```

---

## Unidad 1 · Detección de Oportunidades

### ¿Qué es una oportunidad de innovación?

Una **oportunidad** nace cuando existe una brecha entre lo que los usuarios necesitan y lo que actualmente tienen disponible. No se trata de inventar por inventar — se trata de resolver un problema real.

> "Un problema bien definido es un problema mitad resuelto." — Charles Kettering

---

### Fase de diagnóstico

El diagnóstico es el proceso de **entender profundamente** a los usuarios antes de proponer soluciones.

```d2
direction: down

diag: "Diagnostico" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}

obs: "Observacion\nver al usuario en su contexto real" {style.fill: "#f1f5f9"; style.stroke: "#94a3b8"}
ent: "Entrevistas\npreguntas abiertas y sin sesgo" {style.fill: "#f1f5f9"; style.stroke: "#94a3b8"}
enc: "Encuestas\nvalidar hipotesis con mayor muestra" {style.fill: "#f1f5f9"; style.stroke: "#94a3b8"}
dat: "Datos secundarios\ninformes, estudios, estadisticas" {style.fill: "#f1f5f9"; style.stroke: "#94a3b8"}

diag -> obs
diag -> ent
diag -> enc
diag -> dat
```

**Errores comunes a evitar:**
- Preguntar "¿usarías X producto?" en vez de "¿cómo resuelves X problema hoy?"
- Confirmar lo que ya creemos en vez de descubrir lo que no sabemos
- Saltar a soluciones antes de entender bien el problema

---

### Fase de selección de oportunidades

Con varios problemas identificados, hay que **elegir el más relevante** considerando:

| Criterio | Pregunta clave |
|---|---|
| Magnitud | ¿A cuántas personas afecta? |
| Intensidad | ¿Cuánto dolor genera? |
| Frecuencia | ¿Con qué frecuencia ocurre? |
| Factibilidad | ¿Es posible resolverlo? |

---

## Unidad 2 · Ideación de Propuestas

### Fase de generación de ideas

Una vez definido el problema, el objetivo es generar la **mayor cantidad de ideas posibles** antes de filtrar. La creatividad se entrena.

```d2
direction: right

problema: "Problema\ndefinido" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}
diverge: "Divergencia\ngenerar muchas ideas\nsin juzgar" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
converge: "Convergencia\nfiltrar y seleccionar\nla mejor idea" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
idea: "Idea\nseleccionada" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}

problema -> diverge -> converge -> idea
```

**Métodos de ideación:**

| Método | Descripción |
|---|---|
| **Brainstorming** | Lluvia libre de ideas en grupo, sin crítica |
| **SCAMPER** | Sustituir, Combinar, Adaptar, Modificar, Proponer, Eliminar, Reordenar |
| **Mapa mental** | Expandir conceptos visualmente desde un nodo central |
| **Analogías** | ¿Cómo resuelve este problema la naturaleza / otra industria? |

---

### Requerimientos y limitaciones

Antes de avanzar, la idea debe pasar por un filtro de realidad:

```d2
direction: down

idea2: "Idea propuesta" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}

req: "Requerimientos\nque debe cumplir la solucion" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
lim: "Limitaciones\nrecursos, tiempo, tecnologia, regulacion" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}
ok: "Idea viable\nlista para modelar" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
no: "Revisitar\no descartar" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}

idea2 -> req
idea2 -> lim
req -> ok: "cumple"
lim -> ok: "factible"
lim -> no: "no factible" {style.stroke-dash: 4}
```

---

## Unidad 3 · Modelo de Negocio y Experimentación

### ¿Qué es un modelo de negocio?

Un **modelo de negocio** describe cómo una empresa crea, entrega y captura valor. La herramienta más usada es el **Business Model Canvas (BMC)** de Osterwalder.

```d2
direction: right

bmc: "Business Model Canvas" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}

socios: "Socios clave\nquienes nos ayudan" {style.fill: "#f1f5f9"; style.stroke: "#94a3b8"}
activ: "Actividades clave\nque hacemos" {style.fill: "#f1f5f9"; style.stroke: "#94a3b8"}
recursos: "Recursos clave\ncon que contamos" {style.fill: "#f1f5f9"; style.stroke: "#94a3b8"}
pv: "Propuesta de valor\npor que nos eligen" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
rel: "Relacion con clientes\ncomo interactuamos" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
canales: "Canales\ncomo llegamos al cliente" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
segmentos: "Segmento de clientes\na quien le servimos" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
costos: "Estructura de costos" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}
ingresos: "Fuentes de ingresos" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}

bmc -> socios
bmc -> activ
bmc -> recursos
bmc -> pv
bmc -> rel
bmc -> canales
bmc -> segmentos
bmc -> costos
bmc -> ingresos
```

---

### Experimentación con usuarios — ciclo Build-Measure-Learn

La experimentación sirve para **validar suposiciones** antes de invertir recursos en construir el producto completo.

```d2
direction: right

build: "BUILD\nConstruir prototipo\no instrumento" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}
measure: "MEASURE\nTestar con usuarios\nreales" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
learn: "LEARN\nAnalizar resultados\ne insights" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
ajuste: "Ajustar modelo\nde negocio" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}

build -> measure -> learn -> ajuste -> build: "iterar" {style.stroke-dash: 4}
```

**Tipos de prototipo:**
- **Papel** — boceto de interfaz o flujo, muy rápido y barato
- **MVP** (Minimum Viable Product) — versión mínima funcional
- **Maqueta física** — modelo 3D o simulación del producto

---

### Identificación de insights

Un **insight** es un aprendizaje profundo sobre el comportamiento o motivación del usuario, que no es obvio a primera vista.

> Ejemplo: Los usuarios no abandonan la app por falta de funciones, sino porque no entienden cómo empezar.

---

## Unidad 4 · Difusión y Formalización

### Propuesta de valor

La **propuesta de valor** responde: ¿por qué un cliente te elegiría a ti y no a la competencia?

```d2
direction: down

pv2: "Propuesta de Valor" {style.fill: "#fef9c3"; style.stroke: "#eab308"}

dolor: "Alivia un dolor\ndel cliente" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}
ganancia: "Genera una ganancia\nnueva para el cliente" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
trabajo: "Ayuda a completar\nun trabajo / tarea" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}

pv2 -> dolor
pv2 -> ganancia
pv2 -> trabajo
```

---

### Formalización de empresa en Chile

Para crear una empresa en Chile, los pasos principales son:

```d2
direction: down

f1: "1. Elegir tipo de empresa\nSpA, SRL, SA, EM" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}
f2: "2. Escritura publica\nnotaria o tuempresa.cl" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
f3: "3. RUT empresa\nSII" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
f4: "4. Inicio de actividades\nSII" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
f5: "5. Patente comercial\nMunicipalidad" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}

f1 -> f2 -> f3 -> f4 -> f5
```

| Tipo | Característica |
|---|---|
| **SpA** | Sociedad por Acciones — la más común para startups |
| **SRL** | Sociedad de Responsabilidad Limitada |
| **EM** | Empresa Individual — 1 persona, responsabilidad limitada |

---

### Metodología Pitch

El **pitch** es una presentación corta (2–5 min) para convencer a inversores, clientes o jurado de que tu idea vale la pena.

```d2
direction: down

p1: "1. Hook\nafirmacion o pregunta que engancha" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}
p2: "2. Problema\nel dolor real del usuario" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}
p3: "3. Solucion\ntu propuesta de valor" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
p4: "4. Modelo de negocio\ncomo ganas dinero" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
p5: "5. Traccion\nevidence que funciona (datos, usuarios)" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
p6: "6. Llamado a accion\nque necesitas del oyente" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}

p1 -> p2 -> p3 -> p4 -> p5 -> p6
```

**Claves de un buen pitch:**
- Hablar del **problema antes que de la solución**
- Usar datos concretos, no suposiciones
- Practicar hasta que fluya natural
- Adaptar el mensaje según la audiencia (inversor, cliente, jurado)

---

## Resumen del ciclo completo

```d2
direction: right

necesidad: "Necesidad\ndel usuario" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}
problema: "Problema\ndefinido" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}
idea3: "Idea\nvalidada" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
modelo2: "Modelo\nde negocio" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
empresa: "Empresa\nformalizada" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}

necesidad -> problema -> idea3 -> modelo2 -> empresa
```

---

*Referencia clave: Business Model Canvas — Osterwalder (2019) · Lean Startup — Eric Ries (2013)*
