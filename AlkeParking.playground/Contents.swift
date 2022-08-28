import UIKit

enum VehicleType {
    case car
    case moto
    case miniBus
    case bus
}

protocol Parkable {
    var plate: String { get }
    var type: VehicleType { get }
    var checkInTime: Date { get }
    var discountCard: String? { get set }
    var parkedTime: Int { get }
}

struct Vehicle: Parkable {
    let plate: String
    let type: VehicleType
    let checkInTime: Date
    var discountCard: String?
    var parkedTime: Int {
        get {
            let mins = Calendar.current.dateComponents([.minute], from:
            checkInTime, to: Date()).minute ?? 0
            return mins
        }
    }
}

extension Vehicle: Hashable {
    static func == (lhs: Vehicle, rhs: Vehicle) -> Bool {
        return lhs.plate == rhs.plate
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(plate)
    }
}

class Parking {
    var vehicles: Set<Vehicle> = []
}

var alkeParking = Parking()
let car = Vehicle(plate: "AA111AA", type: VehicleType.car, checkInTime: Date(), discountCard: "DISCOUNT_CARD_001")
let moto = Vehicle(plate: "B222BBB", type: VehicleType.moto, checkInTime: Date(), discountCard: nil)
let miniBus = Vehicle(plate: "CC333CC", type: VehicleType.miniBus, checkInTime: Date(), discountCard: nil)
let bus = Vehicle(plate: "DD444DD", type: VehicleType.bus, checkInTime: Date(), discountCard: "DISCOUNT_CARD_002")
//alkeParking.vehicles.insert(car)
//alkeParking.vehicles.insert(moto)
//alkeParking.vehicles.insert(miniBus)
//alkeParking.vehicles.insert(bus)

print(alkeParking.vehicles.insert(car).inserted)  // true
print(alkeParking.vehicles.insert(moto).inserted)  // true
print(alkeParking.vehicles.insert(miniBus).inserted)// true
print(alkeParking.vehicles.insert(bus).inserted)  // true

let car2 = Vehicle(plate: "AA111AA", type: VehicleType.car, checkInTime: Date(), discountCard: "DISCOUNT_CARD_003")
print(alkeParking.vehicles.insert(car2).inserted)  // false

