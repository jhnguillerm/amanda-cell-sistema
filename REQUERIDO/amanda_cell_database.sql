CREATE DATABASE amanda_cell;

USE amanda_cell;

CREATE TABLE proveedor (
    id_proveedor INT AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(150),
    direccion VARCHAR(100),
    numero VARCHAR(15),
    correo VARCHAR(100),
    PRIMARY KEY (id_proveedor)
);

CREATE TABLE producto (
    id_producto INT AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(100),
    descripcion TEXT,
    precio_compra DECIMAL(10, 2),
    precio_venta DECIMAL(10, 2),
    stock INT,
    tipo VARCHAR(100),
    id_proveedor INT,
    PRIMARY KEY (id_producto),
    FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor)
);

CREATE TABLE imagen_producto (
    id_imagen INT AUTO_INCREMENT NOT NULL,
    id_producto INT,
    imagen LONGBLOB,
    PRIMARY KEY (id_imagen),
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

CREATE TABLE empleado (
    id_empleado INT AUTO_INCREMENT NOT NULL,
    nombres VARCHAR(150),
    dni CHAR(8),
    correo VARCHAR(100),
    telefono VARCHAR(15),
    username VARCHAR(50),
    pass VARCHAR(50),
    PRIMARY KEY (id_empleado)
);

CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT NOT NULL,
    nombres VARCHAR(150),
    dni CHAR(8),
    correo VARCHAR(100),
    telefono VARCHAR(15),
    PRIMARY KEY (id_cliente)
);

CREATE TABLE venta (
    id_venta INT AUTO_INCREMENT NOT NULL,
    num_serie VARCHAR(100),
    fecha_venta DATE,
    monto DECIMAL(10, 2),
    id_cliente INT,
    id_empleado INT,
    PRIMARY KEY (id_venta),
    FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente),
    FOREIGN KEY (id_empleado) REFERENCES empleado (id_empleado)
);

CREATE TABLE detalle_venta (
    id_detalle_venta INT AUTO_INCREMENT NOT NULL,
    cantidad INT,
    precio_venta DECIMAL(10, 2),
    subtotal DECIMAL(10, 2),
    id_producto INT,
    id_venta INT,
    PRIMARY KEY (id_detalle_venta),
    FOREIGN KEY (id_producto) REFERENCES producto (id_producto),
    FOREIGN KEY (id_venta) REFERENCES venta (id_venta)
);

CREATE TABLE servicio (
    id_servicio INT AUTO_INCREMENT NOT NULL,
    num_serie VARCHAR(100),
    problema VARCHAR(100),
    descripcion TEXT,
    costo DECIMAL(10, 2),
    total DECIMAL(10, 2),
    fecha_recepcion DATE,
    fecha_entrega DATE,
    estado VARCHAR(50),
    id_cliente INT,
    id_empleado INT,
    PRIMARY KEY (id_servicio),
    FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente),
    FOREIGN KEY (id_empleado) REFERENCES empleado (id_empleado)
);

CREATE TABLE detalle_servicio (
    id_detalle_servicio INT AUTO_INCREMENT NOT NULL,
	cantidad INT,
    precio_venta DECIMAL(10, 2),
    subtotal DECIMAL(10, 2),
    id_producto INT,
    id_servicio INT,
    PRIMARY KEY (id_detalle_servicio),
    FOREIGN KEY (id_producto) REFERENCES producto (id_producto),
    FOREIGN KEY (id_servicio) REFERENCES servicio (id_servicio)
);

INSERT INTO proveedor (nombre, direccion, numero, correo)
VALUES
    ('Proveedor A', 'Calle 123, Ciudad A', '123-456-7890', 'proveedora@example.com'),
    ('Proveedor B', 'Avenida XYZ, Ciudad B', '987-654-3210', 'proveedorb@example.com'),
    ('Proveedor C', 'Calle ABC, Ciudad C', '555-123-4567', 'proveedorc@example.com'),
    ('Proveedor D', 'Avenida 789, Ciudad D', '888-555-9999', 'proveedord@example.com'),
    ('Proveedor E', 'Calle 456, Ciudad E', '777-444-3333', 'proveedore@example.com');

