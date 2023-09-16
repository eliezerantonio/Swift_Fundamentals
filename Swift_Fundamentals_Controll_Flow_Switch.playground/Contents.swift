import UIKit

//----------------//
// Control Flows //
//--------------//
// Control Flows: Switch

var temperatureInC = -10

while (temperatureInC < 40) {
    if temperatureInC < 0 {
        print("It's really cold today! \(temperatureInC) C")
    } else if temperatureInC > 0 && temperatureInC < 20 {
        print("It's litte warmer today  \(temperatureInC) C")
    } else {
        print("It's very warm  \(temperatureInC) C")

        
    }
    temperatureInC += 3
}

// switch statements: interval matching
while (temperatureInC < 40) {
    switch temperatureInC {
    case ..<0:
        print("It's really cold today! \(temperatureInC) C")
    case 0..<20:
        print("It's litte warmer today  \(temperatureInC) C")
    default:
        print("It's very warm  \(temperatureInC) C")
    }
    temperatureInC += 3
}

// switch statement simple cases
var character: Character = "a"

switch character {
case "a":
    print("character is latin alphabet character \(character)")
case "B":
    print("character is upper case latin letter \(character)")
default:
    print("any other character")
}

// switch statement tuples
// tuple: (Int, Int)
let coordinate = (-2, 0)

switch coordinate {
case (0, 0):
    print("the coordinate origin point")
case (_, 0):
    print("the coordinate is on x axis")
case (0, _):
    print("the coordinate is on y axis")
default:
    print("any other coordinate")
}

// value binding
switch coordinate {
case (0, 0):
    print("the coordinate origin point")
case (let x, 0):
    print("the coordinate is on x axis with coordinate: \(x)")
case (0, let y):
    print("the coordinate is on y axis: \(y)")
default:
    print("any other coordinate")
}

// where clause
switch coordinate {
case (let x, let y) where x > y:
    print("x > y")
case (let x, let y) where x < y:
    print("x < y")
default:
    print("any other coordinate")
}

// compound cases

switch character {
case "a", "A", "c", "C":
    break
case "B", "b":
    print("letter B")
default:
    print("any other character")
}

// fallthrough
switch character {
case "a", "A", "c", "C":
    print("character matched")
    fallthrough
case "B", "b":
    print("letter \(character)")
default:
    print("any other character")
}
