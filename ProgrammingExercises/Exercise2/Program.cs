using System;
using System.Collections.Generic;

namespace Exercise2
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("=== EJERCICIO 2: CONTADOR DE VOCALES ===\n");

            // Crear instancia del contador
            VowelCounter counter = new VowelCounter();

            // Ejemplo proporcionado en la prueba técnica
            string testText = "El perro de san roque no tiene rabo";

            Console.WriteLine("Texto de entrada:");
            Console.WriteLine($"\"{testText}\"");
            Console.WriteLine();

            // Ejecutar el algoritmo
            var results = counter.CountVowels(testText);

            // Mostrar resultados formateados
            Console.WriteLine("Resultados:");
            Console.WriteLine(counter.FormatResults(results));
            Console.WriteLine();

            // Mostrar detalles adicionales
            Console.WriteLine("=== DETALLES DEL ANÁLISIS ===");
            int totalVowels = 0;
            foreach (var kvp in results)
            {
                totalVowels += kvp.Value.occurrences;
            }
            Console.WriteLine($"Total de vocales en el texto: {totalVowels}");
            Console.WriteLine($"Total de palabras analizadas: {testText.Split(' ').Length}");
            Console.WriteLine();

            // Casos de prueba adicionales
            Console.WriteLine("=== CASOS DE PRUEBA ADICIONALES ===\n");

            TestCase("Texto con una sola palabra", "Hola", counter);
            TestCase("Texto sin vocales", "Gym", counter);
            TestCase("Texto con mayúsculas y minúsculas", "AEIOU aeiou", counter);
            TestCase("Texto con puntuación", "¡Hola! ¿Cómo estás?", counter);
            TestCase("Texto vacío", "", counter);
            TestCase("Texto con números", "Tengo 3 gatos y 2 perros", counter);
            TestCase("Texto con vocales repetidas", "Aaaaa eeeee iiiii ooooo uuuuu", counter);

            Console.WriteLine("\nPresiona cualquier tecla para salir...");
            Console.ReadKey();
        }

        static void TestCase(string description, string text, VowelCounter counter)
        {
            Console.WriteLine($"Caso: {description}");
            Console.WriteLine($"Entrada: \"{text}\"");
            
            var results = counter.CountVowels(text);
            
            if (results.Values.All(v => v.occurrences == 0))
            {
                Console.WriteLine("No se encontraron vocales");
            }
            else
            {
                Console.WriteLine(counter.FormatResults(results));
            }
            
            Console.WriteLine();
        }
    }

    // Extensión para simplificar la verificación
    static class DictionaryExtensions
    {
        public static bool All<TKey, TValue>(this Dictionary<TKey, TValue>.ValueCollection values, 
            Func<TValue, bool> predicate)
        {
            foreach (var value in values)
            {
                if (!predicate(value))
                    return false;
            }
            return true;
        }
    }
}
