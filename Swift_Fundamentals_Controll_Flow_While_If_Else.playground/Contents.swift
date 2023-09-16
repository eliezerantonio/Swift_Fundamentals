import UIKit


//Controll Flow


//Control Flow If Else


var temperatureInC = -10

while (temperatureInC < 40){
    if temperatureInC < 0{
        print("It's really cold today \(temperatureInC) c")
        
    } else if(temperatureInC > 0 && temperatureInC < 20){
        print(" It's litte warmer today \(temperatureInC) c")

    }else{
        print("It's very warm \(temperatureInC) c")
        
        break
    }
    temperatureInC += 3
}