INSERT INTO producto (nombre, descripcion, precio_compra, precio_venta, stock, tipo, id_proveedor)
VALUES
    ('Pantalla LCD para iPhone 11', 'Pantalla de repuesto compatible con iPhone 11', 80.00, 129.99, 20, 'Pantalla', 1),
    ('Cargador USB para Android', 'Cargador rápido para dispositivos Android', 10.00, 19.99, 50, 'Cargador', 2),
    ('Batería para Samsung Galaxy S20', 'Batería de repuesto para Samsung Galaxy S20', 35.00, 49.99, 30, 'Batería', 3),
    ('Funda Protectora para iPhone 12', 'Funda resistente para iPhone 12', 8.00, 14.99, 40, 'Accesorio', 5),
    ('Cámara Frontal para Huawei P30', 'Cámara frontal de repuesto para Huawei P30', 30.00, 39.99, 10, 'Cámara', 1),
    ('Cable de Datos USB-C', 'Cable de datos USB-C de alta calidad', 5.00, 9.99, 60, 'Cable', 2),
    ('Altavoz para iPhone 8', 'Altavoz de repuesto para iPhone 8', 18.00, 24.99, 20, 'Altavoz', 3),
    ('Botón de Inicio para Samsung Galaxy A50', 'Botón de inicio de repuesto para Samsung Galaxy A50', 7.00, 8.99, 10, 'Botón', 4),
    ('Auriculares Bluetooth', 'Auriculares inalámbricos con cancelación de ruido', 40.00, 49.99, 25, 'Accesorio', 5),
    ('Auriculares Inalámbricos', 'Auriculares Bluetooth con cancelación de ruido', 40.00, 49.99, 50, 'Accesorio', 3),
    ('Cámara Trasera para iPhone X', 'Cámara trasera de repuesto para iPhone X', 20.00, 29.99, 20, 'Cámara', 2),
    ('Funda Protectora para Samsung Galaxy S10', 'Funda resistente para Samsung Galaxy S10', 8.00, 14.99, 30, 'Accesorio', 1),
    ('Auriculares con Cable para iPhone', 'Auriculares con cable de alta calidad para iPhone', 15.00, 29.99, 50, 'Auriculares', 1),
    ('Cargador Inalámbrico para Samsung', 'Cargador inalámbrico rápido para dispositivos Samsung', 18.00, 34.99, 40, 'Cargador', 3),
    ('Batería Externa 10000mAh', 'Batería externa portátil de 10000mAh para carga de dispositivos', 25.00, 39.99, 30, 'Batería', 2),
    ('Funda de Cuero para iPhone 13', 'Funda elegante de cuero para iPhone 13', 12.00, 24.99, 25, 'Accesorio', 4),
    ('Teclado Inalámbrico para Tablet', 'Teclado inalámbrico compacto para tablet', 22.00, 39.99, 20, 'Teclado', 5),
    ('Auriculares Deportivos Bluetooth', 'Auriculares inalámbricos para deportes con resistencia al agua', 30.00, 49.99, 35, 'Auriculares', 1),
    ('Cámara Trasera para Samsung Galaxy Note 10', 'Cámara trasera de repuesto para Samsung Galaxy Note 10', 28.00, 39.99, 15, 'Cámara', 2),
    ('Cable de Carga Rápida USB-C', 'Cable de carga rápida USB-C con conectores de aluminio', 8.00, 17.99, 60, 'Cable', 4),
    ('Funda Resistente para iPad', 'Funda resistente y a prueba de golpes para iPad', 15.00, 29.99, 30, 'Accesorio', 3),
    ('Altavoz Bluetooth Portátil', 'Altavoz inalámbrico portátil con calidad de sonido superior', 40.00, 69.99, 25, 'Altavoz', 5),
    ('Cargador de Coche USB Dual', 'Cargador de coche con dos puertos USB para cargar dispositivos en el automóvil', 10.00, 19.99, 45, 'Cargador', 1),
    ('Funda con Soporte para iPhone 12', 'Funda con soporte plegable para iPhone 12', 9.00, 18.99, 35, 'Accesorio', 2),
    ('Kit de Destornilladores de Precisión', 'Kit de destornilladores de precisión para reparación de dispositivos', 15.00, 29.99, 20, 'Herramientas', 4),
    ('Cámara Frontal para Google Pixel 4', 'Cámara frontal de repuesto para Google Pixel 4', 32.00, 44.99, 12, 'Cámara', 5),
    ('Funda con Teclado para Tablet', 'Funda con teclado integrado para tablet', 20.00, 39.99, 18, 'Teclado', 3),
    ('Funda Protectora para iPhone 11', 'Funda resistente para iPhone 11', 6.00, 12.99, 35, 'Accesorio', 1),
    ('Cargador Rápido para iPhone 12', 'Cargador de carga rápida para iPhone 12', 15.00, 29.99, 30, 'Cargador', 2),
    ('Auriculares con Cancelación de Ruido', 'Auriculares inalámbricos con tecnología de cancelación de ruido', 50.00, 89.99, 20, 'Auriculares', 3),
    ('Batería para iPhone X', 'Batería de repuesto para iPhone X', 25.00, 39.99, 25, 'Batería', 4),
    ('Cámara Trasera para Google Pixel 3', 'Cámara trasera de repuesto para Google Pixel 3', 28.00, 39.99, 15, 'Cámara', 5),
    ('Cable de Carga USB para iPad', 'Cable de carga USB para dispositivos iPad', 10.00, 19.99, 50, 'Cable', 1),
    ('Altavoz Inalámbrico Resistente al Agua', 'Altavoz inalámbrico resistente al agua para actividades al aire libre', 35.00, 59.99, 15, 'Altavoz', 2),
    ('Funda con Teclado para iPad', 'Funda con teclado integrado para iPad', 18.00, 34.99, 20, 'Accesorio', 3),
    ('Cargador de Coche USB-C', 'Cargador de coche con puerto USB-C para carga rápida en el automóvil', 12.00, 24.99, 25, 'Cargador', 4),
    ('Kit de Herramientas de Reparación Profesional', 'Kit de herramientas de reparación profesional para dispositivos electrónicos', 35.00, 64.99, 10, 'Herramientas', 5);


