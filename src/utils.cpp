#include "utils.h"
#include <cmath>
#include <iomanip>
#include <sstream>

namespace utils {
std::string formatNumber(double number) {
    std::ostringstream oss;
    oss << std::fixed << std::setprecision(2) << number;
    return oss.str();
}

std::vector<int> generateRange(int start, int end) {
    std::vector<int> result;
    for (int i = start; i <= end; ++i) {
        result.push_back(i);
    }
    return result;
}

bool isPrime(int number) {
    if (number < 2)
        return false;
    for (int i = 2; i <= std::sqrt(number); ++i) {
        if (number % i == 0)
            return false;
    }
    return true;
}
}  // namespace utils