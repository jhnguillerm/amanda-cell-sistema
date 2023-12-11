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
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT NULL,
    precio_compra DECIMAL(10, 2) NOT NULL,
    precio_venta DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL,
    tipo VARCHAR(100) NULL,
    fecha DATE NULL,
    imagen LONGBLOB NULL,
    id_proveedor INT NULL,
    PRIMARY KEY (id_producto),
    FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor)
);

CREATE TABLE empleado (
    id_empleado INT AUTO_INCREMENT NOT NULL,
    nombres VARCHAR(150) NOT NULL,
    dni CHAR(8) NOT NULL,
    correo VARCHAR(100) NOT NULL,
    telefono VARCHAR(15) NULL,
    direccion VARCHAR(255) NULL,
    username VARCHAR(100) NOT NULL,
    pass VARCHAR(100) NOT NULL,
    rol VARCHAR(100) NOT NULL,
    foto LONGBLOB NULL,
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