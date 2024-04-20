//: [Previous](@previous)

import Foundation

protocol HardWorkerProtocol {
    func doSomeHardWork()
}

class HardWorker: HardWorkerProtocol {
    func doSomeHardWork() {
        print("I am doing some hard work")
    }
}

struct HardWorkerProxy: HardWorkerProtocol {
    let worker: HardWorkerProtocol
    
    func doSomeHardWork() {
        print("before doing hard work i have to had a cup of tea")
        worker.doSomeHardWork()
        print("after doing hard work i have to take a shawer")
    }
}

let worker: HardWorkerProtocol = HardWorker()
let proxy = HardWorkerProtocol = HardWorkerProxy(worker: worker)

proxy.doSomeHardWork()