INSERT INTO  empleado (nombres, dni, correo, telefono, username, pass)
VALUES 
	("Jhon Moreno", "78453745", "jhn_guillerm@utp.edu.pe", "947534854", "jhnguillerm", "ebce79953d4fd11e1b8c625ef1ab3c9e");

INSERT INTO cliente (nombres, dni, correo, telefono) VALUES
('Juan Pérez', '12345678', 'juan@example.com', '555-1234'),
('María López', '23456789', 'maria@example.com', '555-5678'),
('Carlos Rodríguez', '34567890', 'carlos@example.com', '555-9012'),
('Ana Martínez', '45678901', 'ana@example.com', '555-2345'),
('Luis García', '56789012', 'luis@example.com', '555-6789'),
('Laura Sánchez', '67890123', 'laura@example.com', '555-1234'),
('Pablo Fernández', '78901234', 'pablo@example.com', '555-5678'),
('Marta Ramírez', '89012345', 'marta@example.com', '555-9012');

INSERT INTO venta (num_serie, fecha_venta, monto, id_cliente, id_empleado) VALUES
('V0001', '2023-11-01', 350.00, 1, 1),
('V0002', '2023-11-02', 420.00, 2, 1),
('V0003', '2023-11-03', 280.00, 3, 1),
('V0004', '2023-11-04', 450.00, 4, 1),
('V0005', '2023-11-05', 320.00, 5, 1),
('V0006', '2023-11-06', 550.00, 1, 1),
('V0007', '2023-11-07', 320.00, 2, 1),
('V0008', '2023-11-08', 480.00, 3, 1),
('V0009', '2023-11-09', 390.00, 4, 1),
('V0010', '2023-11-10', 310.00, 5, 1),
('V0011', '2023-11-11', 380.00, 1, 1),
('V0012', '2023-11-12', 260.00, 2, 1),
('V0013', '2023-11-13', 420.00, 3, 1),
('V0014', '2023-11-14', 320.00, 4, 1),
('V0015', '2023-11-15', 550.00, 5, 1);
    
