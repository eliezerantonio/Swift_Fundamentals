import UIKit

var greeting = "Hello, playground"

print(greeting)

var name = "Jason"
name = "Amy"

var weight = 100
var additionalWeight = 50
weight = weight / additionalWeight

var age: Int = 10
age = Int(5.3)

  //---------//
 // Strings //
//---------//

// multiline string
print("Multi line string")
var address = """
123 Main St
Apt. 483
Mainville, CA
"""
print(address)
print("-------------")

print("Unicode based characters")
/// special character string
let specialChars = "\u{29}\u{2680}"
print(specialChars)
print("-------------")

print("Multi line vs extended delimiters")
/// multie line vs extended delimiters
address = "124 Oak St.\nOakville, CA"
print(address)
address = #"124 Oak St.\nOakville, CA"#
print(address)
print("-------------")

/// Empty checks
let emptyName = String()
if emptyName.isEmpty {
    print("emptyName is empty")
}
print("-------------")

print("String concatenation")

/// String concatenation
var sentence = "We are learning "
sentence += "Swift programming language"
print(sentence)
print("-------------")

/// Iteration over characters in a string
print("iterate over sentence using for in loop")
for char in sentence {
    print(char)
}
print("-------------")

/// Single character
let singleCharacter: Character = "A"

/// Collection / array of characters
let arrayOfCharacters: [Character] = ["A", "n", "i", "m", "a", "l"]
var charactersStr = String(arrayOfCharacters)

/// Concatenate character to a string
let questionMark: Character = "?"
charactersStr.append(questionMark)

print("charactersStr = \(charactersStr)")

/// Interpolation of string
let animalCount = "no"
print("There are \(animalCount) animals in the park")
print("-------------")

/// Swift String & Characters are fully Unicode compliant
/// Extended grapheme cluster is a sequence of one or more Unicode scalars, e.g. \u{E9}
/// Character: a single extended grapheme cluster
let eAcute: Character = "\u{E9}"                         // é
let combinedEAcute: Character = "\u{65}\u{301}"          // e followed by
let precomposed: Character = "\u{D55C}"                  // 한
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"   // ᄒ, ᅡ, ᆫ

/// String Indices
var continent = "North America"
let startIndex = continent.startIndex

print("start index = \(startIndex)")
print(continent[startIndex])
print("-------------")

let endIndex = continent.endIndex
print("end index = \(endIndex)")
print("-------------")

// Runtime error
//print(continent[endIndex])

let beforeIndex = continent.index(before: endIndex)
print("beforeIndex = \(beforeIndex)")
print(continent[beforeIndex])
print("-------------")

let afterIndex = continent.index(after: startIndex)
print("afterIndex = \(afterIndex)")
print(continent[afterIndex])
print("-------------")

let offsetIndex = continent.index(startIndex,
                                  offsetBy: 3)
print("offsetIndex = \(offsetIndex)")
print(continent[offsetIndex])
print("-------------")

// Run-time error
// print(continent[endIndex])

print("iterate over continent using indices")
for index in continent.indices {
    print("\(continent[index])")
}
print("-------------")

print("insert character at the end of continent string")
continent.insert(":",
                 at: continent.endIndex)
print("\(continent)")
print("-------------")

print("remove character at the end of continent string")
continent.remove(at: continent.index(before: continent.endIndex))
print("\(continent)")
print("-------------")

print("string ranges")
let range = continent.index(continent.endIndex,
                            offsetBy: -4)..<continent.endIndex
continent.removeSubrange(range)
print("\(continent)")
print("-------------")

/// Substrings
/// Substrings and String both conform to StringProtocol
/// and share similar functions.
print("substring")
let index = continent.firstIndex(of: " ") ?? continent.endIndex
let continentSubstring = continent[..<index]
let newString = String(continentSubstring)
print("\(newString)")
print("-------------")

/// Comparison of Strings
///
/// String and Character comparison
print("string and character comparison")
let string1 = "North America"
let string2 = "North America"
/// String/characters are equal if their extended grapheme are canonically equivalent
/// Same linguistic meaning and appearance, even if underlying Unicode scalars are different.
if string1 == string2 {
    print("\(string1) and \(string2) are equal")
}

/// café (uses latin small letter e with acute)
let cafe1 = "caf\u{E9}"

// café (uses latin small letter e and combines acute accent)
let cafe2 = "caf\u{65}\u{301}"

if cafe1 == cafe2 {
    print("both \(cafe1) and \(cafe2) are equal")
}
print("-------------")

/// Prefix Equality
print("prefix and suffix comparison")
let countries = [
    "Ireland",
    "Italy",
    "France",
    "Germany",
    "Uruguay",
    "United States of America",
    "United Kingdom",
    "United Arab Emirates"
]

for country in countries {
    let prefix = "United"
    if country.hasPrefix(prefix) {
        print("\(country) has prefix \(prefix)")
    }
    let suffix = "America"
    if country.hasSuffix(suffix) {
        print("\(country) has suffix \(suffix)")
    }
}
print("-------------")

print("unicode representation")

for codeUnit in continent.utf16 {
    print("\(codeUnit)")
}
