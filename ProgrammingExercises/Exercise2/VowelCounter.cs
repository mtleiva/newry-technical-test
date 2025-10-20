using System;
using System.Collections.Generic;
using System.Linq;

namespace Exercise2
{
    /// <summary>
    /// Clase que cuenta vocales en un texto y las palabras que las contienen
    /// </summary>
    public class VowelCounter
    {
        private static readonly char[] Vowels = { 'a', 'e', 'i', 'o', 'u' };

        /// <summary>
        /// Cuenta las vocales en un texto y el número de palabras que contienen cada vocal
        /// </summary>
        /// <param name="text">Texto a analizar</param>
        /// <returns>Diccionario con vocal como clave y tupla (ocurrencias, palabras) como valor</returns>
        public Dictionary<char, (int occurrences, int wordCount)> CountVowels(string text)
        {
            // Validar entrada
            if (text == null)
            {
                throw new ArgumentNullException(nameof(text), "El texto no puede ser null");
            }

            // Inicializar diccionario de resultados
            var results = new Dictionary<char, (int occurrences, int wordCount)>();

            // PSEUDOCÓDIGO:
            // palabras = DIVIDIR texto POR espacios
            // vocales = ['a', 'e', 'i', 'o', 'u']
            // 
            // PARA CADA vocal EN vocales
            //     contadorOcurrencias = 0
            //     palabrasConVocal = conjunto vacío
            //     
            //     PARA CADA palabra EN palabras
            //         palabraLimpia = ELIMINAR puntuación de palabra
            //         SI palabraLimpia está vacía ENTONCES CONTINUAR
            //         
            //         PARA CADA carácter EN palabraLimpia
            //             SI MINÚSCULA(carácter) == vocal ENTONCES
            //                 contadorOcurrencias = contadorOcurrencias + 1
            //                 AGREGAR palabraLimpia A palabrasConVocal
            //             FIN SI
            //         FIN PARA
            //     FIN PARA
            //     
            //     resultados[vocal] = (contadorOcurrencias, TAMAÑO de palabrasConVocal)
            // FIN PARA
            // 
            // RETORNAR resultados

            // Dividir el texto en palabras
            string[] words = text.Split(new[] { ' ', '\t', '\n', '\r' }, StringSplitOptions.RemoveEmptyEntries);

            // Procesar cada vocal
            foreach (char vowel in Vowels)
            {
                int occurrenceCount = 0;
                HashSet<string> wordsWithVowel = new HashSet<string>(StringComparer.OrdinalIgnoreCase);

                // Analizar cada palabra
                foreach (string word in words)
                {
                    // Limpiar la palabra de puntuación y caracteres especiales
                    string cleanWord = new string(word.Where(c => char.IsLetter(c)).ToArray());
                    
                    if (string.IsNullOrEmpty(cleanWord))
                        continue;

                    bool wordContainsVowel = false;

                    // Contar ocurrencias de la vocal en la palabra
                    foreach (char c in cleanWord)
                    {
                        if (char.ToLower(c) == vowel)
                        {
                            occurrenceCount++;
                            wordContainsVowel = true;
                        }
                    }

                    // Si la palabra contiene la vocal, agregarla al conjunto
                    // El HashSet evita duplicados automáticamente
                    if (wordContainsVowel)
                    {
                        wordsWithVowel.Add(cleanWord);
                    }
                }

                // Almacenar resultados para esta vocal
                results[vowel] = (occurrenceCount, wordsWithVowel.Count);
            }

            return results;
        }

        /// <summary>
        /// Formatea los resultados del análisis de vocales para mostrar en consola
        /// </summary>
        /// <param name="results">Diccionario con los resultados del análisis</param>
        /// <returns>String formateado con los resultados</returns>
        public string FormatResults(Dictionary<char, (int occurrences, int wordCount)> results)
        {
            var lines = new List<string>();

            foreach (var vowel in Vowels)
            {
                if (results.ContainsKey(vowel))
                {
                    var (occurrences, wordCount) = results[vowel];
                    string occurrenceText = occurrences == 1 ? "vez" : "veces";
                    string wordText = wordCount == 1 ? "palabra" : "palabras";
                    
                    lines.Add($"{char.ToUpper(vowel)} → {occurrences} {occurrenceText}, {wordCount} {wordText}");
                }
            }

            return string.Join(Environment.NewLine, lines);
        }
    }
}
