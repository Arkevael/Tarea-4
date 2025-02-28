# CREAR BASE DE DATOS Y USARLA
CREATE DATABASE INTERBANK;
USE INTERBANK;

# CREAR TABLAS

CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido_paterno VARCHAR(50),
    apellido_materno VARCHAR(50),
    tipo ENUM('Administrador', 'Cajero', 'Gerente', 'Asesor', 'Supervisor'),
    email VARCHAR(50),
    password VARCHAR(255)
);

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    dni VARCHAR(8) UNIQUE,
    apellido_paterno VARCHAR(50),
    apellido_materno VARCHAR(50),
    primer_nombre VARCHAR(50),
    segundo_nombre VARCHAR(50),
    direccion VARCHAR(100),
    telefono VARCHAR(15),
    nro_hijos INT,
    estado_civil ENUM('Soltero', 'Casado', 'Divorciado', 'Viudo'),
    sexo ENUM('M', 'F'),
    fecha_nacimiento DATE
);

CREATE TABLE prestamos (
    id_prestamo INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    monto DECIMAL(10,2),
    interes DECIMAL(5,2),
    frecuencia_pago ENUM('DIARIO', 'SEMANAL', 'MENSUAL'),
    numero_cuotas INT,
    saldo DECIMAL(10,2),
    fecha_otorgamiento DATE DEFAULT CURDATE(),
    fecha_vencimiento DATE,
    estado ENUM('Activo', 'Cancelado', 'Vencido') DEFAULT 'Activo',
    tipo ENUM('Personal', 'Hipotecario', 'Automotriz', 'Empresarial') NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE prestamo_detalle (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_prestamo INT,
    numero_cuota INT,
    monto_cuota DECIMAL(10,2),
    interes_cuota DECIMAL(10,2),
    capital_cuota DECIMAL(10,2),
    saldo_restante DECIMAL(10,2),
    fecha_pago DATE,
    estado ENUM('Pendiente', 'Pagado', 'Atrasado') DEFAULT 'Pendiente',
    FOREIGN KEY (id_prestamo) REFERENCES prestamos(id_prestamo)
);

# INSERTAR USUARIOS
INSERT INTO usuarios (nombre, apellido_paterno, apellido_materno, tipo, email, password) VALUES
('Juan', 'Pérez', 'Gómez', 'Administrador', 'juan@email.com', 'clave1'),
('Ana', 'Gómez', 'Fernández', 'Cajero', 'ana@email.com', 'clave2'),
('Carlos', 'López', 'Ramírez', 'Gerente', 'carlos@email.com', 'clave3'),
('Lucía', 'Torres', 'Sánchez', 'Asesor', 'lucia@email.com', 'clave4'),
('Pedro', 'Méndez', 'Castro', 'Supervisor', 'pedro@email.com', 'clave5');

# INSERTAR CLIENTES
INSERT INTO clientes (dni, apellido_paterno, apellido_materno, primer_nombre, segundo_nombre, direccion, telefono, nro_hijos, estado_civil, sexo, fecha_nacimiento) VALUES
('11223344', 'Sánchez', 'Gómez', 'Mario', 'Andrés', 'Av. Lima 123', '987654321', 2, 'Casado', 'M', '1985-03-12'),
('22334455', 'Ramírez', 'Torres', 'Luis', 'Eduardo', 'Calle Sol 456', '987123456', 1, 'Soltero', 'M', '1990-07-25'),
('33445566', 'Herrera', 'Mendoza', 'Sofía', 'Isabel', 'Jr. Luna 789', '923456789', 0, 'Soltera', 'F', '1995-09-10'),
('44556677', 'Quispe', 'Flores', 'Elena', 'María', 'Av. Andina 101', '921234567', 3, 'Casada', 'F', '1982-11-30'),
('55667788', 'Gutiérrez', 'Rojas', 'Ricardo', 'José', 'Jr. Cusco 202', '925678123', 2, 'Divorciado', 'M', '1978-06-18'),
('66778899', 'Salas', 'Pérez', 'Gabriela', 'Alejandra', 'Av. Pardo 303', '956789234', 1, 'Viuda', 'F', '1980-04-22'),
('77889900', 'Rojas', 'Delgado', 'Fernando', 'Luis', 'Jr. Sol 404', '934567891', 0, 'Soltero', 'M', '1998-12-05'),
('88990011', 'Díaz', 'Castro', 'Valeria', 'Patricia', 'Calle 8 505', '978901234', 1, 'Casada', 'F', '1993-08-15'),
('99001122', 'Vargas', 'Reyes', 'Raúl', 'Antonio', 'Jr. 9 606', '923489012', 2, 'Casado', 'M', '1987-02-28'),
('10111223', 'Flores', 'Núñez', 'Patricia', 'Lucía', 'Av. 10 707', '954321789', 3, 'Divorciada', 'F', '1975-05-19');

# INSERTAR PRÉSTAMOS
INSERT INTO prestamos (id_cliente, monto, interes, frecuencia_pago, numero_cuotas, saldo, fecha_vencimiento, estado, tipo)
VALUES 
(3, 15000, 7, 'MENSUAL', 18, 15000, '2026-09-01', 'Activo', 'Automotriz'),
(4, 3000, 12, 'SEMANAL', 12, 3000, '2025-06-01', 'Activo', 'Personal'),
(5, 50000, 4, 'MENSUAL', 60, 50000, '2030-01-01', 'Activo', 'Hipotecario'),
(6, 12000, 9, 'SEMANAL', 24, 12000, '2026-02-01', 'Activo', 'Empresarial'),
(7, 8000, 10, 'DIARIO', 30, 8000, '2025-05-01', 'Activo', 'Personal'),
(8, 25000, 6, 'MENSUAL', 36, 25000, '2028-07-01', 'Activo', 'Hipotecario');

# INSERTAR DETALLE DE PRÉSTAMOS
INSERT INTO prestamo_detalle (id_prestamo, numero_cuota, monto_cuota, interes_cuota, capital_cuota, saldo_restante, fecha_pago, estado) 
VALUES 
(1, 3, 500, 40, 460, 3600, '2025-05-01', 'Pagado'),
(2, 1, 833, 50, 783, 19167, '2025-04-01', 'Pagado'),
(3, 2, 850, 59.5, 790.5, 14250, '2025-07-01', 'Pagado'),
(4, 1, 250, 30, 220, 2780, '2025-03-15', 'Pagado'),
(5, 5, 833, 100, 733, 46667, '2025-12-01', 'Pagado'),
(6, 3, 500, 80, 420, 10800, '2026-03-01', 'Pagado');

##################################################################### GUIA 2.1 ###############################################

# PROCEDIMIENTOS ALMACENADOS
DELIMITER $$

CREATE PROCEDURE agregar_cliente(
    IN dni VARCHAR(8), IN apellido_paterno VARCHAR(50), IN apellido_materno VARCHAR(50), 
    IN primer_nombre VARCHAR(50), IN segundo_nombre VARCHAR(50), 
    IN direccion VARCHAR(100), IN telefono VARCHAR(15), IN nro_hijos INT, 
    IN estado_civil ENUM('Soltero', 'Casado', 'Divorciado', 'Viudo'), 
    IN sexo ENUM('M', 'F'), IN fecha_nacimiento DATE)
BEGIN
    INSERT INTO clientes (dni, apellido_paterno, apellido_materno, primer_nombre, segundo_nombre, direccion, telefono, nro_hijos, estado_civil, sexo, fecha_nacimiento) 
    VALUES (dni, apellido_paterno, apellido_materno, primer_nombre, segundo_nombre, direccion, telefono, nro_hijos, estado_civil, sexo, fecha_nacimiento);
END $$

CREATE PROCEDURE listar_clientes()
BEGIN
    SELECT * FROM clientes;
END $$

CREATE PROCEDURE agregar_prestamo(
    IN cliente_dni VARCHAR(8), IN monto DECIMAL(10,2), IN interes DECIMAL(5,2), 
    IN frecuencia ENUM('DIARIO', 'SEMANAL', 'MENSUAL'), IN cuotas INT, IN fecha_vencimiento DATE, IN tipo ENUM('Personal', 'Hipotecario', 'Automotriz', 'Empresarial'))
BEGIN
    DECLARE cliente_id INT;
    SELECT id_cliente INTO cliente_id FROM clientes WHERE dni = cliente_dni;
    
    INSERT INTO prestamos (id_cliente, monto, interes, frecuencia_pago, numero_cuotas, saldo, fecha_vencimiento, tipo) 
    VALUES (cliente_id, monto, interes, frecuencia, cuotas, monto, fecha_vencimiento, tipo);
END $$

CREATE PROCEDURE listar_prestamos()
BEGIN
    SELECT * FROM prestamos;
END $$

DELIMITER ;
##################################################################### GUIA 2.2 ###############################################

# MAYUSCULAS
SELECT id_usuario, UPPER(CONCAT(nombre, ' ', apellido_paterno, ' ', apellido_materno)) AS nombre_completo 
FROM usuarios;

# FECHA DE NACIMIENTO
SELECT id_cliente, CONCAT(primer_nombre, ' ', apellido_paterno) AS nombre, 
       TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE()) AS edad 
