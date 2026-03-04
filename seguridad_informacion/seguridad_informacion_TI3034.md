# Fundamentos de Seguridad de la Información — TI3034
> Guía de estudio: triada CIA, legislación, vulnerabilidades y matriz de riesgo

---

## Mapa general del ramo

```d2
direction: right

u1: "Unidad 1\nSeguridad de la\nInformacion" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}
u2: "Unidad 2\nEtica y\nLegislacion" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
u3: "Unidad 3\nVulnerabilidades\ny Matriz de Riesgo" {style.fill: "#fef9c3"; style.stroke: "#eab308"}

u1 -> u2 -> u3
```

---

## Unidad 1 · Seguridad de la Información

### ¿Qué es la seguridad de la información?

La **seguridad de la información** protege los datos en cualquier forma (digital, papel, verbal). La **seguridad informática** es más específica: protege los sistemas y redes digitales.

```d2
direction: right

si: "Seguridad de la Informacion\n(mas amplia)" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}
sinfo: "Seguridad Informatica\n(subset digital)" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}

si -> sinfo: "incluye"
```

---

### La Triada CIA

El fundamento de toda seguridad de la información. Cada control o política que implementes debe apuntar a uno o más de estos tres pilares.

```d2
direction: down

cia: "Triada CIA" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}

conf: "Confidencialidad\nsolo quienes deben pueden acceder" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
integ: "Integridad\nlos datos no han sido alterados" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
disp: "Disponibilidad\nel sistema esta accesible cuando se necesita" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}

cia -> conf
cia -> integ
cia -> disp
```

| Pilar | Amenaza típica | Control típico |
|---|---|---|
| **Confidencialidad** | Robo de datos, sniffing | Cifrado, control de acceso |
| **Integridad** | Modificación no autorizada | Hashes, firmas digitales |
| **Disponibilidad** | DDoS, fallas de hardware | Redundancia, backups |

**Ejemplo real:** El ataque al Banco de Chile (2018) afectó principalmente la **disponibilidad** — se inhabilitaron sistemas para distraer mientras se transferían fondos.

---

### Framework ISO 27001:2022

**ISO 27001** es el estándar internacional para implementar un **SGSI** (Sistema de Gestión de Seguridad de la Información).

```d2
direction: down

sgsi: "SGSI — ISO 27001" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}

contexto: "4. Contexto de la organizacion\npartes interesadas y alcance" {style.fill: "#f1f5f9"; style.stroke: "#94a3b8"}
liderazgo: "5. Liderazgo\ncompromiso de la alta direccion" {style.fill: "#f1f5f9"; style.stroke: "#94a3b8"}
planif: "6. Planificacion\nriesgos y objetivos" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
soporte: "7. Soporte\nrecursos, competencias, comunicacion" {style.fill: "#f1f5f9"; style.stroke: "#94a3b8"}
operacion: "8. Operacion\nimplementar controles" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
evaluacion: "9. Evaluacion del desempeno\nauditorias internas" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
mejora: "10. Mejora\nacciones correctivas" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}

sgsi -> contexto -> liderazgo -> planif -> soporte -> operacion -> evaluacion -> mejora
```

---

### CIS Controls

Los **CIS Controls** son 18 controles priorizados para reducir los riesgos más comunes. Están ordenados por impacto: los primeros son los más críticos.

```d2
direction: right

basicos: "Controles Basicos\n(1-6)\nHigiene esencial" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}
fundament: "Controles Fundamentales\n(7-16)\nDefensa en profundidad" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
organizac: "Controles Organizacionales\n(17-18)\nGobierno y formacion" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}

basicos -> fundament -> organizac
```

Ejemplos de controles básicos: inventario de hardware, inventario de software, gestión de configuraciones, control de acceso privilegiado.

---

## Unidad 2 · Ética y Legislación

### Marco legal chileno

```d2
direction: down

chile: "Legislacion Chilena\nCiberseguridad" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}

l19223: "Ley 19.223 (1993)\nprimera ley de delitos informaticos\ndesfasada tecnologicamente" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}
l21459: "Ley 21.459 (2022)\nnueva ley de delitos informaticos\nalineada con Convenio de Budapest" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
l19628: "Ley 19.628\nproteccion de datos personales\n(en proceso de actualizacion a LPDP)" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
cibdef: "Politica Nacional\nde Ciberdefensa" {style.fill: "#f1f5f9"; style.stroke: "#94a3b8"}

chile -> l19223
l19223 -> l21459: "reemplaza"
chile -> l19628
chile -> cibdef
```

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

```d2
direction: down

casos: "Casos de Estudio" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}

banco: "Banco de Chile 2018\nmalware SWIFT\nrobo de 10 millones USD" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}
servel: "Servel 2017\nfiltracion de datos\n14 millones de registros" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}
equifax: "Equifax 2017\nbrecha de datos masiva\n147 millones de personas" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}

casos -> banco
casos -> servel
casos -> equifax
```

**Lección común:** los tres casos involucran fallas en **confidencialidad** y ausencia de controles básicos que ISO 27001 y CIS Controls contemplan.

---

## Unidad 3 · Evaluación de Vulnerabilidades y Matriz de Riesgo

### Conceptos clave: activo, amenaza, vulnerabilidad, riesgo

