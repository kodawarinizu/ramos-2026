# Calidad de Componentes de Software — TILE11
> Guía de estudio: estándares, procesos, métricas y testing

---

## Mapa general del ramo

```d2
direction: right

u1: "Unidad 1\nFundamentos y Estándares" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}
u2: "Unidad 2\nProcesos y Métricas" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
u3: "Unidad 3\nVerificación y Validación" {style.fill: "#fef9c3"; style.stroke: "#eab308"}

u1 -> u2 -> u3
```

---

## Unidad 1 · Fundamentos de Calidad y Estándares

### ¿Qué es la calidad de software?

La **calidad de software** es el grado en que un sistema satisface los requisitos especificados y las necesidades del usuario. No es solo que "funcione" — incluye mantenibilidad, seguridad, eficiencia y usabilidad.

```d2
direction: down

calidad: "Calidad de Software" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}

func: "Funcionalidad\n¿hace lo que debe?" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
conf: "Confiabilidad\n¿falla poco?" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
usab: "Usabilidad\n¿es fácil de usar?" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
efic: "Eficiencia\n¿usa bien los recursos?" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
mant: "Mantenibilidad\n¿es fácil modificar?" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
port: "Portabilidad\n¿funciona en otros entornos?" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}

calidad -> func
calidad -> conf
calidad -> usab
calidad -> efic
calidad -> mant
calidad -> port
```

---

### Principios de calidad de software

- **Prevención sobre corrección** — es más barato evitar defectos que corregirlos
- **Visibilidad** — el estado de calidad debe ser medible y visible
- **Responsabilidad** — cada integrante del equipo es responsable de la calidad
- **Mejora continua** — los procesos deben revisarse y mejorar constantemente

---

### Gestión del proceso SQA

**SQA (Software Quality Assurance)** es el conjunto de actividades sistemáticas que garantizan que el proceso de desarrollo cumple con los estándares definidos.

```d2
direction: right

plan: "Planificar\nqué estándares aplicar" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}
exec: "Ejecutar\nseguir el proceso" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
audit: "Auditar\nrevisar cumplimiento" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
report: "Reportar\ncomunicar resultados" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
mejora: "Mejorar\ncorregir desviaciones" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}

plan -> exec -> audit -> report -> mejora -> plan: "ciclo continuo" {style.stroke-dash: 4}
```

---

### Estándares de calidad

| Estándar | Propósito |
|---|---|
| **ISO/IEC 25010** | Modelo de calidad del producto software (8 características) |
| **ISO 33000** | Evaluación de procesos de software |
| **CMMI** | Madurez y capacidad de procesos (niveles 1–5) |

**Niveles CMMI:**

```d2
direction: down

n5: "Nivel 5: Optimizado\nmejora continua basada en datos" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
n4: "Nivel 4: Gestionado Cuantitativamente\nmétricas y control estadístico" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}
n3: "Nivel 3: Definido\nprocesos documentados y estandarizados" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
n2: "Nivel 2: Gestionado\nproyectos planificados y seguidos" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
n1: "Nivel 1: Inicial\ncaótico, sin procesos formales" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}

n1 -> n2 -> n3 -> n4 -> n5
```

---

## Unidad 2 · Procesos de Calidad, Modelos y Métricas

### Los tres pilares: QM, QA y QC

```d2
direction: right

qm: "QM\nQuality Management\nGestión de Calidad" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}
qa: "QA\nQuality Assurance\nAseguramiento de Calidad" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
qc: "QC\nQuality Control\nControl de Calidad" {style.fill: "#fef9c3"; style.stroke: "#eab308"}

qm -> qa: "define políticas"
qm -> qc: "define estándares"
qa -> qc: "asegura el proceso\npara obtener..."
```

| Concepto | Qué hace | Cuándo |
|---|---|---|
| **QM** | Define la política y objetivos de calidad | Nivel estratégico |
| **QA** | Asegura que el proceso siga los estándares | Durante el desarrollo |
| **QC** | Verifica que el producto cumpla los requisitos | Al final de cada fase |

---

### Métricas de producto

Las métricas miden atributos del **producto final** (el código o sistema):

