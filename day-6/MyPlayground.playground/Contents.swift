import Cocoa
// How to use loop to repeat work
// this go from one to twelve
for i in 1...12 {
    print("5 x \(i) is \(5 * i)")
}

// this go up to five
for i in 1..<5 {
    print("Counting from 1 up to 5: \(i)")
}

// How to use a while loop to repeat work
var countdown = 10

while countdown > 0 {
    print("\(countdown)...")
    countdown -= 1
}

print("Blast off!")

// How to skip lopp items with break and continue
// Continue
let filenames = ["me.jpg", "work.txt", "sophie.jpg"]

for filename in filenames {
    if filename.hasSuffix(".jpg") == false {
        continue
    }
    
    print ("Found picture: \(filename)")
}

// Break
let number1 = 4
let number2 = 14
var multiples = [Int]()

for i in 1...100_000 {
    if i.isMultiple(of: number1) && i.isMultiple(of: number2) {
        multiples.append(i)
        
        if multiples.count == 10 {
            break
        }
    }
}

print(multiples)


// Checkpoint 3
// Fizz Buzz
// Your goal is to loop from 1 through 100, and for each number:
// -If it's multiple of 3, print "Fizz"
// -If it's a multiple of 5, print "Buzz"
// -If it's a multiple of 3 and 5, print "FizzBuzz"
// -Otherwise, just print the number

for i in 1...100 {
    if(i % 3 == 0 && i % 5 != 0) {
        print("Fizz")
    } else if (i % 5 == 0 && i % 3 != 0) {
        print("Buzz")
    } else if (i % 3 == 0 && i % 5 == 0) {
        print("FizzBuzz")
    } else {
        print(i)
    }
}
