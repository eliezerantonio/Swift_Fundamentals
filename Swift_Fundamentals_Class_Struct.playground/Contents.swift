import UIKit

  //---------------------//
 //  Structs & Classes  //
//---------------------//

struct Student {
    let id: Int
    var name: String
    var address: String
    func update() {
        ///
    }
}

class University {
    let id: Int
    var name: String
    var students: [Student] = []
    
    init(id: Int,
         name: String,
         students: [Student]) {
        self.id = id
        self.name = name
        self.students = students
    }
}

var studentA = Student(id: 1,
                       name: "Alice",
                       address: "9001 Alaska St, Fresno, CA")

var universityA = University(id: 1,
                             name: "Concordia University",
                             students: [studentA])

print("student address = \(studentA.address)")
print("university name = \(universityA.name)")

studentA.update()

studentA.name = "Bob"
print("studentA name = \(studentA.name)")

// value type, i.e. passed by value
var studentACopy = studentA
studentACopy.address = "10001 Townsend, San Francisco, CA"

print("studentACopy address = \(studentACopy.address)")
print("studentA address = \(studentA.address)")

// pass by reference
var universityARef = universityA
universityARef.name = "CU"

print("universityARef name = \(universityARef.name)")
print("universityA name = \(universityARef.name)")

if universityA === universityARef {
    print("both universityA and universityARef refer to the same instance")
}
