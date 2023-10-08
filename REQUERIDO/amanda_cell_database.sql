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
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255),
    precio DECIMAL(10, 2),
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

-- Inserciones de prueba para Proveedor
INSERT INTO Proveedor (nombre, direccion, numero, correo)
VALUES
    ('Proveedor A', 'Calle 123, Ciudad A', '123-456-7890', 'proveedora@example.com'),
    ('Proveedor B', 'Avenida XYZ, Ciudad B', '987-654-3210', 'proveedorb@example.com'),
    ('Proveedor C', 'Calle ABC, Ciudad C', '555-123-4567', 'proveedorc@example.com'),
    ('Proveedor D', 'Avenida 789, Ciudad D', '888-555-9999', 'proveedord@example.com'),
    ('Proveedor E', 'Calle 456, Ciudad E', '777-444-3333', 'proveedore@example.com');

-- Inserciones de prueba para Producto (relacionados con reparación de celulares)
INSERT INTO Producto (nombre, descripcion, precio, stock, tipo, id_proveedor)
VALUES
    ('Pantalla LCD para iPhone 11', 'Pantalla de repuesto compatible con iPhone 11', 99.99, 20, 'Pantalla', 1),
    ('Cargador USB para Android', 'Cargador rápido para dispositivos Android', 19.99, 50, 'Cargador', 2),
    ('Batería para Samsung Galaxy S20', 'Batería de repuesto para Samsung Galaxy S20', 49.99, 30, 'Batería', 3),
    ('Kit de Herramientas de Reparación', 'Kit de herramientas completo para reparación de celulares', 29.99, 15, 'Herramientas', 4),
    ('Funda Protectora para iPhone 12', 'Funda resistente para iPhone 12', 14.99, 40, 'Accesorio', 5),
    ('Cámara Frontal para Huawei P30', 'Cámara frontal de repuesto para Huawei P30', 39.99, 10, 'Cámara', 1),
    ('Cable de Datos USB-C', 'Cable de datos USB-C de alta calidad', 9.99, 60, 'Cable', 2),
    ('Altavoz para iPhone 8', 'Altavoz de repuesto para iPhone 8', 24.99, 20, 'Altavoz', 3),
    ('Botón de Inicio para Samsung Galaxy A50', 'Botón de inicio de repuesto para Samsung Galaxy A50', 8.99, 10, 'Botón', 4),
    ('Auriculares Bluetooth', 'Auriculares inalámbricos con cancelación de ruido', 49.99, 25, 'Accesorio', 5);
    
INSERT INTO Producto (nombre, descripcion, precio, stock, tipo, id_proveedor)
VALUES
    ('Auriculares Inalámbricos', 'Auriculares Bluetooth con cancelación de ruido', 49.99, 50, 'Accesorio', 3),
    ('Cámara Trasera para iPhone X', 'Cámara trasera de repuesto para iPhone X', 29.99, 20, 'Cámara', 2),
    ('Funda Protectora para Samsung Galaxy S10', 'Funda resistente para Samsung Galaxy S10', 14.99, 30, 'Accesorio', 1);

    
SELECT * FROM Producto;

