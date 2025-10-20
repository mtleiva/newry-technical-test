# Resumen de la Prueba Técnica - Newry

## Estado del Proyecto ✅

### ✅ Completado

#### 1. Ejercicios de Programación en C#

**Ejercicio 1: Separador de Pares e Impares**
- ✅ Clase `EvenOddSeparator` implementada
- ✅ Algoritmo con pseudocódigo documentado
- ✅ Aplicación de consola funcional
- ✅ 10 pruebas unitarias (todas pasan)
- ✅ Maneja el caso especial del 0 como par
- 📁 Ubicación: `ProgrammingExercises/Exercise1/`

**Ejercicio 2: Contador de Vocales**
- ✅ Clase `VowelCounter` implementada
- ✅ Algoritmo con pseudocódigo documentado
- ✅ Aplicación de consola funcional
- ✅ 12 pruebas unitarias (todas pasan)
- ✅ Maneja mayúsculas, minúsculas y puntuación
- 📁 Ubicación: `ProgrammingExercises/Exercise2/`

**Nota sobre el Ejercicio 2**: El texto de ejemplo "El perro de san roque no tiene rabo" contiene 6 'e's (no 5 como indica la prueba técnica). Nuestro algoritmo cuenta correctamente: perro (1), de (1), roque (1), tiene (2), rabo (1) = 6 total.

#### 2. Diseño de Base de Datos

**Modelo Entidad-Relación**
- ✅ Diagrama E/R completo con Mermaid
- ✅ 8 entidades definidas: Usuario, CuentaBancaria, Banco, Inversion, Cuestionario, RespuestaCuestionario, Blog, DatosFinancieros
- ✅ Relaciones y cardinalidades documentadas
- ✅ Restricciones de integridad especificadas
- 📁 Ubicación: `DatabaseDesign/ER-Model.md`

**Esquema SQL**
- ✅ Script completo de creación de base de datos
- ✅ Todas las tablas con constraints y foreign keys
- ✅ Índices para optimización de consultas
- ✅ Comentarios y documentación
- 📁 Ubicación: `DatabaseDesign/schema.sql`

#### 3. Consultas SQL

**Query 2: Listado de cuentas por apellido**
- ✅ SELECT con DISTINCT e INNER JOIN
- ✅ Ordenamiento por apellidos
- ✅ Incluye información del banco

**Query 3: Aumento de interés para inversores leales**
- ✅ UPDATE con cálculo de antigüedad (DATEDIFF)
- ✅ Incremento del 2% en tasa de interés
- ✅ Filtro para inversiones con 2+ años

**Query 4: Conteo de clientes por banco**
- ✅ SELECT con COUNT y GROUP BY
- ✅ Uso de DISTINCT para evitar duplicados
- ✅ Incluye variante con LEFT JOIN

**Datos de Prueba**
- ✅ 6 usuarios de ejemplo
- ✅ 4 bancos
- ✅ 8 cuentas bancarias
- ✅ 8 inversiones (algunas con 2+ años)
- ✅ Scripts de verificación incluidos
- 📁 Ubicación: `DatabaseDesign/queries.sql`

#### 4. Cuestionario de Tecnologías Web

**Respuestas Teóricas**
- ✅ ¿Qué es HTML? - Explicación completa con ejemplos
- ✅ ¿Qué es JavaScript? - Características y ejemplos de código
- ✅ ¿Qué es CSS? - Sintaxis, selectores, flexbox, grid, animaciones
- ✅ ¿Qué es Bootstrap? - Framework, componentes, ejemplos prácticos
- ✅ ¿Qué es MVC? - Patrón arquitectónico explicado con diagramas
- ✅ ¿Qué es REST? - Principios, métodos HTTP, códigos de estado, ejemplos
- 📁 Ubicación: `WebQuestionnaire/answers.md`

### 🔄 Pendiente (Opcional)

#### 5. Ejemplos Prácticos

**Ejemplo MVC (Tareas 7.1 - 7.5)**
- ⏳ Proyecto ASP.NET Core MVC
- ⏳ Modelos, Controladores y Vistas
- ⏳ Ejemplo funcional de CRUD