FROM clientes;

# EDAD 
SELECT id_cliente, CONCAT(primer_nombre, ' ', apellido_paterno) AS nombre, 
       TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE()) AS edad 
FROM clientes;

# PRESTAMOS FECHA
SELECT id_prestamo, monto, DATE_FORMAT(fecha_otorgamiento, '%d-%m-%Y') AS fecha_otorgamiento 
FROM prestamos;

# Obtener la lista total de préstamos con monto, interés y monto total a pagar
SELECT id_prestamo, monto, interes, 
       (monto + (monto * interes / 100)) AS monto_total 
FROM prestamos;


# Obtener el número total de cuotas pagadas de cada préstamo
SELECT id_prestamo, COUNT(*) AS cuotas_pagadas 
FROM prestamo_detalle 
WHERE estado = 'Pagado' 
GROUP BY id_prestamo;

# Obtener los préstamos otorgados en los últimos 6 meses
SELECT * FROM prestamos 
WHERE fecha_otorgamiento >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH);

# Listar los préstamos cuyo monto es superior al promedio de todos los préstamos
SELECT * FROM prestamos 
WHERE monto > (SELECT AVG(monto) FROM prestamos);

# Listar los préstamos indicando el tiempo transcurrido desde que se otorgó cada préstamo
SELECT id_prestamo, monto, 
       TIMESTAMPDIFF(DAY, fecha_otorgamiento, CURDATE()) AS dias_transcurridos 
