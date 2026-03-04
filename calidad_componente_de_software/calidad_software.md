# Calidad de Componentes de Software — TILE11
> Guía de estudio: estándares, procesos, métricas y testing

---

## Mapa general del ramo

![Diagrama 1](img/calidad_software_1.svg)


---

## Unidad 1 · Fundamentos de Calidad y Estándares

### ¿Qué es la calidad de software?

La **calidad de software** es el grado en que un sistema satisface los requisitos especificados y las necesidades del usuario. No es solo que "funcione" — incluye mantenibilidad, seguridad, eficiencia y usabilidad.

![Diagrama 2](img/calidad_software_2.svg)


---

### Principios de calidad de software

- **Prevención sobre corrección** — es más barato evitar defectos que corregirlos
- **Visibilidad** — el estado de calidad debe ser medible y visible
- **Responsabilidad** — cada integrante del equipo es responsable de la calidad
- **Mejora continua** — los procesos deben revisarse y mejorar constantemente

---

### Gestión del proceso SQA

**SQA (Software Quality Assurance)** es el conjunto de actividades sistemáticas que garantizan que el proceso de desarrollo cumple con los estándares definidos.

![Diagrama 3](img/calidad_software_3.svg)


---

### Estándares de calidad

| Estándar | Propósito |
|---|---|
| **ISO/IEC 25010** | Modelo de calidad del producto software (8 características) |
| **ISO 33000** | Evaluación de procesos de software |
| **CMMI** | Madurez y capacidad de procesos (niveles 1–5) |

**Niveles CMMI:**

![Diagrama 4](img/calidad_software_4.svg)


---

## Unidad 2 · Procesos de Calidad, Modelos y Métricas

### Los tres pilares: QM, QA y QC

![Diagrama 5](img/calidad_software_5.svg)


| Concepto | Qué hace | Cuándo |
|---|---|---|
| **QM** | Define la política y objetivos de calidad | Nivel estratégico |
| **QA** | Asegura que el proceso siga los estándares | Durante el desarrollo |
| **QC** | Verifica que el producto cumpla los requisitos | Al final de cada fase |

---

### Métricas de producto

Las métricas miden atributos del **producto final** (el código o sistema):

![Diagrama 6](img/calidad_software_6.svg)


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

![Diagrama 7](img/calidad_software_7.svg)


- **Verificación** → revisión de código, inspecciones, walkthroughs (sin ejecutar)
- **Validación** → testing con ejecución real del software

---

### Técnicas de Testing

![Diagrama 8](img/calidad_software_8.svg)


---

### Inspección de Software

La **inspección** es una revisión formal del código o documentos **sin ejecutarlos**. Busca defectos antes de que lleguen a testing.

![Diagrama 9](img/calidad_software_9.svg)


---

### Proceso de Gestión del Cambio

![Diagrama 10](img/calidad_software_10.svg)


---

## Resumen de conceptos clave

![Diagrama 11](img/calidad_software_11.svg)


---

*Estándares de referencia: ISO/IEC 25010 · ISO 33000 · CMMI · IEEE 829*
