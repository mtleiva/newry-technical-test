-- =============================================
-- Script de Creación de Base de Datos
-- Dynamics Financial S.L - Sistema de Inversiones
-- =============================================

-- Crear la base de datos
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'DynamicsFinancial')
BEGIN
    CREATE DATABASE DynamicsFinancial;
END
GO

USE DynamicsFinancial;
GO

-- =============================================
-- Eliminar tablas si existen (para recreación)
-- =============================================
IF OBJECT_ID('RESPUESTA_CUESTIONARIO', 'U') IS NOT NULL DROP TABLE RESPUESTA_CUESTIONARIO;
IF OBJECT_ID('CUESTIONARIO', 'U') IS NOT NULL DROP TABLE CUESTIONARIO;
IF OBJECT_ID('INVERSION', 'U') IS NOT NULL DROP TABLE INVERSION;
IF OBJECT_ID('CUENTA_BANCARIA', 'U') IS NOT NULL DROP TABLE CUENTA_BANCARIA;
IF OBJECT_ID('BANCO', 'U') IS NOT NULL DROP TABLE BANCO;
IF OBJECT_ID('USUARIO', 'U') IS NOT NULL DROP TABLE USUARIO;
IF OBJECT_ID('BLOG', 'U') IS NOT NULL DROP TABLE BLOG;
IF OBJECT_ID('DATOS_FINANCIEROS', 'U') IS NOT NULL DROP TABLE DATOS_FINANCIEROS;
GO

-- =============================================
-- Tabla: USUARIO
-- Descripción: Almacena información de clientes
-- =============================================
CREATE TABLE USUARIO (
    id_usuario INT IDENTITY(1,1) PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL,
    apellidos NVARCHAR(150) NOT NULL,
    email NVARCHAR(255) NOT NULL UNIQUE,
    telefono NVARCHAR(20),
    direccion NVARCHAR(500),
    fecha_registro DATETIME NOT NULL DEFAULT GETDATE(),
    nivel_temeridad INT CHECK (nivel_temeridad BETWEEN 1 AND 10),
    activo BIT NOT NULL DEFAULT 1
);
GO

-- =============================================
-- Tabla: BANCO
-- Descripción: Almacena información de bancos
-- =============================================
CREATE TABLE BANCO (
    id_banco INT IDENTITY(1,1) PRIMARY KEY,
    nombre_banco NVARCHAR(200) NOT NULL,
    codigo_banco NVARCHAR(50) NOT NULL UNIQUE,
    direccion NVARCHAR(500),
    telefono NVARCHAR(20)
);
GO

-- =============================================
-- Tabla: CUENTA_BANCARIA
-- Descripción: Almacena cuentas bancarias de usuarios
-- =============================================
CREATE TABLE CUENTA_BANCARIA (
    id_cuenta INT IDENTITY(1,1) PRIMARY KEY,
    numero_cuenta NVARCHAR(50) NOT NULL UNIQUE,
    titular NVARCHAR(200) NOT NULL,
    id_banco INT NOT NULL,
    id_usuario INT NOT NULL,
    saldo_actual DECIMAL(18,2) DEFAULT 0.00,
    fecha_apertura DATETIME NOT NULL DEFAULT GETDATE(),
    activa BIT NOT NULL DEFAULT 1,
    CONSTRAINT FK_CuentaBancaria_Banco FOREIGN KEY (id_banco) 
        REFERENCES BANCO(id_banco) ON DELETE CASCADE,
    CONSTRAINT FK_CuentaBancaria_Usuario FOREIGN KEY (id_usuario) 
        REFERENCES USUARIO(id_usuario) ON DELETE CASCADE
);
GO

-- =============================================
-- Tabla: INVERSION
-- Descripción: Almacena inversiones de usuarios
-- =============================================
CREATE TABLE INVERSION (
    id_inversion INT IDENTITY(1,1) PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_cuenta INT NOT NULL,
    monto_invertido DECIMAL(18,2) NOT NULL CHECK (monto_invertido > 0),
    tasa_interes DECIMAL(5,2) NOT NULL CHECK (tasa_interes >= 0),
    interes_generado DECIMAL(18,2) DEFAULT 0.00,
    fecha_inicio DATETIME NOT NULL DEFAULT GETDATE(),
    fecha_fin DATETIME NULL,
    tipo_inversion NVARCHAR(100) NOT NULL,
    estado NVARCHAR(50) NOT NULL DEFAULT 'activa' 
        CHECK (estado IN ('activa', 'finalizada', 'cancelada')),
    CONSTRAINT FK_Inversion_Usuario FOREIGN KEY (id_usuario) 
        REFERENCES USUARIO(id_usuario) ON DELETE NO ACTION,
    CONSTRAINT FK_Inversion_CuentaBancaria FOREIGN KEY (id_cuenta) 
        REFERENCES CUENTA_BANCARIA(id_cuenta) ON DELETE NO ACTION
);
GO

-- =============================================
-- Tabla: CUESTIONARIO
-- Descripción: Almacena cuestionarios de perfil de riesgo
-- =============================================
CREATE TABLE CUESTIONARIO (
    id_cuestionario INT IDENTITY(1,1) PRIMARY KEY,
    id_usuario INT NOT NULL UNIQUE,
    fecha_completado DATETIME NOT NULL DEFAULT GETDATE(),
    puntuacion_riesgo INT NOT NULL,
    perfil_inversor NVARCHAR(50) NOT NULL 
        CHECK (perfil_inversor IN ('conservador', 'moderado', 'agresivo')),
    CONSTRAINT FK_Cuestionario_Usuario FOREIGN KEY (id_usuario) 
        REFERENCES USUARIO(id_usuario) ON DELETE CASCADE
);
GO

