import Foundation

/*
 The Abstract Factory Design Pattern is a creational design pattern that provides an interface for creating families of related or dependent objects without specifying their concrete classes. It is an extension of the Factory Method Pattern and is often used when there is a need to ensure that the created objects are compatible with each other and belong to the same family of products.
 */

protocol Button {
    func action() -> String
}

class Light: Button {
    func action() -> String {
        return "Light Button Action"
    }
}

class Dark: Button {
    func action() -> String {
        return "Dark Button Action"
    }
}

protocol ButtonFactory {
    func createButton() -> Button
}

class LightButtonFactory: ButtonFactory {
    func createButton() -> Button {
        Light()
    }
}

class DarkButtonFactory: ButtonFactory {
    func createButton() -> Button {
        Dark()
    }
}

enum ButtonTypes {
    case light, dark
}

class AbstractFactory {
    
    func createButton(of type: ButtonTypes) -> Button {
        switch type {
            case .light:
                return LightButtonFactory().createButton()
            case .dark:
                return DarkButtonFactory().createButton()
        }
    }
}

let abstractFactory = AbstractFactory()

let button1: Button = abstractFactory.createButton(of: .light)
button1.action()

let button2: Button = abstractFactory.createButton(of: .dark)
button2.action()

