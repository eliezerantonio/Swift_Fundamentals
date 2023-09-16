import UIKit

  //---------------------//
 //      Protocols      //
//---------------------//

protocol PersonProtocol {
    var name: String { get set }
    var description: String { get }
    func locate()
    mutating func update()
}

protocol StudentProtocol: PersonProtocol {
    var studentId: Int { get set }
}

protocol UniversityProtocol {
    var enrolledUniversities: [String] { get set }
}

// structs/classes can conform to multiple protocols
struct Student: StudentProtocol, UniversityProtocol {
    var name: String
    var studentId: Int
    
    var description: String {
        return "student with \(studentId)"
    }
    
    var enrolledUniversities: [String]
    
    func locate() {
        //
    }
    
    mutating func update() {
        
    }
}

let student = Student(name: "Alice",
                      studentId: 1,
                      enrolledUniversities: ["Columbia", "Concordia", "University of Oxford", "UCL"])

print("student = \(student)")

struct UnderGraduateStudent: PersonProtocol, StudentProtocol {
    var name: String
    var description: String
    var studentId: Int
    
    func locate() {
        //
    }
    
    mutating func update() {
        //
    }
}

// classes can inherit from another class and conform to other protocols
protocol CarProtocol {
    
}

class Vehicle {
    
}

class Car: Vehicle, CarProtocol {
    
}

// enums can also implement protocols
protocol StudentEnumProtocol {
    // mutating means function updates state of the instance.
    // classes don't need to have mutating when conforming
    // to the protocol
    mutating func update()
}

enum StudentEnum: StudentEnumProtocol {
    case underGraduate
    case graduate
    
    mutating func update() {
        self = .underGraduate
    }
}

class StudentEnumClass: StudentEnumProtocol {
    func update() {
        ///
    }
}

// protocol: initializers example
protocol PlaneProtocol {
    var capacity: Int { get set }
    var description: String { get }
    init(capacity: Int)
    // ? marks failable initializers
    // (i.e. initialization may fail)
    init?(capacity: Int,
          mileage: Int)
}

class PassengerPlane: PlaneProtocol {
    var capacity: Int
    var mileage: Int?
    var description: String {
        return "Passenger plane with \(capacity) passengers and \(mileage ?? 0) mileage"
    }
    required init(capacity: Int) {
        self.capacity = capacity
    }
    
    required init?(capacity: Int,
                   mileage: Int) {
        if mileage < 0 {
            return nil
        }
        self.mileage = mileage
        self.capacity = capacity
    }
}

// Protocol as a type
struct Airport {
    var planes: [PlaneProtocol] = []
    weak var airportDelegate: AirportDelegate?
    
    mutating func planeArrived(_ plane: PlaneProtocol) {
        planes.append(plane)
        print("\(plane) arrived to the airport")
        airportDelegate?.register(plane)
    }
}

let plane: PlaneProtocol = PassengerPlane(capacity: 100)

var airport = Airport()
let airportController = AirportController()
airport.airportDelegate = airportController
airport.planeArrived(plane)
print("airport = \(airport)")

// Delegate protocol
// Class-only protocol: only classes can conform to it
// (i.e. protocol inherits from AnyObject)
protocol AirportDelegate: AnyObject {
    func register(_ plane: PlaneProtocol)
}

class AirportController: AirportDelegate {
    func register(_ plane: PlaneProtocol) {
        /// handle arriving planes
        print("plane \(plane) has arrived")
    }
}

// Extension: conformance to protocol
protocol Flyable {
    func fly(to: String, from: String)
}

extension PassengerPlane: Flyable {
    func fly(to: String, from: String) {
        print("plane is flying from \(from) to \(to)")
    }
}

// Conditionally conforming to protocol
extension Array: Flyable where Element: Flyable {
    func fly(to: String, from: String) {
        for object in self {
            object.fly(to: to, from: from)
        }
    }
}

var arrayOfFlyablePlanes: [PassengerPlane] = []
let passengerPlane = PassengerPlane(capacity: 100)
arrayOfFlyablePlanes.append(passengerPlane)
arrayOfFlyablePlanes.fly(to: "SFO", from: "LAX")

// Declare protocol adoption with an extension
struct MilitaryPlane {
    func fly(to: String, from: String) {
        print("military plane is flying from \(from) to \(to)")
    }
}

