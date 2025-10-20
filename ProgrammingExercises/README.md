# Ejercicios de Programación en C#

Este directorio contiene las soluciones a los ejercicios de programación de la prueba técnica.

## 📁 Estructura

```
ProgrammingExercises/
├── Exercise1/              # Ejercicio 1: Separador de Pares e Impares
│   ├── EvenOddSeparator.cs
│   ├── Program.cs
│   └── Exercise1.csproj
├── Exercise1.Tests/        # Tests del Ejercicio 1
│   ├── EvenOddSeparatorTests.cs
│   └── Exercise1.Tests.csproj
├── Exercise2/              # Ejercicio 2: Contador de Vocales
│   ├── VowelCounter.cs
│   ├── Program.cs
│   └── Exercise2.csproj
└── Exercise2.Tests/        # Tests del Ejercicio 2
    ├── VowelCounterTests.cs
    └── Exercise2.Tests.csproj
```

## 🚀 Cómo Ejecutar

### Ejercicio 1: Separador de Pares e Impares

```bash
# Ejecutar la aplicación
cd Exercise1
dotnet run

# Ejecutar los tests
cd ../Exercise1.Tests
dotnet test --verbosity normal
```

**Descripción:** Algoritmo que separa una lista de números enteros en dos listas: pares e impares.

**Ejemplo:**
- Entrada: `{4,6,9,1,0,4,3,2,5,8,3,7}`
- Salida:
  - Pares: `{4,6,0,4,2,8}`
  - Impares: `{9,1,3,5,3,7}`

### Ejercicio 2: Contador de Vocales

```bash
# Ejecutar la aplicación
cd Exercise2
dotnet run

# Ejecutar los tests
cd ../Exercise2.Tests
dotnet test --verbosity normal
```

**Descripción:** Algoritmo que cuenta las vocales en un texto y el número de palabras que contienen cada vocal.

**Ejemplo:**
- Entrada: `"El perro de san roque no tiene rabo"`
- Salida:
  - A → 2 veces, 2 palabras
  - E → 6 veces, 5 palabras
  - I → 1 vez, 1 palabra
  - O → 4 veces, 4 palabras
  - U → 1 vez, 1 palabra

## ✅ Tests

Ambos ejercicios incluyen pruebas unitarias exhaustivas:

- **Exercise 1:** 10 tests
- **Exercise 2:** 12 tests
- **Total:** 22 tests

Para ejecutar todos los tests:

```bash
dotnet test Exercise1.Tests/Exercise1.Tests.csproj
dotnet test Exercise2.Tests/Exercise2.Tests.csproj
```

## 📝 Características

- ✅ Pseudocódigo documentado en los algoritmos
- ✅ Manejo de casos edge (null, vacío, etc.)
- ✅ Validación de entrada
- ✅ Cobertura completa de tests
- ✅ Código limpio y bien estructurado
- ✅ Comentarios explicativos

## 🛠️ Tecnologías

- **Lenguaje:** C# 10.0
- **Framework:** .NET 6.0
- **Testing:** xUnit
- **IDE Recomendado:** Visual Studio, VS Code, o Rider
