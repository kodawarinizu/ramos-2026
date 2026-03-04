# Bases de Datos No Estructuradas — TI3032
> Guía de estudio: NoSQL, MongoDB, CRUD y búsqueda avanzada

---

## Mapa general del ramo

```d2
direction: right

u1: "Unidad 1\nIntroducción\nNoSQL vs SQL" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}
u2: "Unidad 2\nOperaciones\nCRUD" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
u3: "Unidad 3\nBúsqueda\nAvanzada" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
u4: "Unidad 4\nProyecto\nIntegrador" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}

u1 -> u2 -> u3 -> u4
```

---

## Unidad 1 · Introducción a NoSQL

### ¿Por qué existe NoSQL?

Las bases de datos relacionales (SQL) guardan datos en **tablas con filas y columnas fijas**. Funcionan bien para datos estructurados, pero tienen problemas cuando:

- Los datos no tienen forma fija (redes sociales, logs, sensores)
- Se necesita escalar a millones de registros
- La estructura cambia frecuentemente durante el desarrollo

NoSQL ("Not Only SQL") nació para resolver esos casos.

---

### SQL vs NoSQL — comparación

```d2
direction: right

sql: "Base de Datos SQL" {
  style.fill: "#dbeafe"
  style.stroke: "#3b82f6"
  t: "Tablas"
  f: "Filas (registros)"
  c: "Columnas (campos fijos)"
  t -> f -> c
}

nosql: "Base de Datos NoSQL" {
  style.fill: "#dcfce7"
  style.stroke: "#22c55e"
  col: "Colecciones"
  doc: "Documentos (JSON)"
  field: "Campos flexibles"
  col -> doc -> field
}

sql -> nosql: "evoluciona hacia" {style.stroke-dash: 4}
```

| Concepto SQL | Equivalente MongoDB |
|---|---|
| Base de datos | Base de datos |
| Tabla | Colección |
| Fila | Documento |
| Columna | Campo |
| JOIN | Documento embebido / referencia |

---

### Tipos de bases de datos NoSQL

```d2
direction: down

nosql: "NoSQL" {style.fill: "#f1f5f9"; style.stroke: "#64748b"}

doc: "Documental\nMongoDB, CouchDB" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
kv: "Clave-Valor\nRedis, DynamoDB" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}
col: "Columnar\nCassandra, HBase" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
graph: "Grafos\nNeo4j" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}

nosql -> doc: "datos como JSON"
nosql -> kv: "diccionario simple"
nosql -> col: "grandes volúmenes"
nosql -> graph: "relaciones complejas"
```

---

### Estructura de un documento MongoDB

Un **documento** es un objeto JSON/BSON. Cada documento vive dentro de una **colección**.

```json
{
  "_id": "ObjectId('64a1f2...')",
  "nombre": "Ana Torres",
  "edad": 28,
  "activo": true,
  "direccion": {
    "ciudad": "Santiago",
    "comuna": "Providencia"
  },
  "cursos": ["MongoDB", "Python", "Docker"]
}
```

```d2
direction: right

doc: "Documento" {style.fill: "#f1f5f9"; style.stroke: "#64748b"}

id: "_id\n(identificador único)" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}
campos: "nombre, edad, activo" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}
subdoc: "direccion\ncampos anidados" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
arreglo: "cursos\nlista de valores" {style.fill: "#fef9c3"; style.stroke: "#eab308"}

doc -> id: "campo obligatorio"
doc -> campos: "datos simples"
doc -> subdoc: "objeto anidado"
doc -> arreglo: "lista"
```

---

## Unidad 2 · Operaciones CRUD con MongoDB

### Jerarquía de MongoDB

```d2
direction: down

servidor: "MongoDB Server" {style.fill: "#f1f5f9"; style.stroke: "#64748b"}
db1: "Base de datos: tienda" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}
col1: "Colección: productos" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
col2: "Colección: clientes" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
d1: "documento 1" {style.fill: "#f1f5f9"; style.stroke: "#94a3b8"}
d2: "documento 2" {style.fill: "#f1f5f9"; style.stroke: "#94a3b8"}
d3: "documento 3" {style.fill: "#f1f5f9"; style.stroke: "#94a3b8"}

servidor -> db1
db1 -> col1
db1 -> col2
col1 -> d1
col1 -> d2
col2 -> d3
```

---

### Comandos de gestión

```js
// Bases de datos
show dbs
use tienda
db.dropDatabase()

// Colecciones
show collections
db.createCollection("productos")
db.productos.drop()
```

---

### CRUD — flujo completo

```d2
direction: right

C: "CREATE\ninsertOne / insertMany" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
R: "READ\nfind / findOne" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}
U: "UPDATE\nupdateOne / updateMany" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
D: "DELETE\ndeleteOne / deleteMany" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}

C -> R -> U -> D
```

**Create:**
```js
db.productos.insertOne({ nombre: "Teclado", precio: 25000, stock: 10 })

db.productos.insertMany([
  { nombre: "Mouse", precio: 12000 },
  { nombre: "Monitor", precio: 150000 }
])
```

