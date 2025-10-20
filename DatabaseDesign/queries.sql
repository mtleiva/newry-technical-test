-- =============================================
-- Consultas SQL - Dynamics Financial S.L
-- =============================================

USE DynamicsFinancial;
GO

-- =============================================
-- QUERY 2: Listado de cuentas bancarias distintas 
-- ordenadas por apellidos
-- =============================================
-- Descripción: Obtiene un listado de todas las cuentas bancarias
-- distintas de todos los usuarios, ordenado por apellidos

SELECT DISTINCT 
    cb.numero_cuenta AS 'Número de Cuenta',
    cb.titular AS 'Titular',
    u.apellidos AS 'Apellidos',
    u.nombre AS 'Nombre',
    b.nombre_banco AS 'Banco',
    cb.saldo_actual AS 'Saldo Actual',
    cb.fecha_apertura AS 'Fecha Apertura'
FROM CUENTA_BANCARIA cb
INNER JOIN USUARIO u ON cb.id_usuario = u.id_usuario
INNER JOIN BANCO b ON cb.id_banco = b.id_banco
WHERE cb.activa = 1  -- Solo cuentas activas
ORDER BY u.apellidos, u.nombre;
GO


-- =============================================
-- QUERY 3: Aumentar 2% el tipo de interés para 
-- inversores con más de 2 años
-- =============================================
-- Descripción: Incrementa la tasa de interés en un 2% para todas
-- las inversiones de clientes que llevan más de 2 años invirtiendo

-- Primero, consulta para ver qué inversiones se verán afectadas
SELECT 
    i.id_inversion,
    u.nombre + ' ' + u.apellidos AS 'Inversor',
    i.monto_invertido AS 'Monto',
    i.tasa_interes AS 'Tasa Actual (%)',
    i.tasa_interes * 1.02 AS 'Nueva Tasa (%)',
    i.fecha_inicio AS 'Fecha Inicio',
    DATEDIFF(YEAR, i.fecha_inicio, GETDATE()) AS 'Años Invertido'
FROM INVERSION i
INNER JOIN USUARIO u ON i.id_usuario = u.id_usuario
WHERE DATEDIFF(YEAR, i.fecha_inicio, GETDATE()) >= 2
    AND i.estado = 'activa';
GO

-- Ejecutar el UPDATE para aumentar el interés
UPDATE INVERSION
SET tasa_interes = tasa_interes * 1.02
WHERE DATEDIFF(YEAR, fecha_inicio, GETDATE()) >= 2
    AND estado = 'activa';
GO

-- Verificar los cambios realizados
SELECT 
    COUNT(*) AS 'Inversiones Actualizadas'
FROM INVERSION
WHERE DATEDIFF(YEAR, fecha_inicio, GETDATE()) >= 2
    AND estado = 'activa';
GO


-- =============================================
-- QUERY 4: Número de clientes por banco
-- =============================================
-- Descripción: Obtiene el conteo de clientes distintos que tienen
-- cuentas en cada banco

SELECT 
    b.nombre_banco AS 'Banco',
    b.codigo_banco AS 'Código',
    COUNT(DISTINCT u.id_usuario) AS 'Número de Clientes',
    COUNT(cb.id_cuenta) AS 'Total de Cuentas'
FROM BANCO b
INNER JOIN CUENTA_BANCARIA cb ON b.id_banco = cb.id_banco
INNER JOIN USUARIO u ON cb.id_usuario = u.id_usuario
WHERE cb.activa = 1  -- Solo cuentas activas
GROUP BY b.nombre_banco, b.codigo_banco
ORDER BY COUNT(DISTINCT u.id_usuario) DESC;
GO

-- Variante: Incluir bancos sin clientes
SELECT 
    b.nombre_banco AS 'Banco',
    b.codigo_banco AS 'Código',
    COUNT(DISTINCT u.id_usuario) AS 'Número de Clientes',
    COUNT(cb.id_cuenta) AS 'Total de Cuentas'
