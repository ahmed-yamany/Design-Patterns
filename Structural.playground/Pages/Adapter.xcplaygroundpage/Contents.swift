import Foundation

protocol MessageSender {
    func send(message: String)
}

class SlackMessenger: MessageSender {
    func send(message: String) {
        print("Send Message: \(message) to Slack")
    }
}

class JabberMessenger: MessageSender {
    func send(message: String) {
        print("Send Message: \(message) to Jabber")
    }
}

class HipChatMessenger {
    func send(message: String, identifier: String) {
        print("Send Message: \(message) to HipChat with identifier \(identifier)")
    }
}

class HipChantMessengerAdapter: MessageSender {
    let messenger = HipChatMessenger()
    
    func send(message: String) {
        messenger.send(message: message, identifier: UUID().uuidString)
    }
}

class Messenger {
    private let messengers: [MessageSender] = [SlackMessenger(), JabberMessenger(), HipChantMessengerAdapter()]
    
    func send(message: String) {
        messengers.forEach { messenger in
            messenger.send(message: message)
        }
    }
}

let m = Messenger()
m.send(message: "Hello")
