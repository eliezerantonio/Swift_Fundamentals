import UIKit

//Controll flow


let colors = ["Orange", "Teal", "Green", "Red"]

for color in colors{
    print("Color = \(color)")
}


for index in 1...10{
    print(index);
}


for index in 1..<10{
    print(index);
}

let airportCodes = ["YUL": "Montreal", "SFO" : "San Francisco", "JFK": "New York JFK"]

for (airportCode, airportName) in airportCodes{
    
    print("\(airportCode) \(airportName)")
    
}


for _ in 1...5{
    
    print("hello")
}


for i in stride(from: 0, to: 100, by:  10)
{
    
    print("i \(i)")
}
