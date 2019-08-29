using System;
using System.Numerics;

namespace Warehouse
{
    class Program
    {
        static int xIndex;
        static int yIndex;

        static BigInteger xValue;
        static BigInteger yValue;
        static void Main(string[] args)
        {
            while (true)
            {
                //Console.WriteLine("Please enter an X coordinate, return, then a Y coordinate ");
                string firstInput = Console.ReadLine();
                if (firstInput == "test")
                {
                    RunTests();
                }
                else
                {
                    xIndex = Int32.Parse(firstInput);
                    if (xIndex == 0) break;
                    yIndex = Int32.Parse(Console.ReadLine());

                    FindId(xIndex, yIndex);
                }
            }
        }

        private static void FindId(int x, int y)
        {
            xIndex = x;
            yIndex = y;

            xValue = 1;
            yValue = xIndex == 1 ? xValue : FindXValue(2);

            BigInteger id = yIndex == 1 ? yValue : FindYValue(2);
            Console.WriteLine($"The id of the cargo at ({xIndex}, {yIndex}) is : {id}");
        }

        private static BigInteger FindXValue(int x)
        {
            xValue += x;
            return x == xIndex ? xValue : FindXValue(x + 1);
        }

        private static BigInteger FindYValue(int y)
        {
            yValue += xIndex + y - 2;
            return y == yIndex ? yValue : FindYValue(y + 1);
        }

        private static void RunTests()
        {
            FindId(2, 2);
            FindId(2, 4);
            FindId(4, 1);
            FindId(4, 2);
            FindId(100000, 100000);
        }
    }
}