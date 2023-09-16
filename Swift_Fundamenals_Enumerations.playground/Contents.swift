import UIKit

//----------------//
// Enumerations //
//--------------//
// A structure that groups related values together
// Type safe
// case can have Int, String, Double, Float type

enum Color {
    case red
    case green
    case blue
    case pink
}

var color = Color.green

switch color {
case .red:
    print("this is a red color")
case .green:
    print("this is a gren color")
default:
    print("any other color")
}

// iteration over enum cases
enum Meal: CaseIterable {
    case chicken
    case salad
    case desert
    case fish
    case rice
    case friendPotatoes
    
    func print() {
        ///
    }
}

var meal: Meal = .chicken

for m in Meal.allCases {
    print("m = \(m)")
}


// associated values
enum Trip {
    case Honolulu(Int)
    case NewYork(Int)
    case Tokyo(Int)
    case Sydney(Int, String)
    case Berlin
    case London
}

let aTrip = Trip.Sydney(7, "Ritz")

switch aTrip {
case .Honolulu(let duration):
    print("duration = \(duration)")
case .Sydney(let duration, let hotel):
    print("duration = \(duration), hotel = \(hotel)")
default:
    break
}

print("aTrip = \(aTrip)")

// raw values
// raw value can have Int, String, Float, Character
enum Symbol: Character {
    case a = "a"
    case b = "b"
    case q = "q"
}

let aSymbol = Symbol.q
print("aSymbol = \(aSymbol)")

if let newSymbol = Symbol(rawValue: "b") {
    print("newSymbol = \(newSymbol)")
}

// implicit raw values
enum Order: Int {
    case one = 5
    case two
    case three
    case four
}

let anOrder = Order.four
print("anOrder = \(anOrder.rawValue)")

enum Direction: String {
    case left
    case right
    case straight
    case down
}

//var direction = Direction.left
var direction = Direction(rawValue: "down")
print(direction?.rawValue ?? "")

// recursive enumeration
indirect enum ArithmeticCalculation {
    case number(Int)
    case add(ArithmeticCalculation, ArithmeticCalculation)
    case multiply(ArithmeticCalculation, ArithmeticCalculation)
}

let seven = ArithmeticCalculation.number(7)
let eight = ArithmeticCalculation.number(8)
let ten = ArithmeticCalculation.number(10)

// (10 + 7) * 8

let sum = ArithmeticCalculation.add(ten, seven)
let product = ArithmeticCalculation.multiply(sum, eight)

let result = calculate(expression: product)
print(result)

func calculate(expression: ArithmeticCalculation) -> Int {
    switch expression {
    case .number(let value):
        return value
    case .add(let left, let right):
        return calculate(expression: left) + calculate(expression: right)
    case .multiply(let left, let right):
        return calculate(expression: left) * calculate(expression: right)
    }
}


