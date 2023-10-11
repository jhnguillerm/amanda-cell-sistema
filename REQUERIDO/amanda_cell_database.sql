CREATE DATABASE amanda_cell;

USE amanda_cell;

CREATE TABLE Cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    dni VARCHAR(15) UNIQUE NOT NULL,
    telefono VARCHAR(15),
    correo VARCHAR(100)
);

CREATE TABLE Servicio (
    id_servicio INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(255) NOT NULL,
    costo DECIMAL(10, 2),
    fecha_recepcion DATE,
    fecha_entrega DATE,
    estado VARCHAR(50),
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

CREATE TABLE Proveedor (
    id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(255),
    numero VARCHAR(15),
    correo VARCHAR(100)
);

CREATE TABLE Producto (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion VARCHAR(255),
    imagen BLOB,
    precio_compra DECIMAL(10, 2),
    precio_venta DECIMAL(10, 2),
    stock INT,
    tipo VARCHAR(50),
    id_proveedor INT,
    FOREIGN KEY (id_proveedor) REFERENCES Proveedor(id_proveedor)
);

CREATE TABLE Servicio_Producto (
    id_servicio INT,
    id_producto INT,
    PRIMARY KEY (id_servicio, id_producto),
    FOREIGN KEY (id_servicio) REFERENCES Servicio(id_servicio),
    FOREIGN KEY (id_producto) REFERENCES Producto(id_producto)
);

CREATE TABLE Venta (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE,
    total DECIMAL(10, 2),
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

CREATE TABLE Empleado (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    usuario VARCHAR(50) UNIQUE NOT NULL,
    contraseña VARCHAR(100) NOT NULL,
    rol VARCHAR(50)
);

CREATE TABLE Venta_Empleado (
    id_venta INT,
    id_empleado INT,
    PRIMARY KEY (id_venta, id_empleado),
    FOREIGN KEY (id_venta) REFERENCES Venta(id_venta),
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado)
);

INSERT INTO Proveedor (nombre, direccion, numero, correo)
VALUES
    ('Proveedor A', 'Calle 123, Ciudad A', '123-456-7890', 'proveedora@example.com'),
    ('Proveedor B', 'Avenida XYZ, Ciudad B', '987-654-3210', 'proveedorb@example.com'),
    ('Proveedor C', 'Calle ABC, Ciudad C', '555-123-4567', 'proveedorc@example.com'),
    ('Proveedor D', 'Avenida 789, Ciudad D', '888-555-9999', 'proveedord@example.com'),
    ('Proveedor E', 'Calle 456, Ciudad E', '777-444-3333', 'proveedore@example.com');

INSERT INTO Producto (nombre, descripcion, imagen, precio_compra, precio_venta, stock, tipo, id_proveedor)
VALUES
    ('Pantalla LCD para iPhone 11', 'Pantalla de repuesto compatible con iPhone 11', NULL, 80.00, 129.99, 20, 'Pantalla', 1),
    ('Cargador USB para Android', 'Cargador rápido para dispositivos Android', NULL, 10.00, 19.99, 50, 'Cargador', 2),
    ('Batería para Samsung Galaxy S20', 'Batería de repuesto para Samsung Galaxy S20', NULL, 35.00, 49.99, 30, 'Batería', 3),
    ('Kit de Herramientas de Reparación', 'Kit de herramientas completo para reparación de celulares', NULL, 20.00, 29.99, 15, 'Herramientas', 4),
    ('Funda Protectora para iPhone 12', 'Funda resistente para iPhone 12', NULL, 8.00, 14.99, 40, 'Accesorio', 5),
    ('Cámara Frontal para Huawei P30', 'Cámara frontal de repuesto para Huawei P30', NULL, 30.00, 39.99, 10, 'Cámara', 1),
    ('Cable de Datos USB-C', 'Cable de datos USB-C de alta calidad', NULL, 5.00, 9.99, 60, 'Cable', 2),
    ('Altavoz para iPhone 8', 'Altavoz de repuesto para iPhone 8', NULL, 18.00, 24.99, 20, 'Altavoz', 3),
    ('Botón de Inicio para Samsung Galaxy A50', 'Botón de inicio de repuesto para Samsung Galaxy A50', NULL, 7.00, 8.99, 10, 'Botón', 4),
    ('Auriculares Bluetooth', 'Auriculares inalámbricos con cancelación de ruido', NULL, 40.00, 49.99, 25, 'Accesorio', 5),
    ('Auriculares Inalámbricos', 'Auriculares Bluetooth con cancelación de ruido', NULL, 40.00, 49.99, 50, 'Accesorio', 3),
    ('Cámara Trasera para iPhone X', 'Cámara trasera de repuesto para iPhone X', NULL, 20.00, 29.99, 20, 'Cámara', 2),
    ('Funda Protectora para Samsung Galaxy S10', 'Funda resistente para Samsung Galaxy S10', NULL, 8.00, 14.99, 30, 'Accesorio', 1),
    ('Auriculares con Cable para iPhone', 'Auriculares con cable de alta calidad para iPhone', NULL, 15.00, 29.99, 50, 'Auriculares', 1),
    ('Cargador Inalámbrico para Samsung', 'Cargador inalámbrico rápido para dispositivos Samsung', NULL, 18.00, 34.99, 40, 'Cargador', 3),
    ('Batería Externa 10000mAh', 'Batería externa portátil de 10000mAh para carga de dispositivos', NULL, 25.00, 39.99, 30, 'Batería', 2),
    ('Funda de Cuero para iPhone 13', 'Funda elegante de cuero para iPhone 13', NULL, 12.00, 24.99, 25, 'Accesorio', 4),
    ('Teclado Inalámbrico para Tablet', 'Teclado inalámbrico compacto para tablet', NULL, 22.00, 39.99, 20, 'Teclado', 5),
    ('Auriculares Deportivos Bluetooth', 'Auriculares inalámbricos para deportes con resistencia al agua', NULL, 30.00, 49.99, 35, 'Auriculares', 1),
    ('Cámara Trasera para Samsung Galaxy Note 10', 'Cámara trasera de repuesto para Samsung Galaxy Note 10', NULL, 28.00, 39.99, 15, 'Cámara', 2),
    ('Cable de Carga Rápida USB-C', 'Cable de carga rápida USB-C con conectores de aluminio', NULL, 8.00, 17.99, 60, 'Cable', 4),
    ('Funda Resistente para iPad', 'Funda resistente y a prueba de golpes para iPad', NULL, 15.00, 29.99, 30, 'Accesorio', 3),
    ('Altavoz Bluetooth Portátil', 'Altavoz inalámbrico portátil con calidad de sonido superior', NULL, 40.00, 69.99, 25, 'Altavoz', 5),
    ('Cargador de Coche USB Dual', 'Cargador de coche con dos puertos USB para cargar dispositivos en el automóvil', NULL, 10.00, 19.99, 45, 'Cargador', 1),
    ('Funda con Soporte para iPhone 12', 'Funda con soporte plegable para iPhone 12', NULL, 9.00, 18.99, 35, 'Accesorio', 2),
    ('Kit de Destornilladores de Precisión', 'Kit de destornilladores de precisión para reparación de dispositivos', NULL, 15.00, 29.99, 20, 'Herramientas', 4),
    ('Cámara Frontal para Google Pixel 4', 'Cámara frontal de repuesto para Google Pixel 4', NULL, 32.00, 44.99, 12, 'Cámara', 5),
    ('Funda con Teclado para Tablet', 'Funda con teclado integrado para tablet', NULL, 20.00, 39.99, 18, 'Teclado', 3),
    ('Funda Protectora para iPhone 11', 'Funda resistente para iPhone 11', NULL, 6.00, 12.99, 35, 'Accesorio', 1),
    ('Cargador Rápido para iPhone 12', 'Cargador de carga rápida para iPhone 12', NULL, 15.00, 29.99, 30, 'Cargador', 2),
    ('Auriculares con Cancelación de Ruido', 'Auriculares inalámbricos con tecnología de cancelación de ruido', NULL, 50.00, 89.99, 20, 'Auriculares', 3),
    ('Batería para iPhone X', 'Batería de repuesto para iPhone X', NULL, 25.00, 39.99, 25, 'Batería', 4),
    ('Cámara Trasera para Google Pixel 3', 'Cámara trasera de repuesto para Google Pixel 3', NULL, 28.00, 39.99, 15, 'Cámara', 5),
    ('Cable de Carga USB para iPad', 'Cable de carga USB para dispositivos iPad', NULL, 10.00, 19.99, 50, 'Cable', 1),
    ('Altavoz Inalámbrico Resistente al Agua', 'Altavoz inalámbrico resistente al agua para actividades al aire libre', NULL, 35.00, 59.99, 15, 'Altavoz', 2),
    ('Funda con Teclado para iPad', 'Funda con teclado integrado para iPad', NULL, 18.00, 34.99, 20, 'Accesorio', 3),
    ('Cargador de Coche USB-C', 'Cargador de coche con puerto USB-C para carga rápida en el automóvil', NULL, 12.00, 24.99, 25, 'Cargador', 4),
    ('Kit de Herramientas de Reparación Profesional', 'Kit de herramientas de reparación profesional para dispositivos electrónicos', NULL, 35.00, 64.99, 10, 'Herramientas', 5);

    
SELECT * FROM Producto;

DROP TABLE Producto;

DROP TABLE Servicio_Producto;

