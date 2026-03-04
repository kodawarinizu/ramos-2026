# Sistemas Operativos — TI3035
> Guía de estudio: TCP/IP, Windows Server y Linux Server

---

## Mapa general del ramo

```d2
direction: right

u1: "Unidad 1\nDireccionamiento TCP/IP" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}
u2: "Unidad 2\nWindows Server" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
u3: "Unidad 3\nLinux Server" {style.fill: "#fef9c3"; style.stroke: "#eab308"}

u1 -> u2 -> u3

aws: "AWS Academy\nEC2 / Cloud" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}
u2 -> aws
u3 -> aws
```

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

```d2
direction: down

ipv4: "Direcciones IPv4" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}

claseA: "Clase A\n1.0.0.0 - 126.255.255.255\nMascara /8  →  16 millones de hosts" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
claseB: "Clase B\n128.0.0.0 - 191.255.255.255\nMascara /16  →  65.534 hosts" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
claseC: "Clase C\n192.0.0.0 - 223.255.255.255\nMascara /24  →  254 hosts" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}
claseD: "Clase D\nMulticast\n224.0.0.0 - 239.255.255.255" {style.fill: "#f1f5f9"; style.stroke: "#94a3b8"}
claseE: "Clase E\nReservado\n240.0.0.0 - 255.255.255.255" {style.fill: "#f1f5f9"; style.stroke: "#94a3b8"}

ipv4 -> claseA
ipv4 -> claseB
ipv4 -> claseC
ipv4 -> claseD
ipv4 -> claseE
```

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

```d2
direction: down

red: "Red base\n192.168.1.0/24\n254 hosts disponibles" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}

s1: "Subred 1 /25\n126 hosts\noficina principal" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
s2: "Subred 2 /26\n62 hosts\nsucursal" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
s3: "Subred 3 /27\n30 hosts\nbodega" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}
s4: "Subred 4 /30\n2 hosts\nenlace punto a punto" {style.fill: "#f1f5f9"; style.stroke: "#94a3b8"}

red -> s1: "asignar primero\nla mas grande"
red -> s2
red -> s3
red -> s4
```

> **Regla VLSM:** siempre asignar primero la subred más grande para no fragmentar el espacio.

---

## Unidad 2 · Windows Server

### Configuración básica inicial

```d2
direction: down

inst: "Instalación Windows Server" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}
hostname: "Configurar hostname" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
ip: "Asignar IP estática" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
update: "Actualizaciones del OS" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
fw: "Reglas de Firewall" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
rdp: "Prueba RDP exitosa" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}

inst -> hostname -> ip -> update -> fw -> rdp
```

---

### Active Directory — estructura de dominio

**Active Directory (AD)** centraliza la administración de usuarios, equipos y políticas en un dominio Windows.

```d2
direction: down

dominio: "Dominio\nempresa.local" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}

ou1: "OU: Usuarios" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
ou2: "OU: Computadores" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
ou3: "OU: Grupos" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}

u1: "user1" {style.fill: "#f1f5f9"; style.stroke: "#94a3b8"}
u2: "user2" {style.fill: "#f1f5f9"; style.stroke: "#94a3b8"}
pc1: "PC-001" {style.fill: "#f1f5f9"; style.stroke: "#94a3b8"}
g1: "GrupoAdmin" {style.fill: "#f1f5f9"; style.stroke: "#94a3b8"}

dominio -> ou1
dominio -> ou2
dominio -> ou3
ou1 -> u1
ou1 -> u2
ou2 -> pc1
ou3 -> g1
```

---

### GPO — Group Policy Objects

Las **GPO** son políticas que se aplican automáticamente a usuarios y equipos del dominio al iniciar sesión. Sin tocar cada máquina manualmente.

Ejemplos: bloquear Panel de Control, mapear unidades de red, deshabilitar USB, configurar fondo corporativo.

```d2
direction: right

dc: "Domain Controller\nAD + GPO" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}
gpo: "GPO aplicada\nal iniciar sesion" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
pc: "Estacion de trabajo\nunida al dominio" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}

dc -> gpo -> pc: "politica aplicada"
```

---

### Servicios de infraestructura

