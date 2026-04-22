CREATE DATABASE ecommerce_final;
USE ecommerce_final;

-- 1. DIM_CAMPANIA
CREATE TABLE DIM_CAMPANIA (
    id_campania INT PRIMARY KEY,
    nombre_campania VARCHAR(150),
    tipo_campania VARCHAR(100),
    descuento DECIMAL(10,2),
    fecha_inicio DATE,
    fecha_fin DATE
);

-- 2. DIM_CLIENTE

CREATE TABLE DIM_CLIENTE (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(150),
    email VARCHAR(150),
    telefono VARCHAR(50),
    ciudad VARCHAR(100),
    pais VARCHAR(100),
    fecha_registro DATE
);

-- 3. DIM_DISPOSITIVO
CREATE TABLE DIM_DISPOSITIVO (
    id_dispositivo INT PRIMARY KEY,
    nombre_dispositivo VARCHAR(50)
);

-- 4. DIM_ENVIO
CREATE TABLE DIM_ENVIO (
    id_envio INT PRIMARY KEY,
    fecha_entrega_estimada DATE,
    direccion VARCHAR(255),
    region VARCHAR(100),
    estado_envio VARCHAR(50),
    nombre_operador VARCHAR(100),
    tipo_servicio VARCHAR(50)
);

-- 5. DIM_METODO_PAGO
CREATE TABLE DIM_METODO_PAGO (
    id_metodo_pago INT PRIMARY KEY,
    nombre_metodo_pago VARCHAR(100)
);

-- 6. DIM_PRODUCTO
CREATE TABLE DIM_PRODUCTO (
    id_producto INT PRIMARY KEY,
    nombre_producto VARCHAR(255),
    descripcion TEXT,
    nombre_categoria VARCHAR(100),
    descripcion_categoria TEXT,
    nombre_marca VARCHAR(100),
    pais_origen VARCHAR(100)
);

-- 7. DIM_TIEMPO
CREATE TABLE DIM_TIEMPO (
    id_fecha INT PRIMARY KEY, -- Formato 20240101
    anio INT,
    mes INT,
    nombre_mes VARCHAR(20),
    dia INT,
    nombre_dia VARCHAR(20),
    fecha VARCHAR(20),
    trimestre VARCHAR(10)
);

-- 8. FACT_VENTAS (La tabla central)
CREATE TABLE FACT_VENTAS (
    id_fact_ventas INT PRIMARY KEY,
    id_producto INT,
    id_cliente INT,
    id_fecha_pedido VARCHAR(50), -- Se recomienda limpiar a INT (20250622) para unir con DIM_TIEMPO
    id_fecha_envio VARCHAR(50),
    id_fecha_entrega VARCHAR(50),
    id_campania INT,
    id_envio INT,
    id_metodo_pago INT,
    id_dispositivo INT,
    cantidad INT,
    subtotal DECIMAL(15,2),
    costo_unitario DECIMAL(15,2),
    precio_unitario DECIMAL(15,2),
    cantidad_devuelta INT
);

SELECT * FROM dim_cliente;
SELECT * FROM dim_producto;
SELECT * FROM dim_tiempo;
SELECT * FROM dim_envio;
SELECT * FROM dim_campania;
SELECT * FROM dim_dispositivo;
SELECT * FROM dim_metodo_pago;
SELECT * FROM fact_ventas;