// The type already conforms to protocol requirements,
// hence just declaring the protocol adoption here.
extension MilitaryPlane: Flyable { }

// Synthesized Implementation
// e.g. Equatable, Hashable, Comparable
// Equatable/Hashable (synthesized impl): structures with stored
// properties conforming to Equatable
struct Ball: Equatable, Hashable {
    var radius: Int
    var color: UIColor
}

let bigGreenBall = Ball(radius: 10, color: UIColor.green)
let smallRedBall = Ball(radius: 11, color: UIColor.red)
let anotherBigGreenBall = Ball(radius: 10, color: UIColor.green)

if bigGreenBall == smallRedBall {
    print("big green and small red balls are the same")
}
if bigGreenBall == anotherBigGreenBall {
    print("big green and other big green balls are the same")
}


// Equatable/Hashable (synthesized impl): enums with or without
//  associated types
// Comparable: enumerations without raw values
//  get synthesized implementation
enum BallType: Equatable, Hashable, Comparable  {
    case kids
    case soccer
    case football
    case basketball
}

let kidsBall: BallType = .kids
let soccerBall: BallType = .soccer
print(kidsBall < soccerBall)
print(kidsBall == soccerBall)

// Protocol Types stored in Collections
var planes: [PlaneProtocol] = []
if let passengerPlanA = PassengerPlane(capacity: 300,
                                       mileage: 10000) {
    planes.append(passengerPlanA)
}

class CargoPlane: PlaneProtocol {
    var capacity: Int
    var mileage: Int?
    var description: String {
        return "Cargo plane with \(capacity) passengers and \(mileage ?? 0) mileage"
    }
    
    required init(capacity: Int) {
        self.capacity = capacity
    }
    
    // ? marks failable initializers
    // (i.e. initialization may fail)
    required init?(capacity: Int,
                   mileage: Int) {
        if capacity < 0 {
            return nil
        }
        self.mileage = mileage
        self.capacity = capacity
    }
}

if let cargoPlaneA = CargoPlane(capacity: 10,
                                mileage: 20000) {
    planes.append(cargoPlaneA)
}

for plane in planes {
    print("iterating over planes \(plane.description)")
}

// Protocol Inheritance
protocol Landable: Flyable {
    func land(at airport: Airport)
}

extension CargoPlane: Landable {
    func land(at airport: Airport) {
        print("landing at the airport \(airport)")
    }
    func fly(to: String, from: String) {
        print("cargo plane is flying from \(from) to \(to)")
    }
}

extension PassengerPlane: Landable {
    func land(at airport: Airport) {
        print("landing at the airport \(airport)")
    }
}

// Protocol Composition
// List several protocols and a super class using & operator
func process(_ plane: A & B) {
    print("\(plane) is being processed at the airport")
}

protocol A {
    
}

protocol B {
    
}

class C: A, B {
    
}

let c = C()

process(c)

// Protocol Conformance Check
// - is checks whether a type conforms to a certain protocol
// - as?: downcast operator, it will return an optional of
//   protocol type if the object conforms to the protocol.
//   it will return nil if it doesn't.
// - as!: downcast operator, similar to as? but forces downcast and
//   if it fails, then a run-time error will happen
if airport is PlaneProtocol {
    print("passenger plane conforms to PlaneProtocol")
}
if passengerPlane is Flyable {
    print("passenger plane conforms to Flyable")
}

if let testPlane = passengerPlane as? PlaneProtocol {
    print("testPlane capacity = \(testPlane.capacity)")
}

var forcedCastingPlane = airport as? PlaneProtocol
print("forcedCastingPlane = \(forcedCastingPlane)")

// Optional Protocol Requirements
// @objc is required and optional can be added.
// @objc protocol: can be implemented by classes inheriting
// from Obj-C or @objc classes.
// called with ? after func name
@objc protocol Countable {
    @objc optional func count() -> Int
}

extension PassengerPlane: Countable {
    func count() -> Int {
        return 1
    }
}

print("passenger plane count = \(passengerPlane.count())")

// Protocol Extensions
// - can provide additional implementation of method, initializer,
// subscript, computed property for conforming types.
// - can provide default implementation.
protocol Trackable {
    func track(plane: PlaneProtocol)
}

extension Trackable {
    func track(plane: PlaneProtocol) {
        print("plane \(plane) is being tracked")
    }
    func notify(plane: PlaneProtocol) {
        print("contacting plane \(plane)")
    }
}

