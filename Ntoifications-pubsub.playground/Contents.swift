import Foundation
import PlaygroundSupport


extension Notification.Name {
    static let HWSSettingsDidChange =
        Notification.Name("HWSSettingsDidChangeNotification")
    
    static let AGAsyncNotification = Notification.Name("AGAsyncNotificationDidChangeNotification")
}


class Controller {
    init() {
        NotificationCenter.default.addObserver(self, selector:
                                                #selector(reloadSettings), name: .HWSSettingsDidChange, object:
                                                    self)
        NotificationCenter.default.addObserver(self, selector: #selector(showAsyncCall), name: .AGAsyncNotification, object: nil)
    }
    
    @objc func reloadSettings(note: Notification) {
        if let userInfo = note.userInfo {
           print(userInfo)
        }
       print("Reloading settings!")
    }
    
    @objc func showAsyncCall() {
        print("Executing async code")
    }
}

let controller = Controller()

print("Before")
let notification = Notification(name: .AGAsyncNotification)
NotificationQueue.default.enqueue(notification, postingStyle: .whenIdle, coalesceMask: .none, forModes: nil)
PlaygroundPage.current.needsIndefiniteExecution = true

NotificationCenter.default.post(name: .HWSSettingsDidChange, object: nil, userInfo: ["theme": "dark"])
print("After")
