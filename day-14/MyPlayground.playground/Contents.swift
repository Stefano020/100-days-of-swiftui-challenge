import Cocoa

// How to handle data with optionals

func square(number: Int) -> Int {
    number * number
}

var number: Int? = nil

if let number = number {
    print(square(number: number))
}

// How to unwrap optionals with guard
func getMeaningOfLife() -> Int? {
    42
}
func printMeaningOfLife() {
    guard let name = getMeaningOfLife() else {
        return
    }
    
    print(name)
}

// How to unwrap optionals with nil coalescing
let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]

let new = captains["Serenity"] ?? "N/A"

let input = ""
let number2 = Int(input) ?? 0
print(number2)

// How to use multiple optionals using optional chaining
let names = ["Arya", "Bran", "Robb", "Sansa"]

let chosen = names.randomElement()?.uppercased() ?? "No one"
print("Next in line: \(chosen)")

struct Book {
    let title: String
    let author: String?
}

var book: Book? = nil
let author = book?.author?.first?.uppercased() ?? "A"
print(author)

// How to handle function failure with optionals
enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 23) {
    print("User: \(user)")
}

let user3 = (try? getUser(id: 23)) ?? "Anonymous"
print(user3)


// Checkpoint 9
// Write a function that accepts an optional array of integer. and returns one of thos integers randomly.
// If the array is missing or empty, return a new random number in the range 1 through 100.
// Write your function in a single line of code.

func returnInteger(optionalArray: [Int]?) -> Int { optionalArray?.randomElement() ?? Int.random(in: 1...100) }

print(returnInteger(optionalArray: []))
