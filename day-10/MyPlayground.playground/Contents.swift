import Cocoa

// How to create your own structs
struct Employee {
    // Properties, can have default value
    var name: String = "Anonymous"
    var vacationRemaining: Int
    
    // Methods
    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vation!")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops! There aren't enough days remaining.")
        }
    }
}

// Archer is an instance and the rest is a initializer
var archer = Employee.init(name: "Sterling Archer", vacationRemaining: 14)
archer.takeVacation(days: 5)
print(archer.vacationRemaining)


// How to compute property values dynamically
struct EmployeeNew {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0
    
    var vacationRemaining: Int {
        get {
            vacationAllocated - vacationTaken
        }
        set {
            vacationAllocated = vacationTaken + newValue
        }
    }
}

var archerNew = EmployeeNew(name: "Sterling Archer")
archerNew.vacationTaken += 4
archerNew.vacationRemaining = 5
print(archerNew.vacationAllocated)

// How to take action when a property changes
struct Game {
    var score = 0 {
        didSet {
        
            print("Score is now \(score)")
        }
    }
}

var game = Game()
game.score += 10
game.score += 3
game.score += 1


// How to create custom initializers
struct Player {
    let name: String
    let number: Int
    
    init(name: String) {
        self.name = name
        number = Int.random(in: 1...99)
    }
    
    init(name: String, number: Int) {
        self.name = name
        self.number = number
    }
}

let player = Player(name: "Megan R")
print(player.number)
 
let player2 = Player(name: "Jhon", number: 33)
