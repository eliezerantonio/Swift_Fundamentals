import UIKit

//Optionals

var name : String?

//name = "Alice"

//conditionl Unwrapping

if let name = name{
    
    print("name\(name)")
}

//force unwrapping

func testGuardOptional()
{
    guard let value = name else {
        
        print("could not unwrap name var")
        return
    }
    
    print("unwrapped name =\(value)")
    
}

testGuardOptional()

//force unwrapping
//print(name!)


print("name length= \(name?.count)")

// coditional unwrapped
if let lengthOfName = name?.count{
    print("Lenght of name unwrapped = \(lengthOfName)")
}
    
let lethOfNameNilCoalesed = name?.count ?? 0
print("lethOfNameNilCoalesed = \(lethOfNameNilCoalesed)")
    
    
    
    

