// How to store truth with Booleans

let goodDogs = true

var gameOver = false
gameOver.toggle()

let isMultiple = 120.isMultiple(of: 3)

var isAuthenticated = false
isAuthenticated = !isAuthenticated

// How to join strings together
let firstPart = "Hello, "
let secondPart = "world!"
let greeting = firstPart + secondPart

let quote = "Then he tapped a sign saying \"Believe\" and walked away."

let name = "Taylor"
let age = 26
let message = "Hello, my name is \(name) and I'm \(age) years old."

// Checkpoint 1
//// Creates a constant holding any temperature in Celsius
//let celsius = 35
//// Convert that temperature to Fahrenheit by multiplying by 9, dividing by 5, then adding 32.
//
//let celsiusToFahrenheit = ((celsius * 8) / 5) + 32
//
//print("The temperature in Celsius is: \(celsius)° and in Fahrenheit is: \(celsiusToFahrenheit)°")

// transforming into a function

func celsiusToFahrenheitFunc(celsiusValue: Int) {
    let  celsiusToFahrenheit = ((celsiusValue * 8) / 5) + 32
    print("The temperature in Celsius is: \(celsiusValue)° and in Fahrenheit is: \(celsiusToFahrenheit)°")
}

celsiusToFahrenheitFunc(celsiusValue: 35)
