import Cocoa
// How to reuse code with functions
func printTimesTables(number: Int, end: Int) {
    for i in 1...end {
        print("\(i) * \(number) is \(i * number)")
    }
}

printTimesTables(number: 5, end: 20)

// How to return values from functions
let root = sqrt(169)
print(root)

func rollDice() -> Int {
    return Int.random(in: 1...6)
}

let result = rollDice()
print(result)

func stringContainSameLetters(str1: String, str2: String) -> Bool{
    if (str1.sorted() == str2.sorted()) {
        return true
    } else {
        return false
    }
// better solution
    //srt1.sorted() == str2.sorted() dosen't need return
}

let containSameLetters = stringContainSameLetters(str1: "ABC", str2: "CBA")

print(containSameLetters)

// How to return multiple values from functions
func getUser() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}
let (firstName, lastName) = getUser()
print(firstName, lastName)

// How to customize parameter labels
func isUppercase(_ string: String) -> Bool {
    string == string.uppercased()
}

let string = "HELLO, WORLD"
let isUppercasedResult = isUppercase(string)

