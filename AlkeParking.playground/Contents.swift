import UIKit

enum VehicleType: Int {
    case car = 20
    case moto = 15
    case miniBus = 25
    case bus = 30
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

struct Parking {
    var vehicles: Set<Vehicle> = []
//    let historic: [Vehicle] = []
    let capacity = 4
    
    mutating func checkInVehicle(_ vehicle: Vehicle, onFinish: (Bool) -> Void) {
        guard vehicles.count != capacity else {
            onFinish(false)
            return
        }
        
        guard !vehicles.contains(vehicle) else {
            onFinish(false)
            return
        }

        let isInserted = self.vehicles.insert(vehicle).inserted
        
        onFinish(isInserted)
    }
    
    mutating func checkOutVehicle(plate: String, onSuccess: (Int) -> Void, onError: () -> Void) -> Void {
        guard let vehicle = vehicles.first(where: { $0.plate == plate }) else {
            onError()
            return
        }
        guard let vehicleRemoved = vehicles.remove(vehicle) else {
            print("Error to remove Vehicle!")
            onError()
            return
        }
        print(vehicleRemoved)
        print(vehicle == vehicleRemoved)
        onSuccess(5)
    }
    
    func calculateFee(type: VehicleType, parkedTime: Int, hasDiscountCard: Bool) -> Int {
        var fee = type.rawValue
        if parkedTime > 120 {
            fee += (parkedTime - 120) / 15 * 5
            fee += (parkedTime - 120) % 15 == 0 ? 0 : 5
        }
        
        if hasDiscountCard {
            fee = Int((1.0 - 0.15) * Double(fee))
        }
        return fee
    }
}


//extension Date {
//    var dayAfter: Date {
//        return Calendar.current.date(byAdding: .day, value: 1, to: self)!
//    }
//
//    var dayBefore: Date {
//        return Calendar.current.date(byAdding: .day, value: -1, to: self)!
//    }
//}

var alkeParking = Parking()
print(alkeParking.calculateFee(type: .car, parkedTime: 198, hasDiscountCard: false))
let car1 = Vehicle(plate: "AA111AA", type: VehicleType.car, checkInTime: Date(), discountCard: "DISCOUNT_CARD_001")
let car2 = Vehicle(plate: "AA111AA", type: VehicleType.car, checkInTime: Date(), discountCard: "DISCOUNT_CARD_003")
let moto = Vehicle(plate: "B222BBB", type: VehicleType.moto, checkInTime: Date(), discountCard: nil)
let miniBus = Vehicle(plate: "CC333CC", type: VehicleType.miniBus, checkInTime: Date(), discountCard: nil)
let bus = Vehicle(plate: "DD444DD", type: VehicleType.bus, checkInTime: Date(), discountCard: "DISCOUNT_CARD_002")

let cars: [Vehicle] = [car1, car2, moto, miniBus, bus]

for car in cars {
    alkeParking.checkInVehicle(car) { isInserted in
        if isInserted {
            print("Welcome to AlkeParking!")
        } else {
            print("Sorry, the check-in failed")
        }
    }
}


alkeParking.checkOutVehicle(plate: "CC333CC") { price in
    print(price)
} onError: {
    print("Deu ruim")
}


//alkeParking.checkInVehicle(car, onFinish: inserir)
//
//alkeParking.checkInVehicle(moto, onFinish: inserir)
//alkeParking.checkInVehicle(miniBus, onFinish: inserir)
//alkeParking.checkInVehicle(bus, onFinish: inserir)
//alkeParking.checkInVehicle(car2, onFinish: inserir)


//alkeParking.vehicles.remove(moto)