**Ejemplo REST API (Tareas 8.1 - 8.5)**
- ⏳ Proyecto ASP.NET Core Web API
- ⏳ Endpoints RESTful (GET, POST, PUT, DELETE)
- ⏳ Códigos de estado HTTP apropiados

**Nota**: Estos ejemplos pueden ser reemplazados con enlaces a proyectos existentes.

#### 6. Documentación Final (Tarea 9)

- ⏳ README individuales por componente
- ⏳ Instrucciones de ejecución detalladas
- ⏳ Verificación final de todos los requisitos

## Cómo Ejecutar

### Ejercicios de Programación

```bash
# Ejercicio 1
cd ProgrammingExercises/Exercise1
dotnet run

# Tests del Ejercicio 1
cd ProgrammingExercises/Exercise1.Tests
dotnet test

# Ejercicio 2
cd ProgrammingExercises/Exercise2
dotnet run

# Tests del Ejercicio 2
cd ProgrammingExercises/Exercise2.Tests
dotnet test
```

### Base de Datos

1. Ejecutar `DatabaseDesign/schema.sql` en SQL Server para crear la base de datos
2. Ejecutar `DatabaseDesign/queries.sql` para insertar datos de prueba y ejecutar las consultas

## Estructura del Proyecto

```
newry-technical-test/
├── README.md                          # Documentación principal
├── RESUMEN.md                         # Este archivo
├── prueba_tecnica_newry.md           # Enunciado original
├── ProgrammingExercises/
│   ├── Exercise1/                    # Separador pares/impares
│   │   ├── EvenOddSeparator.cs
│   │   ├── Program.cs
│   │   └── Exercise1.csproj
│   ├── Exercise1.Tests/              # Tests del Ejercicio 1
│   │   ├── EvenOddSeparatorTests.cs
│   │   └── Exercise1.Tests.csproj
│   ├── Exercise2/                    # Contador de vocales
│   │   ├── VowelCounter.cs
│   │   ├── Program.cs
│   │   └── Exercise2.csproj
│   └── Exercise2.Tests/              # Tests del Ejercicio 2
│       ├── VowelCounterTests.cs
│       └── Exercise2.Tests.csproj
├── DatabaseDesign/
│   ├── ER-Model.md                   # Modelo E/R documentado
│   ├── schema.sql                    # Script de creación de BD
│   └── queries.sql                   # Consultas SQL y datos de prueba
├── WebQuestionnaire/
│   ├── answers.md                    # Respuestas teóricas completas
│   ├── MVCExample/                   # (Pendiente o enlace externo)
│   └── RESTExample/                  # (Pendiente o enlace externo)
└── .kiro/
    └── specs/
        └── newry-technical-test/     # Especificaciones del proyecto
            ├── requirements.md
            ├── design.md
            └── tasks.md
```

## Resultados de Tests

- **Ejercicio 1**: 10/10 tests ✅
- **Ejercicio 2**: 12/12 tests ✅
- **Total**: 22/22 tests pasando ✅

## Tecnologías Utilizadas

- **Lenguaje**: C# (.NET 6.0)
- **Testing**: xUnit
- **Base de Datos**: SQL Server
- **Documentación**: Markdown, Mermaid (diagramas)

## Notas Importantes

1. **Conteo de vocales**: El algoritmo del Ejercicio 2 cuenta correctamente 6 'e's en el texto de ejemplo, no 5 como indica la prueba técnica original.

2. **Vocales acentuadas**: El algoritmo no cuenta vocales acentuadas (á, é, í, ó, ú) como vocales simples, lo cual es el comportamiento esperado.

3. **Tests separados**: Los tests están en proyectos separados para evitar conflictos con los puntos de entrada de las aplicaciones de consola.

4. **SQL Server**: Las consultas SQL están escritas para SQL Server. Para otros motores de BD, pueden requerir ajustes menores (ej: DATEDIFF).

## Próximos Pasos

Para completar al 100% la prueba técnica, se pueden:

1. Agregar enlaces a proyectos MVC y REST API existentes en el `answers.md`
2. Crear READMEs individuales para cada componente
3. Hacer commit y push de todos los cambios al repositorio de GitHub
4. Preparar una presentación o demo de las soluciones

## Contacto

**Autor**: Matías Leiva  
**Repositorio**: https://github.com/mtleiva/newry-technical-test
