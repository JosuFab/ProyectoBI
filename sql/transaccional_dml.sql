USE ecommerce_plataforma;

INSERT INTO categoria (nombre_Categoria, descripcion_Categoria) VALUES
('Electrónica', 'Dispositivos electrónicos'),
('Ropa', 'Prendas de vestir'),
('Hogar', 'Artículos para el hogar');

INSERT INTO marca (nombre_Marca, pais_Origen) VALUES
('Samsung', 'Corea del Sur'),
('Nike', 'Estados Unidos'),
('Sony', 'Japón');

INSERT INTO campania (nombre_Campania, tipo_Campania, descuento, fecha_Inicio, fecha_Fin) VALUES
('Black Friday', 'Descuento', 20.00, '2024-11-20', '2024-11-30'),
('Navidad', 'Promoción', 15.00, '2024-12-01', '2024-12-25');

INSERT INTO cliente (nombre, email, telefono, ciudad, pais, fecha_Registro) VALUES
('Juan Perez', 'juan@mail.com', '8888-1111', 'San Jose', 'Costa Rica', '2024-01-10'),
('Maria Lopez', 'maria@mail.com', '8888-2222', 'Alajuela', 'Costa Rica', '2024-02-15'),
('Carlos Ruiz', 'carlos@mail.com', '8888-3333', 'Cartago', 'Costa Rica', '2024-03-20');

INSERT INTO producto (nombre_Producto, precio_Base, costo_Base, stock, descripcion, id_Marca, id_Categoria) VALUES
('Celular Galaxy', 500.00, 350.00, 50, 'Smartphone Samsung', 1, 1),
('Zapatos Nike', 120.00, 70.00, 100, 'Zapatos deportivos', 2, 2),
('Televisor Sony', 800.00, 600.00, 30, 'TV 4K', 3, 1);

INSERT INTO pedido (id_Cliente, id_Campania, fecha_Pedido, metodo_Pago, total_Pedido, estado_Pedido, dispositivo) VALUES
(1, 1, '2024-11-25 10:00:00', 'Tarjeta', 500.00, 'Entregado', 'Movil'),
(2, NULL, '2024-11-26 12:00:00', 'PayPal', 120.00, 'Enviado', 'Web'),
(3, 2, '2024-12-10 15:00:00', 'Tarjeta', 800.00, 'Pendiente', 'Movil');

INSERT INTO operador_logistico (nombre_Operador, tipo_Servicio) VALUES
('DHL', 'Express'),
('Correos CR', 'Estandar');

INSERT INTO detalle_pedido (id_Pedido, id_Producto, cantidad, costo_Unitario, precio_Unitario, subtotal) VALUES
(1, 1, 1, 350.00, 500.00, 500.00),
(2, 2, 1, 70.00, 120.00, 120.00),
(3, 3, 1, 600.00, 800.00, 800.00);

INSERT INTO envio (id_pedido, id_operador, fecha_envio, fecha_entrega, fecha_entrega_estimada, direccion, region, estado_envio) VALUES
(1, 1, '2024-11-25', '2024-11-27', '2024-11-28', 'San Jose Centro', 'Central', 'Entregado'),
(2, 2, '2024-11-26', '2024-11-29', '2024-11-28', 'Alajuela Centro', 'Central', 'En camino'),
(3, 1, '2024-12-11', '2024-12-15', '2024-12-14', 'Cartago Centro', 'Central', 'Pendiente');

INSERT INTO devolucion (id_Detalle, fecha_Devolucion, motivo, cantidad_Devuelta) VALUES
(2, '2024-11-30', 'Producto defectuoso', 1);

USE ecommerce_plataforma;

SELECT * FROM categoria;
SELECT * FROM marca;
SELECT * FROM campania;
SELECT * FROM cliente;
SELECT * FROM producto;
SELECT * FROM pedido;
SELECT * FROM operador_logistico;
SELECT * FROM detalle_pedido;
SELECT * FROM envio;
SELECT * FROM devolucion;
