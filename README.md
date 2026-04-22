#  ProyectoBI — Plataforma de Comercio Electrónico

> **TI6900 - Inteligencia de Negocios · I Semestre 2026**  
> Instituto Tecnológico de Costa Rica  
> Profesor: Michael Lizandro Sánchez Soto

---

##  Descripción del problema

Una plataforma de comercio electrónico genera grandes volúmenes de datos en sus operaciones diarias de ventas, logística, devoluciones y marketing. Sin embargo, la información se encuentra dispersa y no integrada, lo que impide obtener una visión completa del negocio y dificulta la toma de decisiones basada en datos.

Este proyecto implementa una solución integral de Inteligencia de Negocios que centraliza, transforma y analiza la información operacional de la plataforma, con el objetivo de responder preguntas clave del negocio relacionadas con ingresos, rentabilidad, comportamiento de compra, devoluciones y eficiencia logística.

---

##  Integrantes del grupo

| Nombre | Carné |
|--------|-------|
| Fabián Martínez Camacho | 2023154879 |
| Roberth Campos Cartín | 2023074438 |
| Manuel Torres Osorio | 2023215737 |
| Moisés Calderón Mora | 2023378972 |
| Alonso Josué Hernández Montero | 2022090468 |

---

##  Arquitectura de la solución

```
┌─────────────────────┐
│  Fuente Operacional  │
│  MySQL - ecommerce  │
│  (Modelo ER)        │
└────────┬────────────┘
         │
         ▼
┌─────────────────────┐
│    Proceso ETL      │
│    EasyMorph        │
│  Extracción,        │
│  Transformación     │
│  y Carga            │
└────────┬────────────┘
         │
         ▼
┌─────────────────────┐
│  Data Warehouse     │
│  MySQL - DW         │
│  (Modelo Estrella)  │
└────────┬────────────┘
         │
         ▼
┌─────────────────────┐
│  Capa Analítica     │
│  Metabase           │
│  Dashboards y       │
│  Reportes           │
└─────────────────────┘
```

---

##  Herramientas utilizadas

| Herramienta | Tipo | Uso en el proyecto |
|-------------|------|--------------------|
| MySQL | Base de datos | Modelo transaccional y modelo dimensional (Data Warehouse) |
| EasyMorph | ETL | Extracción, transformación y carga de datos hacia el DW |
| Metabase | Analítica / Dashboard | Visualización de datos y respuesta a preguntas de negocio |
| Microsoft Excel | Manipulación de datos | Generación y validación de datos sintéticos |
| GitHub | Control de versiones | Gestión colaborativa del código y trazabilidad del proyecto |

---

## 📁 Estructura del repositorio

```
ProyectoBI/
│
├── 📂 datos/
│   ├── DATOS PROYECTO 1.zip          # Datos del modelo transaccional
│   └── DIM_FILES.zip                 # Datos del modelo dimensional
│
├── 📂 sql/
│   ├── transaccional_ddl.sql         # Creación del modelo transaccional
│   ├── transaccional_dml.sql         # Inserción de datos
│   └── ETL_TO_MYSQL.sql              # Script SQL generado por el ETL
│
├── 📂 etl/
│   └── Proyecto_BI_Final.morph       # Proyecto ETL en EasyMorph
│
├── 📂 diagramas/
│   ├── Diagrama Entidad Relación.png
│   ├── Modelo Dimensional Proyecto BI.png
│   └── capturasProyectoBI.docx       # Evidencia de ejecución del ETL
│
├── 📂 documentación/
│   ├── PresentaciónBI.pdf            # Presentación final del proyecto
│   └── ProyectoBI.pdf                # Informe técnico del proyecto
│
└── 📄 README.md
```

---

##  Instrucciones de ejecución

### 1. Requisitos previos

- MySQL Server 8.0 o superior
- EasyMorph (versión de escritorio)
- Metabase (`.jar` o Docker)
- Java 11+ (para Metabase con `.jar`)

### 2. Configurar la base de datos transaccional

```sql
-- Ejecutar en MySQL Workbench o cualquier cliente MySQL
source sql/transaccional_ddl.sql;
source sql/transaccional_dml.sql;
```

O cargar los datos desde los archivos CSV contenidos en `datos/DATOS PROYECTO 1.zip`:

```sql
LOAD DATA INFILE 'ruta/al/archivo.csv'
INTO TABLE nombre_tabla
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
```

### 3. Ejecutar el ETL

1. Abrir EasyMorph
2. Cargar el archivo `etl/Proyecto_BI_Final.morph`
3. Verificar las conexiones a la base de datos fuente y destino
4. Ejecutar el flujo completo

> El script `sql/ETL_TO_MYSQL.sql` contiene el resultado de la carga generada por EasyMorph y puede ejecutarse directamente si no se desea correr el ETL manualmente.

### 4. Configurar Metabase

**Opción A — con archivo JAR:**
```bash
java -jar metabase.jar
```
Abrir el navegador en `http://localhost:3000`

**Opción B — con Docker:**
```bash
docker run -d -p 3000:3000 --name metabase metabase/metabase
```

Conectar Metabase a la base de datos del DW en MySQL con las credenciales correspondientes y explorar los dashboards configurados.

---

##  Preguntas de negocio respondidas

1. ¿Cuáles categorías, marcas y canales digitales generan mayor volumen de pedidos, ingresos y margen?
2. ¿Qué productos presentan la mayor tasa de devolución y qué impacto tienen en la rentabilidad?
3. ¿Cómo varía el ticket promedio según dispositivo, método de pago, campaña y ubicación del cliente?
4. ¿Qué tiempos de entrega y niveles de cumplimiento se observan según operador logístico y región?
5. ¿Qué campañas de marketing generan mayores ingresos y menor tasa de devolución?
6. ¿Qué combinaciones de productos, canales y regiones presentan mayores niveles de rentabilidad?

---

##  KPIs implementados

| KPI | Fórmula |
|-----|---------|
| Ingresos Totales | `∑ subtotal` |
| Margen de Ganancia | `(precio_Unitario – costo_Unitario) / precio_Unitario × 100` |
| Volumen de Pedidos | `COUNT(id_Pedido)` |
| Tasa de Devolución | `(∑ cantidad_Devuelta / ∑ cantidad) × 100` |
| Ticket Promedio | `Ingresos Totales / Volumen de Pedidos` |
| Tiempo Promedio de Entrega | `AVG(fecha_Entrega – fecha_Envio)` |
| Nivel de Cumplimiento | `(pedidos entregados a tiempo / total pedidos) × 100` |
| Ingresos por Campaña | `∑ subtotal donde id_Campania ≠ NULL` |
| Rentabilidad por Pedido | `Margen total / Volumen de pedidos` |

---

##  Notas

- Los datos utilizados en este proyecto son **sintéticos** y fueron generados con fines académicos.
- El historial de commits refleja la participación de todos los integrantes del grupo.
- Para cualquier consulta sobre acceso al repositorio, contactar al equipo directamente.
