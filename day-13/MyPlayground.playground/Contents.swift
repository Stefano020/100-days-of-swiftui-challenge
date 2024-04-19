import Cocoa

// How to create and use protocols
protocol Vehicle {
    var name: String { get }
    var currentPassengers: Int { get set }
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

struct Car: Vehicle {
    let name = "Car"
    var currentPassengers = 1
    
    
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }
    
    func travel(distance: Int) {
        print("I'm driving \(distance)km")
    }
    
    func openSunroof() {
        print("It's a nice day!")
    }
}

struct Bicycle: Vehicle {
    let name = "Bicycle"
    var currentPassengers = 1
    
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }
    
    func travel(distance: Int) {
        print("I'm cycling \(distance)km")
    }
}

func commute(distance: Int, using vehicle: Vehicle) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("That's too slow! I'll try a different vehicle.")
    } else {
        vehicle.travel(distance: distance)
    }
}

func getTravelEstimates(using vehicles: [Vehicle], distance: Int) {
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.name): \(estimate) hours to travel \(distance)km")
    }
}

let car = Car()
commute(distance: 100, using: car)

let bike = Bicycle()
commute(distance: 50, using: bike)

getTravelEstimates(using: [car, bike], distance: 150)


// How to use opaque return types
func getRandomNumber() -> some Equatable {
    Int.random(in: 1...6)
}

func getRandomBool() -> some Equatable {
    Bool.random()
}

print(getRandomNumber() == getRandomNumber())


//How to create and use extensions
var quote = "   The truth is rarely pure and never simple   "
let trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines)

extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}

let trimmed2 = quote.trimmed()

let lyrics = """
But I keep cruising
Can't stop, won't stop moving
It's like I got this music in my mind
Saying it's gonna be alright
"""

print(lyrics.lines.count)

//How to create and use protocol extensions
extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

let guests = ["Mario", "Luigi", "Peach"]

if guests.isNotEmpty {
    print("Guest count: \(guests.count)")
}

protocol Person {
    var name: String { get }
    func sayHello()
}

extension Person {
    func sayHello() {
        print("Hi, I'm \(name)")
    }
}

struct Employee: Person {
    let name: String
}

let taylor = Employee(name: "Taylor Swift")
taylor.sayHello()


// Checkpoint 8
// Make a protocol that describres a building.
// Your protocol should require the following:
//  - A property storing how many rooms it has.
//  - A property storing the cost as an integer.
//  - A property storing the name of the estate agent selling the building.
//  - A method for printing the sales summary of the building.
// Create two structs, House and Office, that conform to it.

protocol Building {
    var rooms: Int { get }
    var cost: Int { get set }
    var estateAgent: String { get set }
    var salesSummary: [String] { get set }
    
    func printSalesSummary()
}

extension Building {
    func printSalesSummary() {
        if salesSummary.count == 0 {
            print("Single owner, no sales yet. Buy now with \(estateAgent)!")
        } else {
            print("Who bought before you:")
            for (index, sale) in salesSummary.enumerated() {
                let saleOrder = index + 1
                print("\(saleOrder): \(sale)")
            }
        }
    }
}

struct House: Building {
    let rooms: Int
    var cost: Int
    var estateAgent: String
    var salesSummary: [String]
    
    init(rooms: Int, cost: Int, estateAgent: String, salesSummary: [String]) {
        self.rooms = rooms
        self.cost = cost
        self.estateAgent = estateAgent
        self.salesSummary = salesSummary
    }
}

struct Office: Building {
    let rooms: Int
    var cost: Int
    var estateAgent: String
    var salesSummary: [String]
    
    init(rooms: Int, cost: Int, estateAgent: String, salesSummary: [String]) {
        self.rooms = rooms
        self.cost = cost
        self.estateAgent = estateAgent
        self.salesSummary = salesSummary
    }
}

let office = Office(rooms: 2, cost: 200_000, estateAgent: "Jhon  Kennedy", salesSummary: ["Jeff Bor", "Jennifer Lawl", "Taylor Smith"])

let house = House(rooms: 4, cost: 500_000, estateAgent: "Jack Riea", salesSummary: [])

office.printSalesSummary()
house.printSalesSummary()
