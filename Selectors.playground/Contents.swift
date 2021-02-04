import Foundation

class BookStore: NSObject {
    func open() {
        perform(#selector(turnOnLights), with: 10)
        perform(#selector(openDoors))
        
        let manager = Manager()
        let sel = NSSelectorFromString("handleComplaintWithManager:")
        print("Selector")
        print(responds(to: sel))
        perform(sel, with: manager)
    }
    @objc func turnOnLights(intensity: Int) {
        print("The lights are on at intensity \(intensity)")
    }
    
    @objc func openDoors() {
        print("The doors are open")

    }
    override func forwardingTarget(for aSelector: Selector!) ->
    Any? {
        return manager
    }
    
}

class Manager: NSObject {
    var name = "jon"
    @objc func handleComplaint(manager: Manager) {
        print("Here's a refund and a free latte. \(manager.name)")
    }
}


let bookStore = BookStore()
let manager = Manager()

bookStore.open()

