using System;
using System.Collections.Generic;
using Xunit;

namespace Exercise2.Tests
{
    public class VowelCounterTests
    {
        private readonly VowelCounter _counter;

        public VowelCounterTests()
        {
            _counter = new VowelCounter();
        }

        [Fact]
        public void CountVowels_WithProvidedExample_ReturnsCorrectCounts()
        {
            // Arrange
            string text = "El perro de san roque no tiene rabo";

            // Act
            var results = _counter.CountVowels(text);

            // Assert
            Assert.Equal(2, results['a'].occurrences);
            Assert.Equal(2, results['a'].wordCount);
            
            // Nota: El texto tiene 6 'e's (perro, de, roque, tiene), no 5 como indica la prueba técnica
            Assert.Equal(6, results['e'].occurrences);
            Assert.Equal(5, results['e'].wordCount);
            
            Assert.Equal(1, results['i'].occurrences);
            Assert.Equal(1, results['i'].wordCount);
            
            Assert.Equal(4, results['o'].occurrences);
            Assert.Equal(4, results['o'].wordCount);
            
            Assert.Equal(1, results['u'].occurrences);
            Assert.Equal(1, results['u'].wordCount);
        }

        [Fact]
        public void CountVowels_WithEmptyString_ReturnsZeroCounts()
        {
            // Arrange
            string text = "";

            // Act
            var results = _counter.CountVowels(text);

            // Assert
            Assert.Equal(0, results['a'].occurrences);
            Assert.Equal(0, results['e'].occurrences);
            Assert.Equal(0, results['i'].occurrences);
            Assert.Equal(0, results['o'].occurrences);
            Assert.Equal(0, results['u'].occurrences);
        }

        [Fact]
        public void CountVowels_WithTextContainingNoVowels_ReturnsZeroCounts()
        {
            // Arrange
            string text = "Gym fly by";

            // Act
            var results = _counter.CountVowels(text);

            // Assert
            Assert.Equal(0, results['a'].occurrences);
            Assert.Equal(0, results['e'].occurrences);
            Assert.Equal(0, results['i'].occurrences);
            Assert.Equal(0, results['o'].occurrences);
            Assert.Equal(0, results['u'].occurrences);
        }

        [Fact]
        public void CountVowels_WithUppercaseAndLowercase_CountsBothCorrectly()
        {
            // Arrange
            string text = "AEIOU aeiou";

            // Act
            var results = _counter.CountVowels(text);

            // Assert
            Assert.Equal(2, results['a'].occurrences);
            Assert.Equal(1, results['a'].wordCount); // Solo una palabra única "AEIOU"/"aeiou"
            
            Assert.Equal(2, results['e'].occurrences);
            Assert.Equal(1, results['e'].wordCount);
            
            Assert.Equal(2, results['i'].occurrences);
            Assert.Equal(1, results['i'].wordCount);
            
            Assert.Equal(2, results['o'].occurrences);
            Assert.Equal(1, results['o'].wordCount);
            
            Assert.Equal(2, results['u'].occurrences);
            Assert.Equal(1, results['u'].wordCount);
        }

        [Fact]
        public void CountVowels_WithSingleWord_ReturnsCorrectCounts()
        {
            // Arrange
            string text = "Hola";

            // Act
            var results = _counter.CountVowels(text);

            // Assert
            Assert.Equal(1, results['a'].occurrences);
            Assert.Equal(1, results['a'].wordCount);
            
            Assert.Equal(0, results['e'].occurrences);
            Assert.Equal(0, results['e'].wordCount);
            
            Assert.Equal(0, results['i'].occurrences);
            Assert.Equal(0, results['i'].wordCount);
            
            Assert.Equal(1, results['o'].occurrences);
            Assert.Equal(1, results['o'].wordCount);
            
            Assert.Equal(0, results['u'].occurrences);
            Assert.Equal(0, results['u'].wordCount);
        }

        [Fact]
        public void CountVowels_WithPunctuation_IgnoresPunctuationCorrectly()
        {
            // Arrange
            string text = "¡Hola! ¿Cómo estás?";

            // Act
            var results = _counter.CountVowels(text);

            // Assert - Debe contar las vocales ignorando la puntuación
            // Nota: Las vocales acentuadas (ó, á) no se cuentan como vocales simples
            Assert.Equal(1, results['a'].occurrences); // "Hola"
            Assert.Equal(2, results['o'].occurrences); // "Hola" (2 o's)
            Assert.Equal(1, results['e'].occurrences); // "estás"
        }

        [Fact]
        public void CountVowels_WithRepeatedVowels_CountsAllOccurrences()
        {
            // Arrange
            string text = "aaa eee";

            // Act
            var results = _counter.CountVowels(text);

            // Assert
            Assert.Equal(3, results['a'].occurrences);
            Assert.Equal(1, results['a'].wordCount);
            
            Assert.Equal(3, results['e'].occurrences);
            Assert.Equal(1, results['e'].wordCount);
        }

        [Fact]
        public void CountVowels_WithMultipleWordsContainingSameVowel_CountsWordsCorrectly()
        {
            // Arrange
            string text = "casa masa pasa";

            // Act
            var results = _counter.CountVowels(text);

            // Assert
            Assert.Equal(6, results['a'].occurrences); // 2 por cada palabra
            Assert.Equal(3, results['a'].wordCount); // 3 palabras diferentes
        }

        [Fact]
        public void CountVowels_WithNullInput_ThrowsArgumentNullException()
        {
            // Arrange
            string text = null;

            // Act & Assert
            Assert.Throws<ArgumentNullException>(() => _counter.CountVowels(text));
        }

        [Fact]
        public void CountVowels_WithWhitespaceOnly_ReturnsZeroCounts()
        {
            // Arrange
            string text = "   \t\n  ";

            // Act
            var results = _counter.CountVowels(text);

            // Assert
            Assert.Equal(0, results['a'].occurrences);
            Assert.Equal(0, results['e'].occurrences);
            Assert.Equal(0, results['i'].occurrences);
            Assert.Equal(0, results['o'].occurrences);
            Assert.Equal(0, results['u'].occurrences);
        }

        [Fact]
        public void FormatResults_WithValidResults_ReturnsFormattedString()
        {
            // Arrange
            var results = new Dictionary<char, (int occurrences, int wordCount)>
            {
                { 'a', (2, 2) },
                { 'e', (5, 4) },
                { 'i', (1, 1) },
                { 'o', (4, 4) },
                { 'u', (1, 1) }
            };

            // Act
            string formatted = _counter.FormatResults(results);

            // Assert
            Assert.Contains("A → 2 veces, 2 palabras", formatted);
            Assert.Contains("E → 5 veces, 4 palabras", formatted);
            Assert.Contains("I → 1 vez, 1 palabra", formatted);
            Assert.Contains("O → 4 veces, 4 palabras", formatted);
            Assert.Contains("U → 1 vez, 1 palabra", formatted);
        }

        [Fact]
        public void CountVowels_WithAccentedVowels_CountsOnlyUnaccentedVowels()
        {
            // Arrange
            string text = "café";

            // Act
            var results = _counter.CountVowels(text);

            // Assert
            // Solo debe contar 'a', no 'é' (las vocales acentuadas no se cuentan)
            Assert.Equal(1, results['a'].occurrences);
            Assert.Equal(0, results['e'].occurrences); // 'é' no es 'e'
        }
    }
}
