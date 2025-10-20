using System;
using System.Collections.Generic;
using Xunit;

namespace Exercise1.Tests
{
    public class EvenOddSeparatorTests
    {
        private readonly EvenOddSeparator _separator;

        public EvenOddSeparatorTests()
        {
            _separator = new EvenOddSeparator();
        }

        [Fact]
        public void Separate_WithProvidedExample_ReturnsCorrectLists()
        {
            // Arrange
            var input = new List<int> { 4, 6, 9, 1, 0, 4, 3, 2, 5, 8, 3, 7 };
            var expectedEvens = new List<int> { 4, 6, 0, 4, 2, 8 };
            var expectedOdds = new List<int> { 9, 1, 3, 5, 3, 7 };

            // Act
            var (evens, odds) = _separator.Separate(input);

            // Assert
            Assert.Equal(expectedEvens, evens);
            Assert.Equal(expectedOdds, odds);
        }

        [Fact]
        public void Separate_WithEmptyList_ReturnsEmptyLists()
        {
            // Arrange
            var input = new List<int>();

            // Act
            var (evens, odds) = _separator.Separate(input);

            // Assert
            Assert.Empty(evens);
            Assert.Empty(odds);
        }

        [Fact]
        public void Separate_WithSingleEvenElement_ReturnsOneEvenZeroOdd()
        {
            // Arrange
            var input = new List<int> { 4 };

            // Act
            var (evens, odds) = _separator.Separate(input);

            // Assert
            Assert.Single(evens);
            Assert.Equal(4, evens[0]);
            Assert.Empty(odds);
        }

        [Fact]
        public void Separate_WithSingleOddElement_ReturnsZeroEvenOneOdd()
        {
            // Arrange
            var input = new List<int> { 5 };

            // Act
            var (evens, odds) = _separator.Separate(input);

            // Assert
            Assert.Empty(evens);
            Assert.Single(odds);
            Assert.Equal(5, odds[0]);
        }

        [Fact]
        public void Separate_WithAllEvenNumbers_ReturnsOnlyEvens()
        {
            // Arrange
            var input = new List<int> { 2, 4, 6, 8, 10 };

            // Act
            var (evens, odds) = _separator.Separate(input);

            // Assert
            Assert.Equal(5, evens.Count);
            Assert.Equal(input, evens);
            Assert.Empty(odds);
        }

        [Fact]
        public void Separate_WithAllOddNumbers_ReturnsOnlyOdds()
        {
            // Arrange
            var input = new List<int> { 1, 3, 5, 7, 9 };

            // Act
            var (evens, odds) = _separator.Separate(input);

            // Assert
            Assert.Empty(evens);
            Assert.Equal(5, odds.Count);
            Assert.Equal(input, odds);
        }

        [Fact]
        public void Separate_WithZero_TreatsZeroAsEven()
        {
            // Arrange
            var input = new List<int> { 0 };

            // Act
            var (evens, odds) = _separator.Separate(input);

            // Assert
            Assert.Single(evens);
            Assert.Equal(0, evens[0]);
            Assert.Empty(odds);
        }

        [Fact]
        public void Separate_WithNegativeNumbers_SeparatesCorrectly()
        {
            // Arrange
            var input = new List<int> { -4, -3, -2, -1, 0, 1, 2 };
            var expectedEvens = new List<int> { -4, -2, 0, 2 };
            var expectedOdds = new List<int> { -3, -1, 1 };

            // Act
            var (evens, odds) = _separator.Separate(input);

            // Assert
            Assert.Equal(expectedEvens, evens);
            Assert.Equal(expectedOdds, odds);
        }

        [Fact]
        public void Separate_WithNullInput_ThrowsArgumentNullException()
        {
            // Arrange
            List<int> input = null;

            // Act & Assert
            Assert.Throws<ArgumentNullException>(() => _separator.Separate(input));
        }

        [Fact]
        public void Separate_WithDuplicateNumbers_PreservesAllOccurrences()
        {
            // Arrange
            var input = new List<int> { 2, 2, 3, 3, 4, 4 };
            var expectedEvens = new List<int> { 2, 2, 4, 4 };
            var expectedOdds = new List<int> { 3, 3 };

            // Act
            var (evens, odds) = _separator.Separate(input);

            // Assert
            Assert.Equal(expectedEvens, evens);
            Assert.Equal(expectedOdds, odds);
        }
    }
}