FROM BANCO b
LEFT JOIN CUENTA_BANCARIA cb ON b.id_banco = cb.id_banco AND cb.activa = 1
LEFT JOIN USUARIO u ON cb.id_usuario = u.id_usuario
GROUP BY b.nombre_banco, b.codigo_banco
ORDER BY COUNT(DISTINCT u.id_usuario) DESC;
GO


-- =============================================
-- DATOS DE PRUEBA
-- =============================================
-- Insertar datos de ejemplo para probar las consultas

-- Insertar Bancos
INSERT INTO BANCO (nombre_banco, codigo_banco, direccion, telefono) VALUES
('Banco Santander', 'BSCH-ES', 'Paseo de la Castellana 1, Madrid', '912345678'),
('BBVA', 'BBVA-ES', 'Gran Vía 1, Madrid', '913456789'),
('CaixaBank', 'CAIX-ES', 'Avenida Diagonal 621, Barcelona', '934567890'),
('Banco Sabadell', 'BSAB-ES', 'Avenida Óscar Esplá 37, Alicante', '965678901');
GO

-- Insertar Usuarios
INSERT INTO USUARIO (nombre, apellidos, email, telefono, direccion, nivel_temeridad) VALUES
('Juan', 'García López', 'juan.garcia@email.com', '600111222', 'Calle Mayor 1, Madrid', 5),
('María', 'Martínez Sánchez', 'maria.martinez@email.com', '600222333', 'Calle Menor 2, Barcelona', 3),
('Pedro', 'Rodríguez Fernández', 'pedro.rodriguez@email.com', '600333444', 'Avenida Principal 3, Valencia', 7),
('Ana', 'López García', 'ana.lopez@email.com', '600444555', 'Plaza Central 4, Sevilla', 4),
('Carlos', 'Fernández Martínez', 'carlos.fernandez@email.com', '600555666', 'Calle Real 5, Bilbao', 6),
('Laura', 'Sánchez Rodríguez', 'laura.sanchez@email.com', '600666777', 'Avenida Libertad 6, Málaga', 2);
GO

-- Insertar Cuentas Bancarias
INSERT INTO CUENTA_BANCARIA (numero_cuenta, titular, id_banco, id_usuario, saldo_actual) VALUES
('ES1234567890123456789012', 'Juan García López', 1, 1, 15000.00),
('ES2345678901234567890123', 'Juan García López', 2, 1, 8000.00),
('ES3456789012345678901234', 'María Martínez Sánchez', 1, 2, 25000.00),
('ES4567890123456789012345', 'Pedro Rodríguez Fernández', 3, 3, 50000.00),
('ES5678901234567890123456', 'Ana López García', 2, 4, 12000.00),
('ES6789012345678901234567', 'Carlos Fernández Martínez', 1, 5, 30000.00),
('ES7890123456789012345678', 'Laura Sánchez Rodríguez', 4, 6, 18000.00),
('ES8901234567890123456789', 'Pedro Rodríguez Fernández', 1, 3, 22000.00);
GO

-- Insertar Inversiones (algunas con más de 2 años)
INSERT INTO INVERSION (id_usuario, id_cuenta, monto_invertido, tasa_interes, interes_generado, fecha_inicio, tipo_inversion, estado) VALUES
(1, 1, 10000.00, 3.50, 1050.00, DATEADD(YEAR, -3, GETDATE()), 'Depósito a Plazo', 'activa'),
(1, 2, 5000.00, 2.75, 412.50, DATEADD(YEAR, -1, GETDATE()), 'Fondo de Inversión', 'activa'),
(2, 3, 20000.00, 4.00, 2400.00, DATEADD(YEAR, -2, GETDATE()), 'Bonos', 'activa'),
(3, 4, 35000.00, 5.50, 5775.00, DATEADD(YEAR, -3, GETDATE()), 'Acciones', 'activa'),
(4, 5, 8000.00, 3.25, 780.00, DATEADD(MONTH, -18, GETDATE()), 'Depósito a Plazo', 'activa'),
(5, 6, 25000.00, 4.50, 3375.00, DATEADD(YEAR, -2, GETDATE()), 'Fondo Mixto', 'activa'),
(6, 7, 15000.00, 3.00, 900.00, DATEADD(MONTH, -6, GETDATE()), 'Depósito a Plazo', 'activa'),
(3, 8, 18000.00, 4.25, 2295.00, DATEADD(YEAR, -2, GETDATE()), 'Bonos Corporativos', 'activa');
GO

