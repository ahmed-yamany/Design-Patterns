
import Foundation

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

