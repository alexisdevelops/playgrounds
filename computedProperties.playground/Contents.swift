import Foundation

let bucketsPerSqm: Float = 1.5
var width: Float = 1.5
var height: Float = 2.3

var bucketsOfPaint: Int {
    get {
        let result = (width * height) / bucketsPerSqm
        let roundedBuckets = ceilf(result)
        return Int(roundedBuckets)
    }
    set {
        let totalSqm = Float(newValue) * bucketsPerSqm
        print("This amount of area can cover \(totalSqm) square meters")
    }
}

print(bucketsOfPaint)
bucketsOfPaint = 3
