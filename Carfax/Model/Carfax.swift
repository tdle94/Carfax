//
//  Carfax.swift
//  Carfax
//
//  Created by Tuyen Le on 6/24/21.
//

import Foundation

class CarfaxListings: Decodable {
    var listings: [Vehicle]
}

struct Vehicle: Decodable {
    let accidentHistory: Accident
    let atomOtherOptions: [String]
    let atomTopOptions: [String]
    let badge: String?
    let bedLength: String
    let bodytype: String
    let certified: Bool
    let currentPrice: Double
    let dealer: Dealer
    let dealerType: String
    let drivetype: String
    let engine: String
    let exteriorColor: String
    let followCount: Int
    let fuel: String
    let imageCount: Int
    let interiorColor: String
    let listPrice: Double
    let make: String
    let mileage: Double
    let model: String
    let monthlyPaymentEstimate: VehiclePaymentPlan
    let mpgCity: Int
    let mpgHighway: Int
    let noAccidents: Bool
    let oneOwner: Bool
    let year: Int
    let vin: String
    let images: VehicleImage
}

struct Accident: Decodable {
    let accidentSummary: [String]
    let icon: String
    let iconUrl: String
    let text: String
}

struct Dealer: Decodable {
    let address: String
    let carfaxId: String
    let cfxMicrositeUrl: String
    let city: String
    let dealerAverageRating: Double
    let phone: String
    let state: String
    let zip: String
}

struct VehicleImage: Decodable {
    let baseUrl: String
    let large: [String]
}

struct VehiclePaymentPlan: Decodable {
    let downPaymentAmount: Double
    let downPaymentPercent: Double
    let interestRate: Double
    let loanAmount: Double
    let monthlyPayment: Double
    let price: Double
    let termInMonths: Int
}
