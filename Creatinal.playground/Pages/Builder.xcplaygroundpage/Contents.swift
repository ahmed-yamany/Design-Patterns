//: [Previous](@previous)

import Foundation

struct Product {
    let name: String
    let price: Double
    let quantity: Int
}

extension Product: CustomStringConvertible {
    public var description: String {
        "\(name) - \(String(price)) - \(String(quantity))"
    }
}

class ProductBuilder {
    enum ProductBuilderError: Error, LocalizedError {
        case name
        case quantity
        case price
        var errorDescription: String? {
            switch self {
                case .name: "invalid name"
                case .quantity: "invalid quantity"
                case .price: "invalid price"
            }
        }
    }
    
    public let name: String
    public let price: String
    public let quantity: String
    
    init(name: String, price: String, quantity: String) {
        self.name = name
        self.price = price
        self.quantity = quantity
    }
    
    func build() throws -> Product {
        let name = try buildName()
        let quantity = try buildQuantity()
        let price = try buildPrice()
    }
    
    private func buildName() throws -> String {
        guard !name.isEmpty else {
            throw ProductBuilderError.name
        }
        
        guard name.count > 3 else {
            throw ProductBuilderError.name
        }
        
        return name
    }
    
    private func buildQuantity() throws -> Int {
        guard let quantity = Int(quantity) else {
            throw ProductBuilderError.quantity
        }
        
        return quantity
    }
    
    private func buildPrice() throws -> Double {
        guard let price = Double(price) else {
            throw ProductBuilderError.price
        }
        
        return price
    }
}


do {
    let builder = ProductBuilder(name: "Shoes", price: "120.5", quantity: "1000")
    let product = try builder.build()
    print(product)
} catch {
    print(error.localizedDescription)
}
