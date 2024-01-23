import Foundation
/*
 The Factory Design Pattern is a creational design pattern that provides an interface for creating objects in a superclass but allows subclasses to alter the type of objects that will be created.
 It falls under the category of design patterns that deal with object creation mechanisms, ensuring that a class is responsible for creating objects of another class.

 The main goal of the Factory Design Pattern is to define an interface for creating an object, but defer the instantiation of the object to the subclasses, allowing a class to delegate the responsibility of instantiating its objects to its subclasses.
 
 */

/*
 KeyNote:
    - provides an interface for creating objects
    - a class responsible for creating objects of another class
 */
protocol Shape {
    func draw() -> String
}

class Rectangle: Shape {
    func draw() -> String {
        return "Drawing a Rectangle"
    }
}

class Circle: Shape {
    func draw() -> String {
        return "Drawing a Circle"
    }
}

class ShapeFactory {
    func create(for shapeType: String) -> Shape? {
        switch shapeType.lowercased() {
            case "rectangle": return Rectangle()
            case "circle": return Circle()
            default: return nil
        }
    }
}

let factory = ShapeFactory()
let shape1: Shape? = factory.create(for: "circle")
shape1?.draw()

let shape2: Shape? = factory.create(for: "rectangle")
shape2?.draw()
