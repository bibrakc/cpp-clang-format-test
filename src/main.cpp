#include <iostream>
#include <vector>
#include "calculator.h"
#include "utils.h"

int main() {
    Calculator calc;

    std::cout << "Calculator Test:" << std::endl;
    std::cout << "5 + 3 = " << calc.add(5, 3) << std::endl;
    std::cout << "10 - 4 = " << calc.subtract(10, 4) << std::endl;
    std::cout << "6 * 7 = " << calc.multiply(6, 7) << std::endl;
    std::cout << "15 / 3 = " << utils::formatNumber(calc.divide(15, 3)) << std::endl;

    std::cout << "\nUtils Test:" << std::endl;
    std::vector<int> range = utils::generateRange(1, 10);
    std::cout << "Prime numbers from 1 to 10: ";
    for (int num : range) {
        if (utils::isPrime(num)) {
            std::cout << num << " ";
        }
    }
    std::cout << std::endl;

    return 0;
}