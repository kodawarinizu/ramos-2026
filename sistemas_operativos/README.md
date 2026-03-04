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
