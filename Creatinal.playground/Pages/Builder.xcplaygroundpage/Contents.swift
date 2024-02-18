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
        case quantity(String)
        case price(String)
        var errorDescription: String? {
            switch self {
                case .quantity(let message): message
                case .price(let message): message
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
            throw ContextManagerError<Product>.name(L10n.AddProduct.Error.Name.empty)
        }
        
        guard name.count > 3 else {
            throw ContextManagerError<Product>.name(L10n.AddProduct.Error.Name.count)
        }
        
        return name
    }
    
    private func buildQuantity() throws -> Int {
        guard let quantity = Int32(quantity) else {
            throw ProductBuilderError.quantity(L10n.AddProduct.Error.Quantity.cast)
        }
        
        return quantity
    }
    
    private func buildPrice() throws -> Double {
        guard let price = Double(price) else {
            throw ProductBuilderError.price(L10n.AddProduct.Error.Price.cast)
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
