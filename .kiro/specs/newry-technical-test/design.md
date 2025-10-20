# Design Document

## Overview

This design document outlines the technical approach for completing the Newry technical test. The solution will be implemented in C# and organized into separate projects/folders for each component: programming exercises, database design with SQL queries, and web technologies documentation with practical examples.

## Architecture

The solution will follow a modular structure:

```
newry-technical-test/
├── README.md
├── ProgrammingExercises/
│   ├── Exercise1/
│   │   ├── EvenOddSeparator.cs
│   │   └── Program.cs
│   └── Exercise2/
│       ├── VowelCounter.cs
│       └── Program.cs
├── DatabaseDesign/
│   ├── ER-Model.md (or diagram file)
│   ├── schema.sql
│   └── queries.sql
└── WebQuestionnaire/
    ├── answers.md
    ├── MVCExample/
    │   └── (MVC implementation)
    └── RESTExample/
        └── (REST API implementation)
```

## Components and Interfaces

### 1. Programming Exercises (C#)

#### Exercise 1: Even/Odd Number Separator

**Class: EvenOddSeparator**

```csharp
public class EvenOddSeparator
{
    public (List<int> evens, List<int> odds) Separate(List<int> numbers);
}
```

**Algorithm Approach:**
- Iterate through the input list
- Use modulo operator (%) to determine if number is even or odd
- Add to respective list
- Return tuple with both lists

**Pseudocode:**
```
FUNCTION SeparateNumbers(inputList)
    evenList = empty list
    oddList = empty list
    
    FOR EACH number IN inputList
        IF number MOD 2 == 0 THEN
            ADD number TO evenList
        ELSE
            ADD number TO oddList
        END IF
    END FOR
    
    RETURN (evenList, oddList)
END FUNCTION
```

#### Exercise 2: Vowel Counter

**Class: VowelCounter**

```csharp
public class VowelCounter
{
    public Dictionary<char, (int count, int wordCount)> CountVowels(string text);
}
```

**Algorithm Approach:**
- Split text into words
- For each vowel (a, e, i, o, u), count total occurrences
- Track which words contain each vowel (using HashSet to avoid duplicates)
- Return dictionary with vowel as key and tuple of (occurrence count, word count) as value

**Pseudocode:**
```
FUNCTION CountVowels(text)
    words = SPLIT text BY spaces
    vowels = ['a', 'e', 'i', 'o', 'u']
    results = empty dictionary
    
    FOR EACH vowel IN vowels
        occurrenceCount = 0
        wordsWithVowel = empty set
        
        FOR EACH word IN words
            FOR EACH character IN word
                IF LOWERCASE(character) == vowel THEN
                    occurrenceCount = occurrenceCount + 1
                    ADD word TO wordsWithVowel
                END IF
            END FOR
        END FOR
        
        results[vowel] = (occurrenceCount, SIZE of wordsWithVowel)
    END FOR
    
    RETURN results
END FUNCTION
```

### 2. Database Design

#### Entity-Relationship Model

**Entities:**

1. **Usuario (User)**
   - id_usuario (PK)
   - nombre
   - apellidos
   - email
   - telefono
   - fecha_registro
   - nivel_temeridad (risk level from questionnaire)

2. **CuentaBancaria (BankAccount)**
   - id_cuenta (PK)
   - numero_cuenta
   - titular
   - id_banco (FK)
   - id_usuario (FK)

3. **Banco (Bank)**
   - id_banco (PK)
   - nombre_banco
   - codigo_banco

4. **Inversion (Investment)**
   - id_inversion (PK)
   - id_usuario (FK)
   - id_cuenta (FK)
   - monto_invertido
   - tasa_interes
   - interes_generado
   - fecha_inicio
   - fecha_fin (nullable)
   - tipo_inversion

5. **Cuestionario (Questionnaire)**
   - id_cuestionario (PK)
   - id_usuario (FK)
   - fecha_completado
   - puntuacion_riesgo

6. **RespuestaCuestionario (QuestionnaireAnswer)**
   - id_respuesta (PK)
   - id_cuestionario (FK)
   - pregunta
   - respuesta

