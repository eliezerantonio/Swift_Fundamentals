import UIKit

//----------------//
// Closures      //
//--------------//

// Closure: self-contained block of functionality
// - passed around and used in code
// - captures and stores constants/variables from the context

// Global functions: closures with a name, but without capturing any values
func globalFunction(parameterA: String, parameterB: Int) -> Int {
    return 1
}

// Nested functions: closures with a name, capturing values from enclosed function
func enclosingFunction(parameterC: Int) -> String {
    func nestedFunction(parameterD: Bool) -> Int {
        return 2
    }
    
    return ""
}

// Closure expressions: unnamed closures written with lightweight syntax, capture
// values from surrounding context
var studentNames = ["Alice", "Bob", "Jane", "Tom", "Angela"]

func sortReverse(name1: String, name2: String) -> Bool {
    return name1 > name2
}

print(studentNames.sorted(by: sortReverse))

studentNames.sorted { (s1: String, s2: String) -> Bool in
    return s1 > s2
}

studentNames.sorted { s1, s2 in
    return s1 > s2
}

// single expression closure
// return omitted
studentNames.sorted { s1, s2 in s1 > s2 }


// short-hand argument
print(studentNames.sorted { $0 > $1 })

// operator method
print(studentNames.sorted(by: >))




// Trailing Closure //

studentNames.sorted { s1, s2 in s1 > s2 }

func aFuncWithClosure(closure: () -> Void) {
    
}

aFuncWithClosure(closure: {
    /// without using trailing closure
    
})

aFuncWithClosure {
    /// using trailing closure
}

// multiple closures
func loadPicture(completion: (UIImage) -> Void, onError: (Error) -> Void) {
    ///
    completion(UIImage())
//    let error = NSError(domain: "Network Error",
//                        code: 500)
//    onError(error)
}

/// First closure's argument label can be omitted
/// Captures value of totalImages and modifies
var totalImages = 0
loadPicture { image in
    //
    totalImages += 1
    print("received \(totalImages) image(s)")
} onError: { error in
    //
    print("error received \(error)")
}

/// Functions / closures are reference types
var completionClosure = { (image: UIImage) -> Void in
    /// do some processing with image
    print("received image successfully \(image.description)")
}

var errorClosure = { (error: Error) -> Void in
    /// do some error handling
    print("encountered errror \(error)")
}

loadPicture(completion: completionClosure,
            onError: errorClosure)

// Escaping Closures //
// closure is executed later, after function returns
// e.g. there maybe an asynchonous API call that comes back later and
// closure is executed at that time.
func loadStudents(studentId: Int, completion: @escaping ([String]) -> ()) {
    DispatchQueue.global().async {
        /// perform some data operation (e.g. network call, etc.)
        completion(["Jane", "Bob", "Alice", "Arthur"])
    }
}


// Auto Closure //
// Closure that
// - automatically wraps an expression
// - does not take parameters
// - returns a value of the expression
// - braces can be omitted

var students = [ "Alice", "Jennifer", "Alex", "Cooper"]

func conductAppointmentForStudent(processor: @autoclosure () -> (String) ) {
    let student = processor()
    print("appointment with \(student) starting")
}

conductAppointmentForStudent(processor: students.removeFirst())
conductAppointmentForStudent(processor: students.removeFirst())
