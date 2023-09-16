import UIKit

  //---------------------//
 //     Inheritance     //
//---------------------//

class Person {
    var name: String = ""
    var description: String {
        return "the person \(name)"
    }
    init(name: String) {
        self.name = name
    }
    func someFunction() {
        
    }
}

class Student: Person {
    var studentId: Int {
        willSet {
            print("student id will be set newValue = \(newValue)")
        }
        didSet {
            print("student id was set oldValue = \(oldValue) newValue = \(studentId)")
        }
    }
    
    override var description: String {
        return "the student \(name) with id \(studentId)"
    }
    
    init(studentId: Int,
         name: String) {
        self.studentId = studentId
        super.init(name: name)
    }
    
    override func someFunction() {
        super.someFunction()
    }
    
    func startStudying() {
        ///...
    }
}

class Teacher: Person {
    var employeeId: Int
    
    override var description: String {
        return "the teacher \(name) with id \(employeeId)"
    }
    
    init(employeeId: Int,
         name: String) {
        self.employeeId = employeeId
        super.init(name: name)
    }
    
    func startTeaching() {
        /// ....
    }
}

class UndergraduateStudent: Student {
    
}

class AssociatedProfessor: Teacher {
    ///
}

var student = Student(studentId: 1, name: "Alice")
student.studentId = 3
var teacher = Teacher(employeeId: 2, name: "Professor Jason")
var genericStudent: Person = Student(studentId: 3, name: "Bob")
var person = Person(name: "Henry")

func handlePerson(person: Person) {
    print(person.description)
}

handlePerson(person: person)
handlePerson(person: genericStudent)
handlePerson(person: teacher)
handlePerson(person: student)
