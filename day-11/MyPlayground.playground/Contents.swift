import Cocoa

// How to limit access toi internal data using access control

struct BankAccount {
    private(set) var funds = 0
    
    mutating func deposit(amount: Int) {
        funds += amount
    }
    
    mutating func withdraw(amount: Int) -> Bool {
        if funds > amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

var account = BankAccount()
account.deposit(amount: 100)

let success = account.withdraw(amount: 200)

if success {
    print("Withdrew money sucessfully.")
} else {
    print("Failed to get the money.")
}

// Static properties and methods
struct School {
    static var studentCount = 0
    
    static func add(student: String) {
        print("\(student) joined the school.")
        studentCount += 1
    }
}

School.add(student: "Taylos Swift")
print(School.studentCount)

struct AppData {
    static let version = "1.3 bet 2"
    static let saveFilename = "settings.json"
    static let homeURL = "https://www.hackingwithswift.com"
}

struct Employee {
    let username: String
    let password: String
    
    static let example = Employee(username: "cfederighi", password: "h4irf0rce0ne")
}

Employee.example.password

// Checkpoint 6
// Create a struct to store information about a car. Iclude:
    // - Its model
    // - Number of seats
    // - Current gear
// Add a method to change gears up or down.
// Have a think about variables and access control.
// Don't allow invalid gears - 1...10 seems a fair maximum range.

struct Car {
    let model: String
    let numberOfSeats: Int
    private(set) var currentGear = 1
    
    init(model: String, numberOfSeats: Int) {
        self.model = model
        self.numberOfSeats = numberOfSeats
    }
    
    static let exampleCar = Car(model: "Jeep", numberOfSeats: 5)
    
    mutating func currentGearUp() {
        if currentGear == 10 {
            print("Prrr that is the maximum limit, slow down.")
        } else {
            currentGear += 1
            print("You are now at gear \(currentGear)")
        }
    }
    
    mutating func currentGearDown() {
        if currentGear == 1 {
            print("Prr if you want to stop just break.")
        } else {
            currentGear -= 1
            print("You are now at gear \(currentGear)")
        }
    }
}

var car = Car(model: "Toyota", numberOfSeats: 2)

car.currentGearDown()
car.currentGearUp()
car.currentGearUp()
print(car.currentGear)
print("This is an example car struct \(Car.exampleCar)")