```d2
direction: down

mp: "Métricas de Producto" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}

comp: "Complejidad ciclomática\ncantidad de caminos lógicos en el código" {style.fill: "#f1f5f9"; style.stroke: "#94a3b8"}
cob: "Cobertura de pruebas\n% de código ejecutado por tests" {style.fill: "#f1f5f9"; style.stroke: "#94a3b8"}
defdens: "Densidad de defectos\ndefectos por cada 1000 líneas" {style.fill: "#f1f5f9"; style.stroke: "#94a3b8"}
leg: "Legibilidad\nfacilidad de leer y entender el código" {style.fill: "#f1f5f9"; style.stroke: "#94a3b8"}

mp -> comp
mp -> cob
mp -> defdens
mp -> leg
```

**Ejemplo — complejidad ciclomática:**
> Si una función tiene 1 `if`, 1 `else` y 1 `for`, su complejidad ciclomática es **4** (número de caminos posibles). Valores > 10 indican código difícil de testear.

---

### Métricas de proceso

Las métricas miden la **eficiencia del proceso** de desarrollo:

| Métrica | Qué mide |
|---|---|
| Velocidad de desarrollo | Líneas de código / horas trabajadas |
| Tasa de defectos | Defectos encontrados / defectos totales |
| Tiempo de corrección | Horas promedio para resolver un bug |
| Costo de calidad | Costo prevención + evaluación + fallos |

---

## Unidad 3 · Verificación, Validación y Testing

### Verificación vs Validación

```d2
direction: right

ver: "Verificación\n¿Estamos construyendo\nel producto correctamente?" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}
val: "Validación\n¿Estamos construyendo\nel producto correcto?" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}

ver -> val: "proceso completo\nde aseguramiento"
```

- **Verificación** → revisión de código, inspecciones, walkthroughs (sin ejecutar)
- **Validación** → testing con ejecución real del software

---

### Técnicas de Testing

```d2
direction: down

testing: "Testing" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}

caja_blanca: "Caja Blanca\nconoce el código interno" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
caja_negra: "Caja Negra\nsolo entrada y salida" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
caja_gris: "Caja Gris\nconocimiento parcial" {style.fill: "#fef9c3"; style.stroke: "#eab308"}

testing -> caja_blanca
testing -> caja_negra
testing -> caja_gris

unit: "Unit Testing\nfunción por función" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
integ: "Integration Testing\nmódulos combinados" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
sistem: "System Testing\nsistema completo" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
acept: "Acceptance Testing\nvalidación con el cliente" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}

caja_blanca -> unit
caja_negra -> integ
caja_negra -> sistem
caja_negra -> acept
```

---

### Inspección de Software

La **inspección** es una revisión formal del código o documentos **sin ejecutarlos**. Busca defectos antes de que lleguen a testing.

```d2
direction: right

plan: "Planificación\nseleccionar artefacto" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}
prep: "Preparación\ncada revisor lee por su cuenta" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
reunion: "Reunión de inspección\ndiscutir hallazgos" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
retrab: "Retrabajo\nautora corrige defectos" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}
seguim: "Seguimiento\nverificar correcciones" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}

plan -> prep -> reunion -> retrab -> seguim
```

---

### Proceso de Gestión del Cambio

```d2
direction: down

solicitud: "Solicitud de cambio (CR)" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}
analisis: "Análisis de impacto\n¿qué afecta el cambio?" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
aprobacion: "Aprobación o rechazo" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
implementacion: "Implementación del cambio" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
testing: "Testing de regresión\nverificar que nada se rompió" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
cierre: "Cierre y documentación" {style.fill: "#f1f5f9"; style.stroke: "#94a3b8"}

rechazo: "Cambio rechazado\ndocumentar razón" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}

solicitud -> analisis -> aprobacion
aprobacion -> implementacion: "aprobado"
aprobacion -> rechazo: "rechazado" {style.stroke-dash: 4}
implementacion -> testing -> cierre
```

---

## Resumen de conceptos clave

```d2
direction: right

sqa: "SQA" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}

qm2: "QM\ngestión" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
qa2: "QA\naseguramiento" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
qc2: "QC\ncontrol" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}

sqa -> qm2
sqa -> qa2
sqa -> qc2

metricas: "Métricas\nproducto y proceso" {style.fill: "#f1f5f9"; style.stroke: "#94a3b8"}
testing2: "Testing\nV y V" {style.fill: "#f1f5f9"; style.stroke: "#94a3b8"}
inspeccion: "Inspección\nrevisión formal" {style.fill: "#f1f5f9"; style.stroke: "#94a3b8"}

qm2 -> metricas
qa2 -> inspeccion
qc2 -> testing2
```

---

*Estándares de referencia: ISO/IEC 25010 · ISO 33000 · CMMI · IEEE 829*
