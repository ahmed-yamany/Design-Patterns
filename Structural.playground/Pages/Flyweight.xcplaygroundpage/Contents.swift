import Foundation

protocol Executor: AnyObject {
    func execute()
}

class Service: Executor {
    let type: String
    
    init(type: String) {
        self.type = type
    }
    
    func execute() {
        
    }
}

class ExecutorFactory {
    private var services: [String: Executor] = [:]
    
    func getExecutor(key: String) -> Executor {
        if let service = services[key] {
            return service
        } else {
            let service = Service(type: key)
            services[key] = service
            return service
        }
    }
}

let factory = ExecutorFactory()

var service = factory.getExecutor(key: "order")
var service2 = factory.getExecutor(key: "order")
var service3 = factory.getExecutor(key: "billing")

service === service2
service === service3