| Servicio | Función |
|---|---|
| **DHCP** | Asigna IPs automáticamente a los equipos de la red |
| **DNS** | Traduce nombres (web.empresa.cl) a IPs |
| **IIS** | Servidor web — aloja sitios y aplicaciones |

---

### Hardenización de Windows Server

```d2
direction: down

hard: "Hardenizacion Windows" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}

fs: "Cifrar File System\nBitLocker / EFS" {style.fill: "#f1f5f9"; style.stroke: "#94a3b8"}
svc: "Deshabilitar servicios\nno utilizados" {style.fill: "#f1f5f9"; style.stroke: "#94a3b8"}
fw2: "Politicas de Firewall\nbloquer puertos innecesarios" {style.fill: "#f1f5f9"; style.stroke: "#94a3b8"}
upd: "Mantener actualizado\nOS y antivirus" {style.fill: "#f1f5f9"; style.stroke: "#94a3b8"}

hard -> fs
hard -> svc
hard -> fw2
hard -> upd
```

---

## Unidad 3 · Linux Server

### Las 4 Libertades del Software Libre

```d2
direction: down

sl: "Software Libre\nProyecto GNU" {style.fill: "#fef9c3"; style.stroke: "#eab308"}

l0: "Libertad 0\nUsar el programa con cualquier proposito" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
l1: "Libertad 1\nEstudiar y modificar el codigo fuente" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
l2: "Libertad 2\nDistribuir copias" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
l3: "Libertad 3\nDistribuir versiones modificadas" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}

sl -> l0
sl -> l1
sl -> l2
sl -> l3
```

| Concepto | Significado |
|---|---|
| **Copyright** | Control total del creador sobre su obra |
| **Copyleft** | Derivados deben mantener las mismas libertades (GPL) |
| **GPL** | Licencia GNU — copyleft fuerte |
| **MIT / BSD** | Licencias permisivas — sin copyleft |

---

### File System Linux

```d2
direction: down

root: "/" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}

bin: "/bin\nbinarios esenciales" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
etc: "/etc\nconfiguracion del sistema" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
home: "/home\nusuarios del sistema" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
var: "/var\nlogs y datos variables" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
tmp: "/tmp\narchivos temporales" {style.fill: "#f1f5f9"; style.stroke: "#94a3b8"}
usr: "/usr\naplicaciones instaladas" {style.fill: "#f1f5f9"; style.stroke: "#94a3b8"}

root -> bin
root -> etc
root -> home
root -> var
root -> tmp
root -> usr
```

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

```d2
direction: right

repo: "Repositorio\nservidor de paquetes" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}
pkg: "Gestor de paquetes" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
sys: "Sistema instalado" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}

repo -> pkg -> sys: "instala / actualiza"
```

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

```d2
direction: down

hardl: "Hardenizacion Linux" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}

av: "ClamAV\nantivirus open source" {style.fill: "#f1f5f9"; style.stroke: "#94a3b8"}
ark: "rkhunter / chkrootkit\ndeteccion de rootkits" {style.fill: "#f1f5f9"; style.stroke: "#94a3b8"}
fw3: "iptables / firewalld\nfirewall a nivel de kernel" {style.fill: "#f1f5f9"; style.stroke: "#94a3b8"}
upd2: "Actualizar paquetes\nyum update / apt upgrade" {style.fill: "#f1f5f9"; style.stroke: "#94a3b8"}
ssh: "Securizar SSH\ncambiar puerto, deshabilitar root" {style.fill: "#f1f5f9"; style.stroke: "#94a3b8"}

hardl -> av
hardl -> ark
hardl -> fw3
hardl -> upd2
hardl -> ssh
```

```bash
# /etc/ssh/sshd_config
Port 2222
PermitRootLogin no
PasswordAuthentication no
```

---

## Resumen comparativo

```d2
direction: right

windows: "Windows Server" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}
linux: "Linux Server" {style.fill: "#fef9c3"; style.stroke: "#eab308"}

wad: "AD / GPO\nDHCP / DNS / IIS" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
lad: "Archivos config\niptables / SSH / yum" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}

windows -> wad
linux -> lad

aws2: "AWS EC2\nambos en la nube" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}
wad -> aws2
lad -> aws2
```

---

*Plataforma práctica: [AWS Academy](https://www.awsacademy.com)*
