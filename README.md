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

## 🔧 Instrucciones de Uso

### Ejercicios de Programación

```bash
cd ProgrammingExercises/Exercise1
dotnet run
```

```bash
cd ProgrammingExercises/Exercise2
dotnet run
```

### Base de Datos

1. Ejecutar el script `schema.sql` para crear las tablas
2. Ejecutar el script `queries.sql` para probar las consultas

### Ejemplos Web

Consultar los README individuales en cada carpeta de ejemplo.

## 👤 Autor

Matías Leiva

## 📄 Licencia

Este proyecto es parte de una prueba técnica para Newry.
