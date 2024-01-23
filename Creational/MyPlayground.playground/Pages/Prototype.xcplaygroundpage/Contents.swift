//: [Previous](@previous)

import UIKit

/*
 used for creating objects by copying  an existing object
 - create a new object by copying current state of an existing object
 - useful when the cost of creating a new object is more expensive or complex compared to copying an existing one
 */

class Car {
    let type: String
    var speed: Int = 1
    var color: UIColor = .blue
    
    init(type: String) {
        self.type = type
    }
    
    init(type: String, speed: Int, color: UIColor) {
        self.type = type
        self.speed = speed
        self.color = color
    }
    
    func increaseSpeed() {
        speed += 1
    }
    
    func changeColor() {
        color = [UIColor.red, .yellow, .green, .black].randomElement() ?? .green
    }
    
    func prototype() -> Car {
        Car(type: type, speed: speed, color: color)
    }
}

let bmwCar = Car(type: "BMW")
bmwCar.increaseSpeed()
bmwCar.increaseSpeed()
bmwCar.increaseSpeed()
bmwCar.changeColor()
print(bmwCar.speed)
print(bmwCar.color)

let copyCar = bmwCar.prototype()

bmwCar.increaseSpeed()
bmwCar.increaseSpeed()
print(bmwCar.speed)

print(copyCar.speed)