-- Insertar Cuestionarios
INSERT INTO CUESTIONARIO (id_usuario, puntuacion_riesgo, perfil_inversor) VALUES
(1, 50, 'moderado'),
(2, 30, 'conservador'),
(3, 70, 'agresivo'),
(4, 40, 'moderado'),
(5, 60, 'agresivo'),
(6, 20, 'conservador');
GO

-- Insertar Respuestas de Cuestionario (ejemplo para usuario 1)
INSERT INTO RESPUESTA_CUESTIONARIO (id_cuestionario, numero_pregunta, pregunta, respuesta, puntos) VALUES
(1, 1, '¿Cuál es su experiencia en inversiones?', 'Intermedia', 5),
(1, 2, '¿Qué porcentaje de pérdida estaría dispuesto a aceptar?', '10-20%', 5),
(1, 3, '¿Cuál es su horizonte temporal de inversión?', '5-10 años', 5);
GO

-- Insertar Posts de Blog
INSERT INTO BLOG (titulo, contenido, autor, categoria, publicado) VALUES
('Guía de Inversión para Principiantes', 'Contenido del artículo sobre inversión básica...', 'Dynamics Financial', 'Educación', 1),
('Tendencias del Mercado 2024', 'Análisis de las tendencias actuales del mercado...', 'Equipo de Análisis', 'Análisis', 1),
('Diversificación de Cartera', 'Importancia de diversificar tus inversiones...', 'Dynamics Financial', 'Estrategia', 1);
GO

-- Insertar Datos Financieros
INSERT INTO DATOS_FINANCIEROS (tipo_dato, valor, descripcion, fuente) VALUES
('Euribor 12 meses', 3.50, 'Tasa Euribor a 12 meses', 'BCE'),
('Índice IBEX 35', 9850.50, 'Valor del índice IBEX 35', 'Bolsa de Madrid'),
('Tipo de cambio EUR/USD', 1.0850, 'Tipo de cambio Euro-Dólar', 'Mercado Forex');
GO

PRINT 'Datos de prueba insertados correctamente';
PRINT '';
PRINT '==============================================';
PRINT 'RESUMEN DE DATOS INSERTADOS:';
PRINT '==============================================';
SELECT 'Bancos' AS Tabla, COUNT(*) AS Total FROM BANCO
UNION ALL
SELECT 'Usuarios', COUNT(*) FROM USUARIO
UNION ALL
SELECT 'Cuentas Bancarias', COUNT(*) FROM CUENTA_BANCARIA
UNION ALL
SELECT 'Inversiones', COUNT(*) FROM INVERSION
UNION ALL
SELECT 'Cuestionarios', COUNT(*) FROM CUESTIONARIO
UNION ALL
SELECT 'Posts de Blog', COUNT(*) FROM BLOG;
GO

-- =============================================
-- VERIFICACIÓN DE CONSULTAS
-- =============================================

PRINT '';
PRINT '==============================================';
PRINT 'VERIFICACIÓN QUERY 2: Cuentas por Apellido';
PRINT '==============================================';
PRINT 'Debe mostrar 8 cuentas ordenadas alfabéticamente por apellido';
PRINT '';

