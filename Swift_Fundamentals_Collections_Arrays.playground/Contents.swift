import UIKit

//--------------//
// Collections //
//------------//

// Arrays: ordered collection of values

// Array<Element> and [Element] both functionally identical
var cities: Array<String> = []
var districts: [String] = ["District 10"]

print("there are \(cities.count) cities")
print("there are \(districts.count) districts")

cities.append("Berlin")
cities.append("London")
cities.append("Istanbul")

print("\(cities)")

//cities = []

print("--------------")

var streets = Array(repeating: "Main", count: 2)
print("there are \(streets.count) streets")
print("\(streets)")

print("--------------")

var result = cities + streets + districts

print(result)

// array literal
// array type is inferred to be [String]
var vegetables = ["Cucumber", "Tomatoes", "Cabbage"]

if vegetables.isEmpty {
    print("Vegetables array is empty")
}
print("vegetables = \(vegetables)")
vegetables.append("Celery")
vegetables += ["Carrots", "Potatoes"]

print("vegetables = \(vegetables)")

if let value = vegetables.first {
    print("firt vegetable = \(value)")
}

if let lastValue = vegetables.last {
    print("last vegetable = \(lastValue)")
}

print("last vegetable = \(vegetables[vegetables.count - 1])")

print("--------------")

vegetables[3] = "5 Cucumbers"
print("firt vegetable = \(vegetables[0])")
print("\(vegetables)")
vegetables[3...4] = ["Squash", "Pumpkin", "Spinach"]
print("vegetables = \(vegetables)")

print("--------------")

// insertion
vegetables.insert("Apple", at: 0)

print("\(vegetables)")
// removal
let removedElement = vegetables.remove(at: 0)
print("\(vegetables)")

// iteration
for (index, vegetable) in vegetables.enumerated() {
    print("index = \(index), vegetable = \(vegetable)")
}
