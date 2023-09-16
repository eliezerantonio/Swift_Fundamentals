import UIKit

//--------------//
// Collections //
//------------//

// Sets: unordered collection of unique values/objects
var sports = Set<String>()
print("sports set = \(sports)")

// adding
sports.insert("Soccer")
sports.insert("Basketball")
sports.insert("Baseball")
print("sports = \(sports)")

if sports.contains("Soccer") {
    print("Sports contains Soccer")
}

// removing
sports.remove("Soccer")

print("sports = \(sports.count)")

sports = ["Football", "Hockey", "Lacrosse"]
print("sports = \(sports.count)")

// empty check
if sports.isEmpty {
    print("sports set is empty")
}

// iteration
// sorted vs. unsorted
print("unsorted set elements")
for sport in sports {
    print("sport = \(sport)")
}

print("sorted set elements")
for sport in sports.sorted() {
    print("sport = \(sport)")
}


// operations
// - union
// - intersection
// - subtracting
// - symmetricDifference
let oddNumbers: Set<Int> = [1, 3, 5, 7, 9]
let evenNumbers: Set<Int> = [2, 4, 6, 8]
let primeNumbers: Set<Int> = [1, 3, 5, 7]

let unionSet = oddNumbers.union(evenNumbers)
print("union set = \(unionSet)")

let intersection = oddNumbers.intersection(evenNumbers)
print("intersection set = \(intersection)")

let subtraction = oddNumbers.subtracting(primeNumbers)
print("subtraction set = \(subtraction)")

let symmetricDifferences = primeNumbers.symmetricDifference(oddNumbers)
print("symmetricDifferences set = \(symmetricDifferences)")

// set membership and equality
// - subset
// - superset
// - equality
// - strict subset
// - strict superset
let isSubSet = primeNumbers.isSubset(of: oddNumbers)
print("isSubSet = \(isSubSet)")

let isSuperSet = primeNumbers.isSuperset(of: evenNumbers)
print("isSuperSet = \(isSuperSet)")

let isDisjoint = primeNumbers.isDisjoint(with: evenNumbers)
print("isDisjoint = \(isDisjoint)")

let set1: Set<Int> = [1, 2, 3]
let set2: Set<Int> = [1, 2, 3]

if set1 == set2 {
    print("two sets are equal")
}

let isStrictSuperset = oddNumbers.isStrictSuperset(of: primeNumbers)
print("isStrictSuperset = \(isStrictSuperset)")

let isStrictSubset = set1.isStrictSubset(of: set2)
print("isStrictSubset = \(isStrictSubset)")
