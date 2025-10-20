# Diseño de Base de Datos - Dynamics Financial S.L

Este directorio contiene el modelo Entidad-Relación y los scripts SQL para la aplicación de inversiones.

## 📁 Archivos

- **ER-Model.md** - Modelo Entidad-Relación completo con diagrama Mermaid
- **schema.sql** - Script de creación de base de datos y tablas
- **queries.sql** - Consultas SQL requeridas y datos de prueba

## 🗄️ Modelo de Datos

### Entidades (9 tablas)

1. **USUARIO** - Datos personales de clientes
2. **CUENTA_BANCARIA** - Cuentas corrientes y titulares
3. **BANCO** - Entidades bancarias
4. **INVERSION** - Inversiones con cálculo de intereses
5. **TIPO_CUESTIONARIO** - Plantillas de cuestionarios
6. **CUESTIONARIO** - Cuestionarios completados por usuarios
7. **PREGUNTA** - Preguntas del cuestionario
8. **RESPUESTA_CUESTIONARIO** - Respuestas individuales
9. **BLOG** - Publicaciones corporativas

### Características

- ✅ Normalización completa (3FN)
- ✅ Integridad referencial con Foreign Keys
- ✅ Constraints y validaciones
- ✅ Índices para optimización
- ✅ Soporte para múltiples cuentas por usuario
- ✅ Versionado de cuestionarios
- ✅ Historial de inversiones con intereses

## 🚀 Cómo Usar

### Opción 1: SQL Server Management Studio (SSMS)

1. Abrir SSMS y conectarse a SQL Server
2. Abrir `schema.sql`
3. Ejecutar el script (F5) para crear la base de datos
4. Abrir `queries.sql`
5. Ejecutar el script para insertar datos de prueba

### Opción 2: Línea de Comandos (sqlcmd)

```bash
# Crear la base de datos
sqlcmd -S localhost -i schema.sql

# Insertar datos y ejecutar consultas
sqlcmd -S localhost -i queries.sql
```

### Opción 3: Azure Data Studio

1. Abrir Azure Data Studio
2. Conectarse a tu servidor
3. Abrir `schema.sql` y ejecutar
4. Abrir `queries.sql` y ejecutar

## 📊 Consultas SQL Implementadas

### Query 2: Listado de Cuentas por Apellido

```sql
SELECT DISTINCT 
    cb.numero_cuenta,
    cb.titular,
    u.apellidos,
    b.nombre_banco
FROM CUENTA_BANCARIA cb
INNER JOIN USUARIO u ON cb.id_usuario = u.id_usuario
INNER JOIN BANCO b ON cb.id_banco = b.id_banco
ORDER BY u.apellidos;
```

**Propósito:** Obtener todas las cuentas bancarias ordenadas por apellido del titular.

### Query 3: Aumento de Interés para Inversores Leales

```sql
UPDATE INVERSION
SET tasa_interes = tasa_interes * 1.02
WHERE DATEDIFF(YEAR, fecha_inicio, GETDATE()) >= 2
    AND estado = 'activa';
```

**Propósito:** Incrementar 2% la tasa de interés para inversiones con más de 2 años.

### Query 4: Conteo de Clientes por Banco

```sql
SELECT 
    b.nombre_banco,
    COUNT(DISTINCT u.id_usuario) AS numero_clientes
FROM BANCO b
INNER JOIN CUENTA_BANCARIA cb ON b.id_banco = cb.id_banco
INNER JOIN USUARIO u ON cb.id_usuario = u.id_usuario
GROUP BY b.nombre_banco
ORDER BY COUNT(DISTINCT u.id_usuario) DESC;
```

**Propósito:** Obtener el número de clientes únicos por cada banco.

## 📈 Datos de Prueba

El script `queries.sql` incluye datos de ejemplo:

- 6 usuarios
- 4 bancos (Santander, BBVA, CaixaBank, Sabadell)
- 8 cuentas bancarias
- 8 inversiones (algunas con más de 2 años)
- 1 tipo de cuestionario
- 5 preguntas
- 6 cuestionarios completados
- Respuestas de ejemplo
- 3 posts de blog

## 🔍 Ver el Diagrama E/R

El archivo `ER-Model.md` contiene un diagrama Mermaid. Para visualizarlo:

1. Abrir en GitHub (se renderiza automáticamente)
2. Usar un editor con soporte Mermaid (VS Code + extensión)
3. Usar [Mermaid Live Editor](https://mermaid.live/)

## 🛠️ Requisitos

- SQL Server 2016 o superior
- SQL Server Express (gratuito) es suficiente
- O usar Docker:

```bash
docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=YourPassword123" \
  -p 1433:1433 -d mcr.microsoft.com/mssql/server:2019-latest
```

## 📝 Notas

- La base de datos se llama `DynamicsFinancial`
- Los scripts incluyen DROP TABLE para facilitar recreación
- Todos los campos tienen validaciones apropiadas
- Los índices están optimizados para las consultas más frecuentes