-- Detalles de Venta
INSERT INTO detalle_venta (cantidad, precio_venta, subtotal, id_producto, id_venta) VALUES
-- Detalles de Venta Venta 1
(2, 50.00, 100.00, 1, 1),
(3, 30.00, 90.00, 2, 1),
(1, 70.00, 70.00, 3, 1),
(4, 20.00, 80.00, 4, 1),
(2, 40.00, 80.00, 5, 1),
-- Detalles de Venta Venta 2
(3, 35.00, 105.00, 6, 2),
(2, 40.00, 80.00, 7, 2),
(5, 25.00, 125.00, 8, 2),
(1, 60.00, 60.00, 9, 2),
(4, 30.00, 120.00, 10, 2),
-- Detalles de Venta Venta 3
(2, 45.00, 90.00, 11, 3),
(3, 28.00, 84.00, 12, 3),
(1, 72.00, 72.00, 13, 3),
(5, 22.00, 110.00, 14, 3),
(3, 38.00, 114.00, 15, 3),
-- Detalles de Venta Venta 4
(4, 32.00, 128.00, 16, 4),
(2, 48.00, 96.00, 17, 4),
(3, 36.00, 108.00, 18, 4),
(1, 65.00, 65.00, 19, 4),
(5, 27.00, 135.00, 20, 4),
-- Detalles de Venta Venta 5
(3, 42.00, 126.00, 21, 5),
(4, 33.00, 132.00, 22, 5),
(2, 52.00, 104.00, 23, 5),
(1, 75.00, 75.00, 24, 5),
(5, 29.00, 145.00, 25, 5),
-- Detalles de Venta Venta 6
(4, 36.00, 144.00, 26, 6),
(3, 42.00, 126.00, 27, 6),
(2, 53.00, 106.00, 28, 6),
(5, 26.00, 130.00, 29, 6),
(1, 68.00, 68.00, 30, 6),
-- Detalles de Venta Venta 7
(5, 28.00, 140.00, 31, 7),
(1, 65.00, 65.00, 32, 7),
(3, 40.00, 120.00, 33, 7),
(2, 50.00, 100.00, 34, 7),
(4, 34.00, 136.00, 35, 7),
-- Detalles de Venta Venta 8
(4, 30.00, 120.00, 36, 8),
(3, 44.00, 132.00, 31, 8),
(2, 54.00, 108.00, 34, 8),
(5, 29.00, 145.00, 1, 8),
(1, 62.00, 62.00, 2, 8),
-- Detalles de Venta Venta 9
(3, 41.00, 123.00, 3, 9),
(5, 24.00, 120.00, 4, 9),
(4, 32.00, 128.00, 5, 9),
(1, 70.00, 70.00, 6, 9),
(2, 48.00, 96.00, 7, 9),
-- Detalles de Venta Venta 10
(2, 55.00, 110.00, 8, 10),
(4, 31.00, 124.00, 9, 10),
(3, 38.00, 114.00, 10, 10),
(1, 75.00, 75.00, 11, 10),
(5, 26.00, 130.00, 12, 10),
-- Detalles de Venta Venta 11
(5, 27.00, 135.00, 13, 11),
(1, 63.00, 63.00, 14, 11),
(3, 44.00, 132.00, 15, 11),
(4, 34.00, 136.00, 16, 11),
(2, 52.00, 104.00, 17, 11),
-- Detalles de Venta Venta 12
(3, 40.00, 120.00, 18, 12),
(5, 30.00, 150.00, 19, 12),
(2, 58.00, 116.00, 20, 12),
(4, 33.00, 132.00, 21, 12),
(1, 69.00, 69.00, 22, 12),
-- Detalles de Venta Venta 13
(1, 76.00, 76.00, 23, 13),
(2, 56.00, 112.00, 24, 13),
(5, 28.00, 140.00, 25, 13),
(4, 35.00, 140.00, 26, 13),
(3, 43.00, 129.00, 27, 13),
-- Detalles de Venta Venta 14
(4, 32.00, 128.00, 28, 14),
(1, 74.00, 74.00, 29, 14),
(3, 37.00, 111.00, 30, 14),
(2, 57.00, 114.00, 31, 14),
(5, 27.00, 135.00, 32, 14),
-- Detalles de Venta Venta 15
(2, 54.00, 108.00, 33, 15),
(5, 29.00, 145.00, 34, 15),
(1, 67.00, 67.00, 35, 15),
(4, 31.00, 124.00, 3, 15),
(3, 45.00, 135.00, 32, 15);

INSERT INTO servicio (num_serie, problema, descripcion, costo, total, fecha_recepcion, fecha_entrega, estado, id_cliente, id_empleado)
VALUES
    ('1234567890', 'Pantalla rota', 'Reparación de la pantalla de iPhone 11', 80.00, 100.00, '2023-11-01', '2023-11-03', 'En proceso', 1, 1),
    ('9876543210', 'Batería agotada', 'Reemplazo de batería de Samsung Galaxy S20', 35.00, 50.00, '2023-11-02', '2023-11-04', 'En proceso', 2, 1),
    ('5678901234', 'Altavoz defectuoso', 'Reparación de altavoz para iPhone 8', 18.00, 25.00, '2023-11-03', '2023-11-05', 'En proceso', 3, 1),
    ('3456789012', 'Cámara frontal dañada', 'Sustitución de cámara frontal de Huawei P30', 30.00, 45.00, '2023-11-04', '2023-11-06', 'En proceso', 4, 1),
    ('4567890123', 'Botón de inicio no funciona', 'Reparación del botón de inicio de Samsung Galaxy A50', 7.00, 12.00, '2023-11-05', '2023-11-07', 'En proceso', 5, 1);

INSERT INTO detalle_servicio (cantidad, precio_venta, subtotal, id_producto, id_servicio)
VALUES
    (1, 80.00, 80.00, 1, 1),
    (1, 35.00, 35.00, 3, 2),
    (1, 18.00, 18.00, 7, 3),
    (1, 30.00, 30.00, 6, 4),
    (1, 7.00, 7.00, 8, 5);


