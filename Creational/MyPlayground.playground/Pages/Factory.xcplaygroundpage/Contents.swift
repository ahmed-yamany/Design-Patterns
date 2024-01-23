import Foundation

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