SELECT DISTINCT 
    cb.numero_cuenta AS 'Número de Cuenta',
    cb.titular AS 'Titular',
    u.apellidos AS 'Apellidos',
    u.nombre AS 'Nombre',
    b.nombre_banco AS 'Banco'
FROM CUENTA_BANCARIA cb
INNER JOIN USUARIO u ON cb.id_usuario = u.id_usuario
INNER JOIN BANCO b ON cb.id_banco = b.id_banco
WHERE cb.activa = 1
ORDER BY u.apellidos, u.nombre;
GO

PRINT '';
PRINT '==============================================';
PRINT 'VERIFICACIÓN QUERY 3: Inversiones con 2+ años';
PRINT '==============================================';
PRINT 'Inversiones que recibirán aumento del 2%:';
PRINT '';

SELECT 
    i.id_inversion AS 'ID',
    u.nombre + ' ' + u.apellidos AS 'Inversor',
    i.monto_invertido AS 'Monto',
    i.tasa_interes AS 'Tasa Actual (%)',
    ROUND(i.tasa_interes * 1.02, 2) AS 'Nueva Tasa (%)',
    DATEDIFF(YEAR, i.fecha_inicio, GETDATE()) AS 'Años'
FROM INVERSION i
INNER JOIN USUARIO u ON i.id_usuario = u.id_usuario
WHERE DATEDIFF(YEAR, i.fecha_inicio, GETDATE()) >= 2
    AND i.estado = 'activa';
GO

PRINT '';
PRINT 'Nota: Para aplicar el aumento, ejecutar el UPDATE de la Query 3';
PRINT '';

PRINT '';
PRINT '==============================================';
PRINT 'VERIFICACIÓN QUERY 4: Clientes por Banco';
PRINT '==============================================';
PRINT 'Conteo de clientes únicos por banco:';
PRINT '';

SELECT 
    b.nombre_banco AS 'Banco',
    COUNT(DISTINCT u.id_usuario) AS 'Clientes',
    COUNT(cb.id_cuenta) AS 'Cuentas'
FROM BANCO b
INNER JOIN CUENTA_BANCARIA cb ON b.id_banco = cb.id_banco
INNER JOIN USUARIO u ON cb.id_usuario = u.id_usuario
WHERE cb.activa = 1
GROUP BY b.nombre_banco
ORDER BY COUNT(DISTINCT u.id_usuario) DESC;
GO

PRINT '';
PRINT '==============================================';
PRINT 'ESTADÍSTICAS ADICIONALES';
PRINT '==============================================';

-- Total de inversiones activas
SELECT 
    COUNT(*) AS 'Total Inversiones Activas',
    SUM(monto_invertido) AS 'Monto Total Invertido',
    AVG(tasa_interes) AS 'Tasa Promedio (%)',
    SUM(interes_generado) AS 'Interés Total Generado'
FROM INVERSION
WHERE estado = 'activa';
GO

-- Usuarios por perfil de inversor
SELECT 
    perfil_inversor AS 'Perfil',
    COUNT(*) AS 'Cantidad de Usuarios'
FROM CUESTIONARIO
GROUP BY perfil_inversor
ORDER BY COUNT(*) DESC;
GO

-- Distribución de cuentas por banco
SELECT 
    b.nombre_banco AS 'Banco',
    COUNT(cb.id_cuenta) AS 'Número de Cuentas',
    SUM(cb.saldo_actual) AS 'Saldo Total'
FROM BANCO b
LEFT JOIN CUENTA_BANCARIA cb ON b.id_banco = cb.id_banco
GROUP BY b.nombre_banco
ORDER BY COUNT(cb.id_cuenta) DESC;
GO

PRINT '';
PRINT '==============================================';
PRINT 'VERIFICACIÓN COMPLETADA';
PRINT '==============================================';
PRINT 'Todas las consultas han sido ejecutadas correctamente';
PRINT '';
