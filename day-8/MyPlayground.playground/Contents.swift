import Cocoa
// How to provide default values for parameters
func exampleOfDefault(str1: String = "Default") {
    print("My string \(str1)")
}

exampleOfDefault()
exampleOfDefault(str1: "A new string")

// How to handle erros in functions
enum PasswordError: Error {
    case short, obvious
}

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 { throw PasswordError.short }
    if password == "12345" { throw PasswordError.obvious }
    
    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}

let string = "12345"

do {
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch PasswordError.short {
    print("Please use a longer password.")
} catch PasswordError.obvious {
    print("I have the same combination on my luggage!")
} catch {
    print("There was an error: \(error.localizedDescription)")
}

// Checkpoint 4
// Write a function that accepts an integer from 1 through 10,000, and returns the integer square root of that number.
//  - You can't use the built-in sqrt() function or similar - you need to find the square root yourself.
//  - If the number is less than 1 or greater than 10,000 you should throw an "out of bounds" error.
//  - You should only consider integer square roots.
//  - If you can't find the square root, throw a "no root" error.

enum findSquareRootErros: Error {
    case outOfBounds, noRoot
}

func findSquareRoot(_ number: Int) throws -> Int {
    if number < 1 || number > 10_000 {
        throw findSquareRootErros.outOfBounds
    }
    
    var squareRoot: Int = 0
    
    for i in 1...number {
        if i * i == number {
            squareRoot = i
            break
        } else if i * i > number {
            throw findSquareRootErros.noRoot
        }
    }
    
    switch squareRoot {
    case 0:
        throw findSquareRootErros.noRoot
    default:
        return squareRoot
    }
}

do {
    let result = try findSquareRoot(9)
} catch findSquareRootErros.outOfBounds {
    print("Out of bounds.")
} catch findSquareRootErros.noRoot {
    print("No root.")
} catch {
    print("There was an error: \(error.localizedDescription)")
}
