import Cocoa

// How to create your own classes
class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10

// How to make one class inherit from another
class Employee {
    let hours: Int
    
    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("I work \(hours) fours a day.")
    }
}

class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
    
    override func printSummary() {
        print("I'm a developer who will sometimes work \(hours) hours a day...")
    }
}

final class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
}

let robert = Developer(hours: 8)
let ted = Manager(hours: 10)

robert.work()
ted.work()

// How add initializer for classes
class Vehicle {
    let isEletric: Bool
    
    init(isEletric: Bool) {
        self.isEletric = isEletric
    }
}

class Car: Vehicle {
    let isConvertible: Bool
    
    init(isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isEletric: true)
    }
}

// How to copy classes
class User {
    var username = "Anonymous"
    
    // to the class have it copy without change the original
    func copy() -> User {
        let user = User()
        user.username = username
        return user
    }
}

var user1 = User()
var user2 = user1.copy()
var user3 = user1
user2.username = "Taylor"
user3.username = "Swift"

print(user1.username)
print(user2.username)
print(user3.username)

// How to create a deinitializer for a class

class User2 {
    let id: Int
    
    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive!")
    }
    
    deinit {
        print("User \(id): I'm dead!")
    }
}

var users = [User2]()

for i in 1...3 {
    let userNew = User2(id: i)
    print("User \(userNew.id): I'm in control!")
    users.append(userNew)
}

print("Loop is finished!")
users.removeAll()
print("Array is clear!")

// How to work with variables inside classes
class Person {
    var name = "Paul"
}

var person = Person()
person.name = "Taylor"
person = Person()
print(person.name)


//Checkpoint 7
// Make a class hierarchy for animals
// Start with Animal. Add a legs property for the number of legs an animal has
// Make Dog a subclass of Animal, giving it a speak() method that prints a dog barking string, but each subclass should print something different.
// Make Corgi and Poodle subclasses of Dog.
// Make Cat an Animal subclass. Add a speak() method, with each subclass printing something different, and an isTame Boolean, set with initializer.
// Make Persian and Lion as subclasses of Cat

class Animal {
    let legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
}

class Dog: Animal {
    init() {
        super.init(legs: 4)
    }
    
    func speak() {
        print("Woof woof!")
    }
}

final class Corgi: Dog {
    override func speak() {
        print("Corgi wiif wiif!")
    }
}

final class Poodle: Dog {
    override func speak() {
        print("Poodle weef weef!")
    }
}

class Cat: Animal {
    init() {
        super.init(legs: 4)
    }
    
    func speak() {
        print("Meaow!")
    }
}

final class Persian: Cat {
    var isTame: Bool
    
    init(isTame: Bool) {
        self.isTame = isTame
    }
    
    override func speak() {
        if isTame {
            print("Persian miaow!")
        } else {
            print("Persian grrrrr!")
        }
        
    }
}

final class Lion: Cat {
    var isTame: Bool
    
    init(isTame: Bool) {
        self.isTame = isTame
    }
    
    override func speak() {
        if isTame {
            print("Lion gruar!")
        } else {
            print("Lion grrrr!")
        }
    }
}

let lion = Lion(isTame: false)
let persian = Persian(isTame: true)
let poodle = Poodle()
let corgi = Corgi()

lion.speak()
persian.speak()
poodle.speak()
corgi.speak()