FROM prestamos;

# Calcular la edad de cada cliente y clasificarlo por rango de edad
SELECT id_cliente, primer_nombre, apellido_paterno, 
       TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE()) AS edad,
       CASE 
           WHEN TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE()) BETWEEN 18 AND 30 THEN 'Joven'
           WHEN TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE()) BETWEEN 31 AND 50 THEN 'Adulto'
           ELSE 'Adulto mayor'
       END AS clasificacion
FROM clientes;

##################################################################### GUIA 3.1 ###############################################
# Antes de insertar un préstamo, verificar si el cliente está activo
DELIMITER $$
CREATE TRIGGER Antes_del_prestamo
BEFORE INSERT ON prestamos
FOR EACH ROW
BEGIN
    DECLARE cliente_estado ENUM('Activo', 'Inactivo');
    SELECT estado INTO cliente_estado FROM clientes WHERE id_cliente = NEW.id_cliente;
    IF cliente_estado <> 'Activo' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se puede registrar préstamo: Cliente inactivo';
    END IF;
END$$
DELIMITER ;

# Después de insertar un préstamo, generar detalles de pago
DELIMITER $$
CREATE TRIGGER Despues_del_prestamo
AFTER INSERT ON prestamos
FOR EACH ROW
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE fecha_pago DATE;
    WHILE i <= NEW.numero_cuotas DO
        SET fecha_pago = DATE_ADD(NEW.fecha_otorgamiento, INTERVAL i*CASE NEW.frecuencia_pago 
            WHEN 'DIARIO' THEN 1
            WHEN 'SEMANAL' THEN 7
            WHEN 'MENSUAL' THEN 30
        END DAY);
        INSERT INTO prestamo_detalle (id_prestamo, numero_cuota, fecha_pago, estado) 
        VALUES (NEW.id_prestamo, i, fecha_pago, 'Pendiente');
        SET i = i + 1;
    END WHILE;
END$$
DELIMITER ;

# Después de actualizar una cuota, verificar si todas están canceladas
DELIMITER $$
CREATE TRIGGER Despues_de_la_cuota
AFTER UPDATE ON prestamo_detalle
FOR EACH ROW
BEGIN
    DECLARE cuotas_pendientes INT;
    SELECT COUNT(*) INTO cuotas_pendientes FROM prestamo_detalle WHERE id_prestamo = NEW.id_prestamo AND estado <> 'Pagado';
    IF cuotas_pendientes = 0 THEN
        UPDATE prestamos SET estado = 'Cancelado' WHERE id_prestamo = NEW.id_prestamo;
    END IF;
END$$
DELIMITER ;

# Antes de actualizar cliente, registrar en auditoría
DELIMITER $$
CREATE TRIGGER Antes_de_actualizar_cliente
BEFORE UPDATE ON clientes
FOR EACH ROW
BEGIN
    INSERT INTO cliente_auditoria (id_cliente, apellido_paterno_anterior, apellido_materno_anterior, fecha_modificacion) 
    VALUES (OLD.id_cliente, OLD.apellido_paterno, OLD.apellido_materno, NOW());
