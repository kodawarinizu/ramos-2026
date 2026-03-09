# Sistemas Operativos — TI3035
> Guía de estudio: TCP/IP, Windows Server y Linux Server

---

## Mapa general del ramo

![Diagrama 1](img/sistemas_operativos_TI3035_1.svg)


---

## Unidad 1 · Direccionamiento de Redes TCP/IP

### ¿Qué es una dirección IP?

Una **dirección IP** es un identificador numérico único asignado a cada dispositivo en una red. Permite que los datos sepan a dónde ir — funciona como la dirección postal de tu casa, pero para equipos.

IPv4 usa **32 bits** divididos en 4 octetos:

```
192  .  168  .   1   .  10
8bits   8bits   8bits  8bits  = 32 bits totales
```

---

### Conversión de bases numéricas

#### Decimal a Binario

Divide el número decimal entre 2 sucesivamente y lee los restos de abajo hacia arriba.

**Ejemplo — 192 en binario:**
```
192 ÷ 2 = 96  resto 0
 96 ÷ 2 = 48  resto 0
 48 ÷ 2 = 24  resto 0
 24 ÷ 2 = 12  resto 0
 12 ÷ 2 =  6  resto 0
  6 ÷ 2 =  3  resto 0
  3 ÷ 2 =  1  resto 1
  1 ÷ 2 =  0  resto 1
                        ↑ leer de abajo hacia arriba
192 decimal = 11000000 binario
```

#### Binario a Decimal

Multiplica cada bit por su potencia de 2 según su posición (de derecha a izquierda desde 2⁰).

**Ejemplo — 11000000 en decimal:**
```
Posición: 7  6  5  4  3  2  1  0
Bit:      1  1  0  0  0  0  0  0

(1×2⁷) + (1×2⁶) + (0×2⁵) + ... + (0×2⁰)
= 128  +   64   +    0   + ... +    0
= 192
```

| Potencia | 2⁷ | 2⁶ | 2⁵ | 2⁴ | 2³ | 2² | 2¹ | 2⁰ |
|---|---|---|---|---|---|---|---|---|
| Valor | 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1 |

#### Decimal a Hexadecimal

Divide entre 16 y usa letras para los restos mayores a 9: A=10, B=11, C=12, D=13, E=14, F=15.

**Ejemplo — 192 en hexadecimal:**
```
192 ÷ 16 = 12  resto 0   → 0
 12 ÷ 16 =  0  resto 12  → C
                            ↑ leer de abajo hacia arriba
192 decimal = C0 hexadecimal
```

#### Binario a Hexadecimal

Agrupa los bits de a 4 (de derecha a izquierda) y convierte cada grupo a su valor hexadecimal.

**Ejemplo — 11000000 en hexadecimal:**
```
1100  0000
 ↓      ↓
 C      0

11000000 binario = C0 hexadecimal
```

**Tabla de referencia rápida:**

| Decimal | Binario | Hexadecimal |
|---|---|---|
| 0  | 0000 | 0 |
| 1  | 0001 | 1 |
| 2  | 0010 | 2 |
| 3  | 0011 | 3 |
| 4  | 0100 | 4 |
| 5  | 0101 | 5 |
| 6  | 0110 | 6 |
| 7  | 0111 | 7 |
| 8  | 1000 | 8 |
| 9  | 1001 | 9 |
| 10 | 1010 | A |
| 11 | 1011 | B |
| 12 | 1100 | C |
| 13 | 1101 | D |
| 14 | 1110 | E |
| 15 | 1111 | F |

> **Truco:** En redes, las IPs se expresan en decimal pero internamente operan en binario. Las MACs se expresan en hexadecimal (ej: `C0:A8:01:0A`).

---

### Clases de direcciones IPv4

![Diagrama 2](img/sistemas_operativos_TI3035_2.svg)


| Clase | Primer octeto | Máscara default | Hosts por red |
|---|---|---|---|
| A | 1–126 | 255.0.0.0 /8 | 16.777.214 |
| B | 128–191 | 255.255.0.0 /16 | 65.534 |
| C | 192–223 | 255.255.255.0 /24 | 254 |

---

### Conceptos clave por subred

Para cada subred debes identificar:

- **Network address** (inicio de red) — todos los bits de host en 0
- **Broadcast** — todos los bits de host en 1
- **Rango de hosts** — entre network y broadcast (excluyendo ambos)
- **Máscara** — define qué parte es red y qué parte es host

**Ejemplo — Clase C:**
```
Red:       192.168.1.0 /24
Mascara:   255.255.255.0
Hosts:     192.168.1.1  →  192.168.1.254
Broadcast: 192.168.1.255
Total hosts útiles: 254
```

