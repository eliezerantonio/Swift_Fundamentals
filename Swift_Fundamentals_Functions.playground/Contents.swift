import UIKit

//----------------//
// Control Flows //
//--------------//
// Functions


// functions, parameters, return type
func addNumbers(number1: Int, number2: Int) -> Int {
    let result = number1 + number2
    return result
}

let sum = addNumbers(number1: 7, number2: 10)
print("sum = \(sum)")

// multiple return values (e.g. tuples)
// (Int, Int), (Int, String), (Student, String)
func findMinMax(listOfIntegers: [Int]) -> (minValue: Int, maxValue: Int) {
    var minValue = listOfIntegers[0]
    var maxVaue = listOfIntegers[0]
    for number in listOfIntegers {
        if number > maxVaue {
            maxVaue = number
        }
        if number < minValue {
            minValue = number
        }
    }
    return (minValue, maxVaue)
}

let minMaxResult = findMinMax(listOfIntegers: [0, 1, 2, 3])
print("min = \(minMaxResult.minValue)")
print("max = \(minMaxResult.maxValue)")

// implicit return
func multiplyNumbers(number1: Int, number2: Int) -> Int {
    number1 * number2
}

print(multiplyNumbers(number1: 5, number2: 20))

// argument labels and parameter names
func greetPerson(with name: String) {
    print("hi \(name)")
}

greetPerson(with: "Alice")

// default parameter values
func calculateResult(number1: Int,
                     number2: Int = 50) -> Int {
    number1 + number2
}

print(calculateResult(number1: 20, number2: 100))
print(calculateResult(number1: 20))

// variadic parameters
func calculateAverage(withInput numbers: Double...) -> Double {
    
    var averageResult = 0
    var sum: Double = 0
    var totalCount = 0
    for number in numbers {
        sum += number
        totalCount += 1
    }
    
    return Double(sum / Double(totalCount))
}

let averageResult = calculateAverage(withInput: 1, 2, 3, 4, 5, 6)
print("averageResult = \(averageResult)")

// in-out parameters
func greeting(person: inout String) {
    person = "Bob"
}

var name = "Alice"
print(name)
greeting(person: &name)
print(name)

// function types
// - using as variable
// - parameter types
// - return type

// (Int, Int) -> Int
// () -> Void

func subtractTwoNumbers(number1: Int, number2: Int) -> Int {
    return number1 - number2
}

var subtractFunc: (Int, Int) -> Int = subtractTwoNumbers

let subtractResult = subtractFunc(10, 4)
print("subtractResult = \(subtractResult)")

func showResult(function: (Int, Int) -> Int, number1: Int, number2: Int) {
    let result = function(number1, number2)
    print("result of function = \(result)")
}

showResult(function: subtractFunc,
           number1: 20,
           number2: 35)

func determineMathFunc() -> (Int, Int) -> Int {
    return subtractFunc
}

let funcToUse = determineMathFunc()
print(funcToUse(50, 34))

// nested functions
func highLevelFunction(number1: Int, number2: Int) -> Int {
    func addSum(input1: Int, input2: Int) -> Int {
        return input1 + input2
    }
    return addSum(input1: number1, input2: number2)
}
 