END$$
DELIMITER ;

# Antes de eliminar un usuario, verificar si tiene préstamos
DELIMITER $$
CREATE TRIGGER Antes_de_eliminar_usuario
BEFORE DELETE ON usuarios
FOR EACH ROW
BEGIN
    DECLARE prestamos_activos INT;
    SELECT COUNT(*) INTO prestamos_activos FROM prestamos WHERE id_cliente IN (SELECT id_cliente FROM clientes WHERE id_cliente = OLD.id_usuario);
    IF prestamos_activos > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se puede eliminar usuario con préstamos activos';
    END IF;
END$$
DELIMITER ;

SHOW TRIGGERS;

##################################################################### GUIA 3.2 ###############################################

# Vista que muestra información del préstamo y su estado de pagos
CREATE VIEW vista_prestamos_estado AS
SELECT 
    p.id_prestamo,
    c.id_cliente,
    CONCAT(c.primer_nombre, ' ', c.apellido_paterno) AS cliente,
    p.monto,
    p.numero_cuotas,
    (SELECT COUNT(*) FROM prestamo_detalle pd WHERE pd.id_prestamo = p.id_prestamo AND pd.estado = 'Pagado') AS cuotas_canceladas,
    (SELECT COUNT(*) FROM prestamo_detalle pd WHERE pd.id_prestamo = p.id_prestamo AND pd.estado = 'Pendiente') AS cuotas_pendientes
FROM prestamos p
JOIN clientes c ON p.id_cliente = c.id_cliente;

# Vista que muestra el total de préstamos y saldo de cada cliente
CREATE VIEW vista_clientes_prestamos AS
SELECT 
    c.id_cliente,
    CONCAT(c.primer_nombre, ' ', c.apellido_paterno) AS cliente,
    SUM(p.monto) AS total_prestamos,
    COALESCE(SUM(pd.monto_cuota), 0) AS total_pagado,
    SUM(p.monto) - COALESCE(SUM(pd.monto_cuota), 0) AS saldo_pendiente
FROM clientes c
LEFT JOIN prestamos p ON c.id_cliente = p.id_cliente
LEFT JOIN prestamo_detalle pd ON p.id_prestamo = pd.id_prestamo AND pd.estado = 'Pagado'
GROUP BY c.id_cliente;

# Vista que muestra usuarios y cantidad de préstamos registrados
CREATE VIEW vista_usuarios_prestamos AS
SELECT 
    u.id_usuario,
    CONCAT(u.nombre, ' ', u.apellido_paterno) AS usuario,
    u.tipo AS tipo_acceso,
    COUNT(p.id_prestamo) AS prestamos_registrados
FROM usuarios u
LEFT JOIN prestamos p ON u.id_usuario = p.id_cliente
GROUP BY u.id_usuario;

# Vista que muestra cuotas pendientes con vencimiento en los próximos 7 días
CREATE VIEW vista_cuotas_pendientes AS
SELECT 
    pd.id_detalle,
    c.id_cliente,
    CONCAT(c.primer_nombre, ' ', c.apellido_paterno) AS cliente,
    pd.id_prestamo,
    pd.numero_cuota,
    pd.fecha_pago,
    pd.estado
FROM prestamo_detalle pd
JOIN prestamos p ON pd.id_prestamo = p.id_prestamo
JOIN clientes c ON p.id_cliente = c.id_cliente
WHERE pd.estado = 'Pendiente' AND pd.fecha_pago BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 7 DAY);

# Vista que muestra clientes ordenados por cantidad de préstamos solicitados
CREATE VIEW vista_clientes_por_prestamos AS
SELECT 
    c.id_cliente,
    CONCAT(c.primer_nombre, ' ', c.apellido_paterno) AS cliente,
    COUNT(p.id_prestamo) AS cantidad_prestamos
FROM clientes c
LEFT JOIN prestamos p ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente
ORDER BY cantidad_prestamos DESC;

# Verificar el contenido de cada vista
SELECT * FROM vista_prestamos_estado;
SELECT * FROM vista_clientes_prestamos;
SELECT * FROM vista_usuarios_prestamos;
SELECT * FROM vista_cuotas_pendientes;
SELECT * FROM vista_clientes_por_prestamos;

# Marcar todas las cuotas de un préstamo como pagadas y verificar vista_prestamos_estado
UPDATE prestamo_detalle SET estado = 'Pagado' WHERE id_prestamo = 1;
SELECT * FROM vista_prestamos_estado WHERE id_prestamo = 1;