-- =============================================
-- Tabla: RESPUESTA_CUESTIONARIO
-- Descripción: Almacena respuestas individuales del cuestionario
-- =============================================
CREATE TABLE RESPUESTA_CUESTIONARIO (
    id_respuesta INT IDENTITY(1,1) PRIMARY KEY,
    id_cuestionario INT NOT NULL,
    numero_pregunta INT NOT NULL,
    pregunta NVARCHAR(500) NOT NULL,
    respuesta NVARCHAR(500) NOT NULL,
    puntos INT NOT NULL DEFAULT 0,
    CONSTRAINT FK_RespuestaCuestionario_Cuestionario FOREIGN KEY (id_cuestionario) 
        REFERENCES CUESTIONARIO(id_cuestionario) ON DELETE CASCADE
);
GO

-- =============================================
-- Tabla: BLOG
-- Descripción: Almacena publicaciones del blog
-- =============================================
CREATE TABLE BLOG (
    id_post INT IDENTITY(1,1) PRIMARY KEY,
    titulo NVARCHAR(300) NOT NULL,
    contenido NVARCHAR(MAX) NOT NULL,
    fecha_publicacion DATETIME NOT NULL DEFAULT GETDATE(),
    autor NVARCHAR(150) NOT NULL,
    categoria NVARCHAR(100),
    publicado BIT NOT NULL DEFAULT 0
);
GO

-- =============================================
-- Tabla: DATOS_FINANCIEROS
-- Descripción: Almacena datos financieros actualizados
-- =============================================
CREATE TABLE DATOS_FINANCIEROS (
    id_dato INT IDENTITY(1,1) PRIMARY KEY,
    tipo_dato NVARCHAR(100) NOT NULL,
    valor DECIMAL(18,4) NOT NULL,
    fecha_actualizacion DATETIME NOT NULL DEFAULT GETDATE(),
    descripcion NVARCHAR(500),
    fuente NVARCHAR(200)
);
GO

-- =============================================
-- Índices para optimización de consultas
-- =============================================

-- Índices en USUARIO
CREATE INDEX idx_usuario_email ON USUARIO(email);
CREATE INDEX idx_usuario_apellidos ON USUARIO(apellidos);
CREATE INDEX idx_usuario_activo ON USUARIO(activo);
GO

-- Índices en CUENTA_BANCARIA
CREATE INDEX idx_cuenta_usuario ON CUENTA_BANCARIA(id_usuario);
CREATE INDEX idx_cuenta_banco ON CUENTA_BANCARIA(id_banco);
CREATE INDEX idx_cuenta_activa ON CUENTA_BANCARIA(activa);
GO

-- Índices en INVERSION
CREATE INDEX idx_inversion_usuario ON INVERSION(id_usuario);
CREATE INDEX idx_inversion_cuenta ON INVERSION(id_cuenta);
CREATE INDEX idx_inversion_fecha_inicio ON INVERSION(fecha_inicio);
CREATE INDEX idx_inversion_estado ON INVERSION(estado);
GO

-- Índices en BLOG
CREATE INDEX idx_blog_fecha ON BLOG(fecha_publicacion);
CREATE INDEX idx_blog_categoria ON BLOG(categoria);
CREATE INDEX idx_blog_publicado ON BLOG(publicado);
GO

-- Índices en DATOS_FINANCIEROS
CREATE INDEX idx_datos_tipo ON DATOS_FINANCIEROS(tipo_dato);
CREATE INDEX idx_datos_fecha ON DATOS_FINANCIEROS(fecha_actualizacion);
GO

-- =============================================
-- Comentarios de tablas (SQL Server Extended Properties)
-- =============================================
EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = 'Almacena información de usuarios/clientes',
    @level0type = N'SCHEMA', @level0name = 'dbo',
    @level1type = N'TABLE', @level1name = 'USUARIO';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = 'Almacena información de entidades bancarias',
    @level0type = N'SCHEMA', @level0name = 'dbo',
    @level1type = N'TABLE', @level1name = 'BANCO';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = 'Almacena cuentas bancarias de usuarios',
    @level0type = N'SCHEMA', @level0name = 'dbo',
    @level1type = N'TABLE', @level1name = 'CUENTA_BANCARIA';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = 'Almacena inversiones realizadas por usuarios',
    @level0type = N'SCHEMA', @level0name = 'dbo',
    @level1type = N'TABLE', @level1name = 'INVERSION';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = 'Almacena cuestionarios de perfil de riesgo',
    @level0type = N'SCHEMA', @level0name = 'dbo',
    @level1type = N'TABLE', @level1name = 'CUESTIONARIO';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = 'Almacena respuestas individuales de cuestionarios',
    @level0type = N'SCHEMA', @level0name = 'dbo',
    @level1type = N'TABLE', @level1name = 'RESPUESTA_CUESTIONARIO';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = 'Almacena publicaciones del blog corporativo',
    @level0type = N'SCHEMA', @level0name = 'dbo',
    @level1type = N'TABLE', @level1name = 'BLOG';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = 'Almacena datos financieros actualizados',
    @level0type = N'SCHEMA', @level0name = 'dbo',
    @level1type = N'TABLE', @level1name = 'DATOS_FINANCIEROS';
GO

PRINT 'Base de datos DynamicsFinancial creada exitosamente';
PRINT 'Todas las tablas, índices y restricciones han sido creados';
GO
