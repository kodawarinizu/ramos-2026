# Fundamentos de Seguridad de la Información — TI3034
> Guía de estudio: triada CIA, legislación, vulnerabilidades y matriz de riesgo

---

## Mapa general del ramo

![Diagrama 1](img/seguridad_informacion_TI3034_1.svg)


---

## Unidad 1 · Seguridad de la Información

### ¿Qué es la seguridad de la información?

La **seguridad de la información** protege los datos en cualquier forma (digital, papel, verbal). La **seguridad informática** es más específica: protege los sistemas y redes digitales.

![Diagrama 2](img/seguridad_informacion_TI3034_2.svg)


---

### La Triada CIA

El fundamento de toda seguridad de la información. Cada control o política que implementes debe apuntar a uno o más de estos tres pilares.

![Diagrama 3](img/seguridad_informacion_TI3034_3.svg)


| Pilar | Amenaza típica | Control típico |
|---|---|---|
| **Confidencialidad** | Robo de datos, sniffing | Cifrado, control de acceso |
| **Integridad** | Modificación no autorizada | Hashes, firmas digitales |
| **Disponibilidad** | DDoS, fallas de hardware | Redundancia, backups |

**Ejemplo real:** El ataque al Banco de Chile (2018) afectó principalmente la **disponibilidad** — se inhabilitaron sistemas para distraer mientras se transferían fondos.

---

### Framework ISO 27001:2022

**ISO 27001** es el estándar internacional para implementar un **SGSI** (Sistema de Gestión de Seguridad de la Información).

![Diagrama 4](img/seguridad_informacion_TI3034_4.svg)


---

### CIS Controls

Los **CIS Controls** son 18 controles priorizados para reducir los riesgos más comunes. Están ordenados por impacto: los primeros son los más críticos.

![Diagrama 5](img/seguridad_informacion_TI3034_5.svg)


Ejemplos de controles básicos: inventario de hardware, inventario de software, gestión de configuraciones, control de acceso privilegiado.

---

## Unidad 2 · Ética y Legislación

### Marco legal chileno

![Diagrama 6](img/seguridad_informacion_TI3034_6.svg)


**Delitos tipificados en Ley 21.459:**
- Acceso ilícito a sistemas informáticos
- Interceptación ilícita
- Ataque a la integridad de datos
- Ataque a la integridad de sistemas
- Abuso de dispositivos

---

### Marcos internacionales

| Marco | Origen | Propósito |
|---|---|---|
| **Convenio de Budapest** | Consejo de Europa | Armonizar leyes de cibercrimen entre países |
| **GDPR** | Unión Europea | Protección de datos personales de ciudadanos europeos |
| **HIPAA** | EE.UU. | Protección de datos de salud |
| **PCI DSS** | Industria financiera | Seguridad en procesamiento de tarjetas de pago |

---

### Casos emblemáticos nacionales

![Diagrama 7](img/seguridad_informacion_TI3034_7.svg)


**Lección común:** los tres casos involucran fallas en **confidencialidad** y ausencia de controles básicos que ISO 27001 y CIS Controls contemplan.

---

## Unidad 3 · Evaluación de Vulnerabilidades y Matriz de Riesgo

### Conceptos clave: activo, amenaza, vulnerabilidad, riesgo

![Diagrama 8](img/seguridad_informacion_TI3034_8.svg)


**Fórmula del riesgo:**
> Riesgo = Probabilidad de ocurrencia × Impacto potencial

---

### Clasificación de activos TI

![Diagrama 9](img/seguridad_informacion_TI3034_9.svg)


---

### CVSS — Common Vulnerability Scoring System

**CVSS** es el estándar para cuantificar la severidad de una vulnerabilidad con un puntaje del 0 al 10.

![Diagrama 10](img/seguridad_informacion_TI3034_10.svg)


**Factores que afectan el puntaje:** vector de ataque, complejidad, privilegios requeridos, interacción del usuario, impacto en CIA.

---

### Vulnerabilidades comunes — DVWA

El ramo usa **DVWA (Damn Vulnerable Web Application)** sobre Metasploitable para practicar en entorno controlado con Kali Linux.

![Diagrama 11](img/seguridad_informacion_TI3034_11.svg)


---

### Matriz de Riesgo — Mapa de Calor

La **matriz de riesgo** cruza **probabilidad** e **impacto** para priorizar qué vulnerabilidades atender primero.

![Diagrama 12](img/seguridad_informacion_TI3034_12.svg)


---

### Controles de mitigación

Una vez identificados los riesgos, se proponen controles para reducirlos:

![Diagrama 13](img/seguridad_informacion_TI3034_13.svg)


---

### Framework NIST CSF — 5 funciones

El **NIST Cybersecurity Framework** organiza la seguridad en 5 funciones que se alinean con el ciclo anterior:

![Diagrama 14](img/seguridad_informacion_TI3034_14.svg)


---

### Disaster Recovery

Un plan de **Disaster Recovery (DR)** define cómo recuperar los sistemas críticos ante un incidente mayor.

| Concepto | Definición |
|---|---|
| **RTO** (Recovery Time Objective) | Tiempo máximo aceptable para recuperar el sistema |
| **RPO** (Recovery Point Objective) | Pérdida máxima de datos aceptable en tiempo |
| **BCP** | Business Continuity Plan — plan más amplio de continuidad |

---

## Resumen de frameworks y leyes

![Diagrama 15](img/seguridad_informacion_TI3034_15.svg)


---

*Herramientas de laboratorio: Kali Linux · Metasploitable · DVWA · CVSS Calculator*
*Referencia: [NIST CSF](https://www.cisa.gov/resources-tools/resources/framework-improving-critical-infrastructure-cybersecurity) · [iso27000.es](http://www.iso27000.es)*