```d2
direction: right

activo: "Activo\nlo que tiene valor\npara la organizacion" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}
amenaza: "Amenaza\nevento que puede\ndañar el activo" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}
vuln: "Vulnerabilidad\ndebilidad que permite\nque la amenaza ocurra" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
riesgo: "Riesgo\nprobabilidad x impacto" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}

activo -> amenaza: "expuesto a"
amenaza -> vuln: "explota"
vuln -> riesgo: "genera"
```

**Fórmula del riesgo:**
> Riesgo = Probabilidad de ocurrencia × Impacto potencial

---

### Clasificación de activos TI

```d2
direction: down

activos: "Activos TI" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}

hw: "Hardware\nservidores, PCs, routers" {style.fill: "#f1f5f9"; style.stroke: "#94a3b8"}
sw: "Software\nOS, aplicaciones, BD" {style.fill: "#f1f5f9"; style.stroke: "#94a3b8"}
datos: "Datos\nBD clientes, configs, backups" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
rrhh: "Personas\nadmins, usuarios, terceros" {style.fill: "#f1f5f9"; style.stroke: "#94a3b8"}
infra: "Infraestructura\nred, electricidad, instalaciones" {style.fill: "#f1f5f9"; style.stroke: "#94a3b8"}

activos -> hw
activos -> sw
activos -> datos
activos -> rrhh
activos -> infra
```

---

### CVSS — Common Vulnerability Scoring System

**CVSS** es el estándar para cuantificar la severidad de una vulnerabilidad con un puntaje del 0 al 10.

```d2
direction: right

none: "None\n0.0" {style.fill: "#f1f5f9"; style.stroke: "#94a3b8"}
low: "Low\n0.1 - 3.9" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
medium: "Medium\n4.0 - 6.9" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
high: "High\n7.0 - 8.9" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}
critical: "Critical\n9.0 - 10.0" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}

none -> low -> medium -> high -> critical
```

**Factores que afectan el puntaje:** vector de ataque, complejidad, privilegios requeridos, interacción del usuario, impacto en CIA.

---

### Vulnerabilidades comunes — DVWA

El ramo usa **DVWA (Damn Vulnerable Web Application)** sobre Metasploitable para practicar en entorno controlado con Kali Linux.

```d2
direction: down

dvwa: "DVWA\nAmbiente de practica" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}

sqli: "SQL Injection\ninyectar SQL en campos de entrada\npara acceder a la BD" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}
xss: "XSS (Cross-Site Scripting)\ninyectar JavaScript en paginas\npara robar sesiones" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}
cmdi: "Command Injection\ninyectar comandos del OS\nvia formularios web" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}

dvwa -> sqli
dvwa -> xss
dvwa -> cmdi
```

---

### Matriz de Riesgo — Mapa de Calor

La **matriz de riesgo** cruza **probabilidad** e **impacto** para priorizar qué vulnerabilidades atender primero.

```d2
direction: down

matriz: "Matriz de Riesgo\nProbabilidad x Impacto" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}

critico: "Riesgo CRITICO\nalto impacto + alta probabilidad\naccion inmediata" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}
alto: "Riesgo ALTO\nalto impacto o alta probabilidad\naccion prioritaria" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}
medio: "Riesgo MEDIO\nmonitorear y planificar\nmitigacion" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
bajo: "Riesgo BAJO\naceptar o monitorear\nperiodicamente" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}

matriz -> critico
matriz -> alto
matriz -> medio
matriz -> bajo
```

---

### Controles de mitigación

Una vez identificados los riesgos, se proponen controles para reducirlos:

```d2
direction: right

riesgo2: "Riesgo\nidentificado" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}

prev: "Prevenir\neliminar la causa\neg. parchear vulnerabilidad" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
detect: "Detectar\nidentificar si ocurre\neg. IDS, logs, alertas" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
resp: "Responder\nactuar cuando ocurre\neg. incident response" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
recup: "Recuperar\nvolver a la normalidad\neg. Disaster Recovery" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}

riesgo2 -> prev
riesgo2 -> detect
riesgo2 -> resp
riesgo2 -> recup
```

---

### Framework NIST CSF — 5 funciones

El **NIST Cybersecurity Framework** organiza la seguridad en 5 funciones que se alinean con el ciclo anterior:

```d2
direction: right

identify: "IDENTIFY\nconocer activos\ny riesgos" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}
protect: "PROTECT\nimplementar\ncontroles" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
detect2: "DETECT\nmonitorear\neventos" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
respond: "RESPOND\ngestionar\nincidentes" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}
recover: "RECOVER\nrestaurar\noperaciones" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}

identify -> protect -> detect2 -> respond -> recover
```

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

```d2
direction: down

seg: "Seguridad de la Informacion" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}

iso: "ISO 27001\nSGSI" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
cis: "CIS Controls\n18 controles priorizados" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
nist: "NIST CSF\nIdentify/Protect/Detect/Respond/Recover" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
ley: "Ley 21.459\ndelitos informaticos Chile" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
gdpr: "GDPR / PCI DSS\nnormas internacionales" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
cvss: "CVSS\nscoring vulnerabilidades" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}

seg -> iso
seg -> cis
seg -> nist
seg -> ley
seg -> gdpr
seg -> cvss
```

---

*Herramientas de laboratorio: Kali Linux · Metasploitable · DVWA · CVSS Calculator*
*Referencia: [NIST CSF](https://www.cisa.gov/resources-tools/resources/framework-improving-critical-infrastructure-cybersecurity) · [iso27000.es](http://www.iso27000.es)*
