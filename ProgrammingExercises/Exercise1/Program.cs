using System;
using System.Collections.Generic;

namespace Exercise1
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("=== EJERCICIO 1: SEPARADOR DE NÚMEROS PARES E IMPARES ===\n");

            // Crear instancia del separador
            EvenOddSeparator separator = new EvenOddSeparator();

            // Ejemplo proporcionado en la prueba técnica
            List<int> testNumbers = new List<int> { 4, 6, 9, 1, 0, 4, 3, 2, 5, 8, 3, 7 };

            Console.WriteLine("Lista de entrada:");
            Console.WriteLine("{" + string.Join(", ", testNumbers) + "}");
            Console.WriteLine();

            // Ejecutar el algoritmo
            var (evens, odds) = separator.Separate(testNumbers);

            // Mostrar resultados
            Console.WriteLine("Resultados:");
            Console.WriteLine("ListaPares: {" + string.Join(", ", evens) + "}");
            Console.WriteLine("ListaImpares: {" + string.Join(", ", odds) + "}");
            Console.WriteLine();

            // Estadísticas adicionales
            Console.WriteLine($"Total de números pares: {evens.Count}");
            Console.WriteLine($"Total de números impares: {odds.Count}");
            Console.WriteLine();

            // Casos de prueba adicionales
            Console.WriteLine("=== CASOS DE PRUEBA ADICIONALES ===\n");

            // Caso 1: Lista vacía
            TestCase("Lista vacía", new List<int>(), separator);

            // Caso 2: Un solo elemento par
            TestCase("Un elemento par", new List<int> { 2 }, separator);

            // Caso 3: Un solo elemento impar
            TestCase("Un elemento impar", new List<int> { 3 }, separator);

            // Caso 4: Solo pares
            TestCase("Solo pares", new List<int> { 2, 4, 6, 8 }, separator);

            // Caso 5: Solo impares
            TestCase("Solo impares", new List<int> { 1, 3, 5, 7 }, separator);

            // Caso 6: Números negativos
            TestCase("Números negativos", new List<int> { -4, -3, -2, -1, 0, 1, 2 }, separator);

            Console.WriteLine("\nPresiona cualquier tecla para salir...");
            Console.ReadKey();
        }

        static void TestCase(string description, List<int> numbers, EvenOddSeparator separator)
        {
            Console.WriteLine($"Caso: {description}");
            Console.WriteLine("Entrada: {" + string.Join(", ", numbers) + "}");
            
            var (evens, odds) = separator.Separate(numbers);
            
            Console.WriteLine("Pares: {" + string.Join(", ", evens) + "}");
            Console.WriteLine("Impares: {" + string.Join(", ", odds) + "}");
            Console.WriteLine();
        }
    }
}
