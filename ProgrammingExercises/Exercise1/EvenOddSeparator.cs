using System;
using System.Collections.Generic;

namespace Exercise1
{
    /// <summary>
    /// Clase que separa números enteros en pares e impares
    /// </summary>
    public class EvenOddSeparator
    {
        /// <summary>
        /// Separa una lista de números enteros en dos listas: pares e impares
        /// </summary>
        /// <param name="numbers">Lista de números enteros a separar</param>
        /// <returns>Tupla con dos listas: (pares, impares)</returns>
        public (List<int> evens, List<int> odds) Separate(List<int> numbers)
        {
            // Validar entrada
            if (numbers == null)
            {
                throw new ArgumentNullException(nameof(numbers), "La lista de números no puede ser null");
            }

            // Inicializar listas para almacenar resultados
            List<int> evens = new List<int>();
            List<int> odds = new List<int>();

            // PSEUDOCÓDIGO:
            // PARA CADA número EN la lista de números
            //     SI número MOD 2 == 0 ENTONCES
            //         AGREGAR número A lista de pares
            //     SI NO
            //         AGREGAR número A lista de impares
            //     FIN SI
            // FIN PARA
            
            // Iterar sobre cada número en la lista
            foreach (int number in numbers)
            {
                // Usar operador módulo para determinar si es par o impar
                // Si el residuo de dividir entre 2 es 0, el número es par
                // Nota: El 0 se considera par según los requisitos
                if (number % 2 == 0)
                {
                    evens.Add(number);
                }
                else
                {
                    odds.Add(number);
                }
            }

            // Retornar tupla con ambas listas
            return (evens, odds);
        }
    }
}