**Read:**
```js
db.productos.find()
db.productos.find({ precio: { $lt: 30000 } })
db.productos.findOne({ nombre: "Mouse" })
```

**Update:**
```js
db.productos.updateOne(
  { nombre: "Mouse" },
  { $set: { precio: 13000 } }
)
db.productos.updateMany(
  { stock: { $lt: 5 } },
  { $set: { activo: false } }
)
```

**Delete:**
```js
db.productos.deleteOne({ nombre: "Monitor" })
db.productos.deleteMany({ activo: false })
```

---

### Subdocumentos y arreglos

```d2
direction: right

cliente: "Documento: cliente" {style.fill: "#f1f5f9"; style.stroke: "#64748b"}
simple: "nombre, email" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}
dir: "direccion\ncalle, ciudad" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
pedidos: "pedidos\nlista de objetos" {style.fill: "#fef9c3"; style.stroke: "#eab308"}

cliente -> simple: "campos simples"
cliente -> dir: "subdocumento"
cliente -> pedidos: "arreglo"
```

**CRUD en subdocumentos:**
```js
// Agregar al arreglo
db.clientes.updateOne(
  { nombre: "Ana" },
  { $push: { pedidos: { id: 3, total: 45000 } } }
)

// Eliminar del arreglo
db.clientes.updateOne(
  { nombre: "Ana" },
  { $pull: { pedidos: { id: 3 } } }
)

// Buscar por campo de subdocumento
db.clientes.find({ "direccion.ciudad": "Santiago" })
```

---

## Unidad 3 · Búsqueda Avanzada

### Operadores de filtro

```d2
direction: down

filtros: "Operadores de filtro" {style.fill: "#f1f5f9"; style.stroke: "#64748b"}

comp: "Comparación\neq  ne  gt  gte  lt  lte" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}
logic: "Lógicos\nand  or  not  nor" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
arr: "Arreglos\nin  nin  all  elemMatch" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
regex: "Texto\nregex" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}

filtros -> comp
filtros -> logic
filtros -> arr
filtros -> regex
```

**Ejemplos:**
```js
// Comparación
db.productos.find({ precio: { $gte: 10000, $lte: 50000 } })

// Lógico
db.productos.find({
  $or: [{ precio: { $lt: 5000 } }, { stock: { $gt: 100 } }]
})

// Arreglo
db.usuarios.find({ cursos: { $in: ["MongoDB", "Python"] } })
```

---

### Expresiones regulares

```js
// Empieza con "A"
db.clientes.find({ nombre: { $regex: /^A/ } })

// Contiene "mongo" (sin distinguir mayúsculas)
db.clientes.find({ nombre: { $regex: /mongo/i } })

// Termina en ".cl"
db.clientes.find({ email: { $regex: /\.cl$/ } })
```

---

### Búsqueda con Python (PyMongo)

```d2
direction: right

app: "Aplicación Python" {style.fill: "#f1f5f9"; style.stroke: "#64748b"}
pymongo: "PyMongo\n(driver oficial)" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}
mongo: "MongoDB Server" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
col: "Colección" {style.fill: "#fef9c3"; style.stroke: "#eab308"}

app -> pymongo -> mongo -> col
```

```python
from pymongo import MongoClient

client = MongoClient("mongodb://localhost:27017/")
db = client["tienda"]
col = db["clientes"]

# Buscar por subdocumento
for doc in col.find({ "direccion.ciudad": "Santiago" }):
    print(doc["nombre"])

# Buscar con elemMatch en arreglo
col.find({
    "pedidos": { "$elemMatch": { "total": { "$gt": 30000 } } }
})
```

---

## Unidad 4 · Proyecto Integrador

```d2
direction: down

p1: "1. Identificar requisitos" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}
p2: "2. Seleccionar SO" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}
p3: "3. Configurar VM" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
p4: "4. Instalar MongoDB" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
p5: "5. Crear estructura BD" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
p6: "6. Crear componentes\nde software" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}

p1 -> p2 -> p3 -> p4 -> p5 -> p6
```

---

## Resumen CRUD

```d2
direction: right

crud: "CRUD en MongoDB" {style.fill: "#f1f5f9"; style.stroke: "#64748b"}

ins: "insertOne\ninsertMany" {style.fill: "#dcfce7"; style.stroke: "#22c55e"}
find: "find\nfindOne" {style.fill: "#dbeafe"; style.stroke: "#3b82f6"}
upd: "updateOne\nupdateMany" {style.fill: "#fef9c3"; style.stroke: "#eab308"}
del: "deleteOne\ndeleteMany" {style.fill: "#fce7f3"; style.stroke: "#ec4899"}

crud -> ins
crud -> find
crud -> upd
crud -> del
```

---

*Documentación oficial: [docs.mongodb.com](https://docs.mongodb.com) · [pymongo.readthedocs.io](https://pymongo.readthedocs.io)*
