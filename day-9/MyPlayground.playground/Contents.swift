import Cocoa
// How to create and use closures
let sayHello = {
    print("Hi there!")
}

var sayHelloCopy: () -> Void = sayHello

sayHello()

let sayHello2 = { (name: String) -> String in
        "Hi \(name)"
}

sayHello2("teste")

let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
let sortedTeam = team.sorted()
print(sortedTeam)

// Sorted function accepts a function inside to decide with string should return first.
func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    
    return name1 < name2
}

let captainFirstTeam = team.sorted(by: captainFirstSorted)
print(captainFirstTeam)

let captainFirstTeamWithClosure = team.sorted(by: { (name1: String, name2: String) in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    
    return name1 < name2
})
print(captainFirstTeamWithClosure)


// How to use trailing clousures and shorthand syntax
// In this case I've feel that is too much, but if it is a simple function it works fine
let sorted3 = team.sorted {
    if $0 == "Suzanne" {
        return true
    } else if $1 == "Suzanne" {
        return false
    }
    
    return $0 < $1
}
print(sorted3)

// Simple funtion to revert.
let reverseTeam = team.sorted { $0 > $1 }
print(reverseTeam)

let tOnly = team.filter { $0.hasPrefix("T") }
print(tOnly)

let uppercaseTeam = team.map { $0.uppercased() }
print(uppercaseTeam)


// How to accept functions as parameters
func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()
    
    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }
    
    return numbers
}

let rolls = makeArray(size: 50) {
    Int.random(in: 1...20)
}
print(rolls)

func generateNumber() -> Int {
    Int.random(in: 1...20)
}
let newRolls = makeArray(size: 50, using: generateNumber)
print(newRolls)

func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("About to start first work")
    first()
    print("About to start second work")
    second()
    print("About to start third work")
    third()
    print("Done!")
}

doImportantWork {
    print("This is the first work")
} second: {
    print("This is the second work")
} third: {
    print("this is the third work")
}


// Checkpoint 5
// - Your input is this:
// let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]
// Your job is to:
// - Filter out any numbers that are even
// - Sort the array in ascending order
// - Map them to strings in the format “7 is a lucky number”
// - Print the resulting array, one item per line

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

func printLuckyNumbers(
    arrayOfNumbers: [Int],
    _ filterOutEven: ([Int]) -> [Int],
    _ sortAscendingNumbers: ([Int]) -> [Int],
    _ mapLuckyNumbers: ([Int]) -> Void
) {
    
    let filteredOutEven = filterOutEven(arrayOfNumbers)
    
    let sortedAscendingNumbers = sortAscendingNumbers(filteredOutEven)
    
    mapLuckyNumbers(sortedAscendingNumbers)
}

printLuckyNumbers(
    arrayOfNumbers: luckyNumbers,
    { $0.filter({ !$0.isMultiple(of: 2) }) },
    { $0.sorted() },
    { $0.forEach({ if $0.isMultiple(of: 7) { print("\($0) is a lucky number.")}})})


let luckyNumbersNew = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

func printLuckyNumbersNew(
    arrayOfNumbersNew: [Int],
    _ filterOutEvenNew: ([Int]) -> [Int],
    _ sortAscendingNumbersNew: () -> [Int],
    _ mapLuckyNumbersNew: ([Int]) -> Void
) {
    
    let filteredOutEvenNew = filterOutEvenNew(arrayOfNumbersNew)
    
    let sortedAscendingNumbersNew = sortAscendingNumbersNew()
    
    mapLuckyNumbersNew(sortedAscendingNumbersNew)
}

let filterOutEvenNew: ([Int]) -> [Int] = { numbers in
    return numbers.filter { $0 % 2 != 0 }
}

let sortAscendingNumbersNew = { filterOutEvenNew(luckyNumbersNew).sorted() }

let mapLuckyNumbersNew = { (arrayToMap: [Int]) in
    arrayToMap.forEach({
        if $0 % 7 == 0 {
            print("\($0) is a lucky number.")
        }
    })
}

printLuckyNumbersNew(
    arrayOfNumbersNew: luckyNumbersNew,
    filterOutEvenNew,
    sortAscendingNumbersNew,
    mapLuckyNumbersNew)
