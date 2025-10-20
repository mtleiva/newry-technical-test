# Newry Technical Test - Dynamics Financial S.L

[![.NET](https://img.shields.io/badge/.NET-6.0-512BD4?logo=dotnet)](https://dotnet.microsoft.com/)
[![C#](https://img.shields.io/badge/C%23-10.0-239120?logo=csharp)](https://docs.microsoft.com/en-us/dotnet/csharp/)
[![SQL Server](https://img.shields.io/badge/SQL%20Server-CC2927?logo=microsoftsqlserver)](https://www.microsoft.com/sql-server)
[![Tests](https://img.shields.io/badge/Tests-22%2F22%20Passing-success)](https://github.com/mtleiva/newry-technical-test)

Este repositorio contiene las soluciones completas a la prueba técnica de Newry, que incluye ejercicios de programación en C#, diseño de base de datos, consultas SQL y documentación de tecnologías web.

## 📁 Estructura del Proyecto

```
newry-technical-test/
├── 📂 ProgrammingExercises/
│   ├── 📂 Exercise1/              # ✅ Separador de pares e impares
│   │   ├── EvenOddSeparator.cs   # Algoritmo principal
│   │   ├── Program.cs             # Aplicación de consola
│   │   └── Exercise1.csproj
│   ├── 📂 Exercise1.Tests/        # ✅ 10 pruebas unitarias
│   ├── 📂 Exercise2/              # ✅ Contador de vocales
│   │   ├── VowelCounter.cs       # Algoritmo principal
│   │   ├── Program.cs             # Aplicación de consola
│   │   └── Exercise2.csproj
│   └── 📂 Exercise2.Tests/        # ✅ 12 pruebas unitarias
├── 📂 DatabaseDesign/
│   ├── ER-Model.md               # ✅ Modelo E/R completo
│   ├── schema.sql                # ✅ Script de creación de BD
│   └── queries.sql               # ✅ Consultas SQL + datos de prueba
├── 📂 WebQuestionnaire/
│   ├── answers.md                # ✅ Respuestas teóricas completas
│   ├── MVCExample/               # (Enlaces a proyectos externos)
│   └── RESTExample/              # (Enlaces a proyectos externos)
├── README.md                     # Este archivo
├── RESUMEN.md                    # Resumen ejecutivo
└── .gitignore
```

## ✨ Características Destacadas

- ✅ **22/22 pruebas unitarias pasando**
- ✅ **Código limpio y bien documentado**
- ✅ **Pseudocódigo incluido en algoritmos**
- ✅ **Base de datos completamente diseñada**
- ✅ **Consultas SQL con datos de prueba**
- ✅ **Documentación exhaustiva de tecnologías web**

## 🚀 Componentes

### 1. Ejercicios de Programación (C#)

#### Ejercicio 1: Separador de Pares e Impares
Algoritmo que separa una lista de números enteros en dos listas: pares e impares.

**Ejemplo:**
- Entrada: `{4,6,9,1,0,4,3,2,5,8,3,7}`
- Salida: 
  - Pares: `{4,6,0,4,2,8}`
  - Impares: `{9,1,3,5,3,7}`

#### Ejercicio 2: Contador de Vocales
Algoritmo que cuenta las vocales en un texto y el número de palabras que contienen cada vocal.

**Ejemplo:**
- Entrada: `"El perro de san roque no tiene rabo"`
- Salida:
  - A → 2 veces, 2 palabras
  - E → 5 veces, 4 palabras
  - I → 1 vez, 1 palabra
  - O → 4 veces, 4 palabras
  - U → 1 vez, 1 palabra

### 2. Diseño de Base de Datos

Modelo Entidad-Relación para la aplicación de inversiones de Dynamics Financial S.L, incluyendo:
- Gestión de usuarios y cuentas bancarias
- Sistema de inversiones con cálculo de intereses
- Cuestionario de perfil de riesgo
- Blog corporativo

**Consultas SQL implementadas:**
1. Listado de cuentas bancarias ordenadas por apellido
2. Aumento de interés del 2% para inversores con más de 2 años
3. Conteo de clientes por banco

### 3. Cuestionario de Tecnologías Web

Respuestas teóricas y ejemplos prácticos sobre:
- HTML, JavaScript, CSS, Bootstrap
- Patrón MVC (con implementación en ASP.NET Core)
- Arquitectura REST (con implementación de API)

## 📋 Requisitos

- .NET 6.0 o superior
- SQL Server (para las consultas SQL)
- Editor de código (Visual Studio, VS Code, Rider)

## 🚀 Cómo Probar el Proyecto

### Prerrequisitos

- [.NET 6.0 SDK](https://dotnet.microsoft.com/download/dotnet/6.0) o superior
- [SQL Server](https://www.microsoft.com/sql-server/sql-server-downloads) (Express Edition es suficiente)
- [Git](https://git-scm.com/downloads)

### 1️⃣ Clonar el Repositorio

```bash
git clone https://github.com/mtleiva/newry-technical-test.git
cd newry-technical-test
```

### 2️⃣ Probar los Ejercicios de Programación

#### Ejercicio 1: Separador de Pares e Impares

```bash
# Navegar a la carpeta del ejercicio
cd ProgrammingExercises/Exercise1

# Ejecutar la aplicación
dotnet run

# Ejecutar las pruebas unitarias
cd ../Exercise1.Tests
dotnet test
```

**Resultado esperado:** 
- La aplicación mostrará la separación de números pares e impares
- Las pruebas mostrarán: `10/10 tests passing ✅`

#### Ejercicio 2: Contador de Vocales

```bash
# Navegar a la carpeta del ejercicio
cd ../Exercise2

# Ejecutar la aplicación
dotnet run

# Ejecutar las pruebas unitarias
cd ../Exercise2.Tests
dotnet test
```

**Resultado esperado:**
- La aplicación mostrará el conteo de vocales y palabras
- Las pruebas mostrarán: `12/12 tests passing ✅`

### 3️⃣ Probar la Base de Datos

#### Opción A: SQL Server Management Studio (SSMS)

1. Abrir SQL Server Management Studio
2. Conectarse a tu instancia de SQL Server
3. Abrir el archivo `DatabaseDesign/schema.sql`
4. Ejecutar el script (F5) para crear la base de datos y tablas
5. Abrir el archivo `DatabaseDesign/queries.sql`
6. Ejecutar el script para insertar datos de prueba y ejecutar las consultas

#### Opción B: Línea de Comandos (sqlcmd)

```bash
# Crear la base de datos y tablas
sqlcmd -S localhost -i DatabaseDesign/schema.sql

# Insertar datos de prueba y ejecutar consultas
sqlcmd -S localhost -i DatabaseDesign/queries.sql
```

**Resultado esperado:**
- Base de datos `DynamicsFinancial` creada
- 9 tablas creadas con sus relaciones
- Datos de prueba insertados (6 usuarios, 4 bancos, 8 cuentas, 8 inversiones)
- Consultas SQL ejecutadas correctamente

### 4️⃣ Revisar la Documentación

#### Modelo E/R y Diseño de Base de Datos

```bash
# Ver el modelo E/R completo
cat DatabaseDesign/ER-Model.md
```

O abrir el archivo en tu editor favorito para ver el diagrama Mermaid renderizado.

#### Cuestionario de Tecnologías Web

```bash
# Ver las respuestas teóricas
cat WebQuestionnaire/answers.md
```

Incluye explicaciones detalladas de HTML, JavaScript, CSS, Bootstrap, MVC y REST con ejemplos de código.

## 🧪 Verificación Rápida

Para verificar que todo funciona correctamente:

```bash
# Desde la raíz del proyecto

# 1. Compilar todos los proyectos
dotnet build ProgrammingExercises/Exercise1/Exercise1.csproj
dotnet build ProgrammingExercises/Exercise2/Exercise2.csproj

# 2. Ejecutar todas las pruebas
dotnet test ProgrammingExercises/Exercise1.Tests/Exercise1.Tests.csproj
dotnet test ProgrammingExercises/Exercise2.Tests/Exercise2.Tests.csproj
```

**Resultado esperado:** `22/22 tests passing ✅`

## 🔍 Detalles de Implementación

### Ejercicios de Programación

- **Lenguaje:** C# 10.0
- **Framework:** .NET 6.0
- **Testing:** xUnit
- **Características:**
  - Algoritmos con pseudocódigo documentado
  - Manejo de casos edge (listas vacías, null, etc.)
  - Validación de entrada
  - Cobertura completa de tests

### Base de Datos

- **Motor:** SQL Server
- **Características:**
  - 9 entidades normalizadas
  - Relaciones con integridad referencial
  - Índices para optimización
  - Constraints y validaciones
  - Datos de prueba incluidos

### Consultas SQL Implementadas

1. **Query 2:** Listado de cuentas bancarias ordenadas por apellido
2. **Query 3:** Aumento del 2% en tasa de interés para inversores con 2+ años
3. **Query 4:** Conteo de clientes por banco

## ❓ Troubleshooting

### Error: "dotnet: command not found"

Instala el .NET SDK desde [dotnet.microsoft.com](https://dotnet.microsoft.com/download)

### Error: "Cannot connect to SQL Server"

Verifica que SQL Server esté ejecutándose:
```bash
# Windows
services.msc  # Buscar "SQL Server"

# O usar Docker
docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=YourPassword123" -p 1433:1433 -d mcr.microsoft.com/mssql/server:2019-latest
```

### Tests fallan con "file not found"

Asegúrate de estar en el directorio correcto:
```bash
cd ProgrammingExercises/Exercise1.Tests
dotnet test
```

### Problemas con caracteres especiales en SQL

Asegúrate de que los archivos SQL estén en UTF-8 con BOM.

## 📊 Resultados de Tests

```
Exercise1.Tests: 10/10 passing ✅
  ✓ Separate_WithProvidedExample_ReturnsCorrectLists
  ✓ Separate_WithEmptyList_ReturnsEmptyLists
  ✓ Separate_WithSingleEvenElement_ReturnsOneEvenZeroOdd
  ✓ Separate_WithSingleOddElement_ReturnsZeroEvenOneOdd
  ✓ Separate_WithAllEvenNumbers_ReturnsOnlyEvens
  ✓ Separate_WithAllOddNumbers_ReturnsOnlyOdds
  ✓ Separate_WithZero_TreatsZeroAsEven
  ✓ Separate_WithNegativeNumbers_SeparatesCorrectly
  ✓ Separate_WithNullInput_ThrowsArgumentNullException
  ✓ Separate_WithDuplicateNumbers_PreservesAllOccurrences

Exercise2.Tests: 12/12 passing ✅
  ✓ CountVowels_WithProvidedExample_ReturnsCorrectCounts
  ✓ CountVowels_WithEmptyString_ReturnsZeroCounts
  ✓ CountVowels_WithTextContainingNoVowels_ReturnsZeroCounts
  ✓ CountVowels_WithUppercaseAndLowercase_CountsBothCorrectly
  ✓ CountVowels_WithSingleWord_ReturnsCorrectCounts
  ✓ CountVowels_WithPunctuation_IgnoresPunctuationCorrectly
  ✓ CountVowels_WithRepeatedVowels_CountsAllOccurrences
  ✓ CountVowels_WithMultipleWordsContainingSameVowel_CountsWordsCorrectly
  ✓ CountVowels_WithNullInput_ThrowsArgumentNullException
  ✓ CountVowels_WithWhitespaceOnly_ReturnsZeroCounts
  ✓ FormatResults_WithValidResults_ReturnsFormattedString
  ✓ CountVowels_WithAccentedVowels_CountsOnlyUnaccentedVowels

Total: 22/22 tests passing ✅
```

## 📞 Contacto

**Autor:** Matías Leiva  
**Repositorio:** [github.com/mtleiva/newry-technical-test](https://github.com/mtleiva/newry-technical-test)  
**Prueba Técnica:** Newry - Dynamics Financial S.L

## 📄 Licencia

Este proyecto es parte de una prueba técnica para Newry.
