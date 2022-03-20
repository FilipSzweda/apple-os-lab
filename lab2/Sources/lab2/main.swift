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

// Closures
print("\nClosures 1.")
func smartBart(n: Int, closure: () -> ()) {
    for _ in 1...n {
        closure()
    }
}

var printMessage: () -> () = {
    print("I will pass this course with best mark, because Swift is great!")
}

smartBart(n: 11, closure: printMessage)

print("\nClosures 2. (no print)")
let numbers = [10, 16, 18, 30, 38, 40, 44, 50]
let multiplesOfFour = numbers.filter{$0 % 4 == 0}
// print(multiplesOfFour)

print("\nClosures 3.")
print(numbers.reduce(0){max($0, $1)})

print("\nClosures 4.")
var strings = ["Gdansk", "University", "of", "Technology"]
print(strings.reduce(""){if($0.count > 0) {return $0 + " " + $1} else {return $0 + $1}})

print("\nClosures 5.")
let numbers2 = [1, 2 ,3 ,4, 5, 6]
let oddNumbers = numbers2.filter{$0 % 2 == 1}
let squaredOddNumbers = oddNumbers.map{Int(pow(Double($0), 2))}
let summedSquaredOddNumbers = squaredOddNumbers.reduce(0){$0 + $1}
print(summedSquaredOddNumbers)

// Tuples
print("\nTuples 1. (no print)")
func minmax (a: Int, b: Int) -> (Int, Int) {
    if a < b {
        return (a, b)
    }
    else {
        return (b, a)
    }
}
// let tuple = minmax(a: 8, b: 7)
// print(tuple.0)
// print(tuple.1)

print("\nTuples 2. (no print)")
var stringsArray = ["gdansk", "university", "gdansk", "university", "university", "of",  "technology", "technology", "gdansk", "gdansk"]
var countedStrings:[(String, Int)] = []
for string in stringsArray {
    if countedStrings.contains(where: {$0.0 == string}) {
        let index = countedStrings.firstIndex(where: {$0.0 == string}) ?? 0
        countedStrings[index].1 += 1
    }
    else {
        countedStrings.append((string, 1))
    }
}
// for countedString in countedStrings {
//     print(countedString.0)
//     print(countedString.1)
// }

// Enums
print("\nEnums 1. (no print)")
enum Day:Int {
    case Monday = 1
    case Tuesday = 2
    case Wednesday = 3
    case Thursday = 4
    case Friday = 5
    case Saturday = 6
    case Sunday = 7

    func display() -> () {
        switch self {
            case .Monday:
                print("🤡")
            case .Tuesday:
                print("🙃")
            case .Wednesday:
                print("🙂")
            case .Thursday:
                print("😀")
            case .Friday:
                print("😄")
            case .Saturday:
                print("😎")
            case .Sunday:
                print("😴")
        }
    }
}
// let day = Day.Saturday
// day.display()