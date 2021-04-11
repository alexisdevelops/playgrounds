import UIKit
import XCTest

protocol HouseProtocol {
    var numberOfViewings: Int { get set }
    func conductViewing()
}

class Buyer {
    func view(_ house: HouseProtocol) {
        house.conductViewing()
    }
}

class House: HouseProtocol {
    var numberOfViewings = 0
    func conductViewing() {
        numberOfViewings += 1
    } }

class HouseMock: HouseProtocol {
    var numberOfViewings = 0
    func conductViewing() {
        numberOfViewings += 1
    } }

func testViewingHouseAddsOneToViewings() {
    // given
    let house = House()
    // when
    house.conductViewing()
    // then
//    XCTAssertEqual(house.numberOfViewings, 1)
    
    print("start testViewingHouseAddsOneToViewings")
    print("Expected: 1")
    print("Found: \(house.numberOfViewings)")
    print("end testViewingHouseAddsOneToViewings")
}

func testBuyerViewingHouseAddsOneToViewings() {
    // given
    let buyer = Buyer()
    let house = HouseMock()
    // when
    buyer.view(house)
    // then
//    XCTAssertEqual(house.numberOfViewings, 1)
    
    print("start testViewingHouseAddsOneToViewings")
    print("Expected: 1")
    print("Found: \(house.numberOfViewings)")
    print("end testViewingHouseAddsOneToViewings")
}
testViewingHouseAddsOneToViewings()
testBuyerViewingHouseAddsOneToViewings()