7. **Blog**
   - id_post (PK)
   - titulo
   - contenido
   - fecha_publicacion
   - autor
   - categoria

8. **DatosFinancieros (FinancialData)**
   - id_dato (PK)
   - tipo_dato
   - valor
   - fecha_actualizacion
   - descripcion

**Relationships:**
- Usuario 1:N CuentaBancaria
- Banco 1:N CuentaBancaria
- Usuario 1:N Inversion
- CuentaBancaria 1:N Inversion
- Usuario 1:1 Cuestionario
- Cuestionario 1:N RespuestaCuestionario

#### SQL Queries Design

**Query 2: List distinct bank accounts ordered by last name**
```sql
SELECT DISTINCT cb.numero_cuenta, cb.titular, u.apellidos, b.nombre_banco
FROM CuentaBancaria cb
INNER JOIN Usuario u ON cb.id_usuario = u.id_usuario
INNER JOIN Banco b ON cb.id_banco = b.id_banco
ORDER BY u.apellidos;
```

**Query 3: Increase interest rate by 2% for investors with 2+ years**
```sql
UPDATE Inversion
SET tasa_interes = tasa_interes * 1.02
WHERE DATEDIFF(YEAR, fecha_inicio, GETDATE()) >= 2;
```

**Query 4: Count clients per bank**
```sql
SELECT b.nombre_banco, COUNT(DISTINCT u.id_usuario) as numero_clientes
FROM Banco b
INNER JOIN CuentaBancaria cb ON b.id_banco = cb.id_banco
INNER JOIN Usuario u ON cb.id_usuario = u.id_usuario
GROUP BY b.nombre_banco;
```

### 3. Web Technologies Questionnaire

#### Structure

**answers.md** - Theoretical answers to HTML, JavaScript, CSS, Bootstrap questions

**MVC Example** - ASP.NET Core MVC application demonstrating:
- Model: Data classes
- View: Razor views
- Controller: Action methods handling requests

**REST Example** - ASP.NET Core Web API demonstrating:
- RESTful endpoints (GET, POST, PUT, DELETE)
- JSON serialization
- HTTP status codes
- Resource-based routing

## Data Models

### Programming Exercises

```csharp
// Exercise 1
public class NumberSeparatorResult
{
    public List<int> EvenNumbers { get; set; }
    public List<int> OddNumbers { get; set; }
}

// Exercise 2
public class VowelAnalysisResult
{
    public char Vowel { get; set; }
    public int OccurrenceCount { get; set; }
    public int WordCount { get; set; }
}
```

### Database Models (for documentation)

```csharp
public class Usuario
{
    public int IdUsuario { get; set; }
    public string Nombre { get; set; }
    public string Apellidos { get; set; }
    public string Email { get; set; }
    public DateTime FechaRegistro { get; set; }
    public int NivelTemeridad { get; set; }
}

public class Inversion
{
    public int IdInversion { get; set; }
    public int IdUsuario { get; set; }
    public decimal MontoInvertido { get; set; }
    public decimal TasaInteres { get; set; }
    public decimal InteresGenerado { get; set; }
    public DateTime FechaInicio { get; set; }
}
```

## Error Handling

### Programming Exercises
- Validate input is not null
- Handle empty lists/strings gracefully
- Provide meaningful error messages

### SQL Queries
- Use transactions where appropriate
- Handle constraint violations
- Validate date calculations

### Web Examples
- Implement proper exception handling
- Return appropriate HTTP status codes
- Validate input data

## Testing Strategy

### Programming Exercises
- Unit tests for each algorithm
- Test with provided examples
- Test edge cases (empty input, null, single element)
- Verify pseudocode matches implementation

### Database Design
- Verify E/R model covers all requirements
- Test SQL queries with sample data
- Validate query performance
- Check data integrity constraints

### Web Examples
- Test MVC routing and views
- Test REST API endpoints
- Validate request/response formats
- Test error scenarios

## Implementation Notes

- Use .NET 6 or later for C# projects
- Follow C# naming conventions (PascalCase for public members)
- Include XML documentation comments
- Use LINQ where appropriate for cleaner code
- Provide console output demonstrating each solution
- Include README files explaining how to run each component