---

### FLSM — Fixed Length Subnet Mask

Divide la red en subredes **del mismo tamaño**. Útil cuando todas las subredes necesitan la misma cantidad de hosts.

**Fórmula:**
- Subredes = $2^n$ donde $n$ = bits tomados del campo host
- Hosts por subred = $2^h - 2$ donde $h$ = bits de host restantes

**Ejemplo:** Dividir `192.168.1.0/24` en 4 subredes iguales → tomar 2 bits → máscara `/26`

| Subred | Network | Broadcast | Hosts útiles |
|---|---|---|---|
| 0 | 192.168.1.0 | 192.168.1.63 | .1 – .62 |
| 1 | 192.168.1.64 | 192.168.1.127 | .65 – .126 |
| 2 | 192.168.1.128 | 192.168.1.191 | .129 – .190 |
| 3 | 192.168.1.192 | 192.168.1.255 | .193 – .254 |

---

### VLSM — Variable Length Subnet Mask

Divide la red en subredes de **tamaños distintos** según la necesidad real de cada segmento.

![Diagrama 3](img/sistemas_operativos_TI3035_3.svg)


> **Regla VLSM:** siempre asignar primero la subred más grande para no fragmentar el espacio.

---

## Unidad 2 · Windows Server

### Configuración básica inicial

![Diagrama 4](img/sistemas_operativos_TI3035_4.svg)


---

### Active Directory — estructura de dominio

**Active Directory (AD)** centraliza la administración de usuarios, equipos y políticas en un dominio Windows.

![Diagrama 5](img/sistemas_operativos_TI3035_5.svg)


---

### GPO — Group Policy Objects

Las **GPO** son políticas que se aplican automáticamente a usuarios y equipos del dominio al iniciar sesión. Sin tocar cada máquina manualmente.

Ejemplos: bloquear Panel de Control, mapear unidades de red, deshabilitar USB, configurar fondo corporativo.

![Diagrama 6](img/sistemas_operativos_TI3035_6.svg)


---

### Servicios de infraestructura

| Servicio | Función |
|---|---|
| **DHCP** | Asigna IPs automáticamente a los equipos de la red |
| **DNS** | Traduce nombres (web.empresa.cl) a IPs |
| **IIS** | Servidor web — aloja sitios y aplicaciones |

---

### Hardenización de Windows Server

![Diagrama 7](img/sistemas_operativos_TI3035_7.svg)


---

## Unidad 3 · Linux Server

### Las 4 Libertades del Software Libre

![Diagrama 8](img/sistemas_operativos_TI3035_8.svg)


| Concepto | Significado |
|---|---|
| **Copyright** | Control total del creador sobre su obra |
| **Copyleft** | Derivados deben mantener las mismas libertades (GPL) |
| **GPL** | Licencia GNU — copyleft fuerte |
| **MIT / BSD** | Licencias permisivas — sin copyleft |

---

### File System Linux

![Diagrama 9](img/sistemas_operativos_TI3035_9.svg)


---

### Permisos en Linux

Cada archivo tiene permisos para 3 entidades: **propietario (u)**, **grupo (g)** y **otros (o)**.

```
-rwxr-xr--
 propietario: rwx = 7
 grupo:       r-x = 5
 otros:       r-- = 4
```

```bash
chmod 755 archivo        # rwxr-xr-x
chmod u+x script.sh      # agregar ejecución al propietario
chown usuario:grupo archivo
```

**Permisos especiales:**
- `SUID` — ejecuta con permisos del propietario del archivo
- `SGID` — hereda grupo del directorio padre
- `Sticky bit` — solo el propietario puede borrar sus archivos (usado en `/tmp`)

---

### Gestores de paquetes

![Diagrama 10](img/sistemas_operativos_TI3035_10.svg)


| Distro | Gestor | Ejemplo |
|---|---|---|
| RHEL / CentOS | `yum` / `dnf` | `yum install httpd -y` |
| Debian / Ubuntu | `apt` | `apt install nginx` |
| Arch Linux | `pacman` | `pacman -S nginx` |

```bash
yum update -y        # actualizar todo el sistema
yum install httpd    # instalar Apache
rpm -qa              # listar paquetes instalados
```

---

### Hardenización de Linux Server

![Diagrama 11](img/sistemas_operativos_TI3035_11.svg)


```bash
# /etc/ssh/sshd_config
Port 2222
PermitRootLogin no
PasswordAuthentication no
```

---

## Resumen comparativo

![Diagrama 12](img/sistemas_operativos_TI3035_12.svg)


---

*Plataforma práctica: [AWS Academy](https://www.awsacademy.com)*
