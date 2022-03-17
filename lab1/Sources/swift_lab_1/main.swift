import Foundation

// Strings and Text
print("Strings and Text 1.")
var firstNumber = 5
var secondNumber = 10
print("\(firstNumber) + \(secondNumber) = \(firstNumber + secondNumber)")

print("Strings and Text 2.")
let firstString = "Gdansk University of Technology"
var secondString = ""
for character in firstString {
  if character == "n" {
    secondString += "⭐️"
  }
  else {
    secondString += String(character)
  }
}
print(secondString)

print("Strings and Text 3.")
let name = "Filip Szweda"
let reversedName = String(name.reversed())
print("\(name) -> \(reversedName)")

// Control Flow
print("\nControl Flow 1.")
for _ in 1...11 {
  print("I will pass this course with best mark, because Swift is great!")
}

print("Control Flow 2.")
let n = 5
for i in 1...n {
  print(i*i)
}

print("Control Flow 3.")
let N = 4
for _ in 1...N {
  for i in 1...N {
    if i != N {
      print("@", terminator: "")
    }
    else {
      print("@", terminator: "\n")
    }
  }
}

// Arrays
print("\nArrays 1.")
var numbers = [5, 10, 20, 15, 80, 13]
if numbers.max() != nil {
    print((numbers.max())!)
}

print("Arrays 2.")
for number in numbers.reversed() {
    print(number)
}

print("Arrays 3.")
var allNumbers = [10, 20, 10, 11, 13, 20, 10, 30]
var uniqueNumbers = Array(Set(allNumbers))
for uniqueNumber in uniqueNumbers {
    print(uniqueNumber)
}

// Sets
print("\nSets 1.")
var number = 10
var divisors = Set<Int>()
for i in 1...number {
    if number % i == 0 {
        divisors.insert(i)
    }
}
for i in divisors.sorted() {
    print(i)
}

// Dictionaries
print("\nDictionaries 1.")
var flights: [[String: String]] = [
    [
        "flightNumber" : "AA8025",
        "destination" : "Copenhagen"
    ],
    [
        "flightNumber" : "BA1442",
        "destination" : "New York"
    ],
    [
        "flightNumber" : "BD6741",
        "destination" : "Barcelona"
    ]
]
var flightNumbers = Array<String>()
for flight in flights {
    for data in flight {
        if data.key == "flightNumber" {
            flightNumbers.append(data.value)
        }
    }
}
for flightNumber in flightNumbers {
    print(flightNumber)
}

print("Dictionaries 2. (no print)")
var names = ["Hommer","Lisa","Bart"]
let lastName = "Simpson"
var people = Array <[String: String]>()
var person = [String: String]()
for name in names {
    person["firstName"] = name
    person["lastName"] = lastName
    people.append(person)
}
/*for person in people {
    for data in person {
        print(data)
    }
}*/