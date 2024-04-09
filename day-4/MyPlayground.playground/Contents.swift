// How to use type annotations

// if you want to initialize a variable without a value you can set, Remember, you need to add the open and close parentheses when making empty arrays, dictionaries, and sets, because it’s where Swift allows us to customize the way they are created.

var teams: [String] = [String]()
var cities: [String] = []
var clues = [String]()

enum UIStyle {
    case light, dark, system
}

var style = UIStyle.light
// Now that we add UIStyle to style, we can use directly .dark
style = .dark


// Checkpoint 2
let arrayOfStrings = ["String1", "String2", "String3", "String4", "String5", "String1", "String4"]

print("Number of items on array: \(arrayOfStrings.count)")

let uniqueItemsFromArrayOfStrings = Set(arrayOfStrings)

print("Number of unique items from array of strings: \(uniqueItemsFromArrayOfStrings.count)")

