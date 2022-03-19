import Foundation

// Functions
func minValue(a: Int, b: Int) -> Int {
    if a > b {
        return b
    }
    else {
        return a
    }
}

print("Functions 1.")
print(minValue(a: 1, b: 2))
print(minValue(a: 4, b: 3))
print(minValue(a: 5, b: 5))

func lastDigit(a: Int) -> Int {
    let string = String(a)
    let index = string.index(string.startIndex, offsetBy: string.count - 1)
    let character = string[index]
    return Int(String(character)) ?? 0
}

print("\nFunctions 2.")
print(lastDigit(a: 123456))

func divides(a: Int, b: Int) -> Bool {
    let remainder = a % b
    if remainder != 0 {
        return false
    }
    else {
        return true
    }
}

print("\nFunctions 3.")
print(divides(a: 7, b: 3))
print(divides(a: 8, b: 4))

func countDivisors(a: Int) -> Int {
    var divisorsCount = 0
    for b in 1...a {
        if divides(a: a, b: b) {
            divisorsCount += 1
        }
    }
    return divisorsCount
}

print(countDivisors(a: 1))
print(countDivisors(a: 10))
print(countDivisors(a: 12))

func isPrime(a: Int) -> Bool {
    if countDivisors(a: a) == 2 {
        return true
    }
    return false
}

print(isPrime(a: 3))
print(isPrime(a: 8))
print(isPrime(a: 13))