struct Account: Codable {
    var balance: Double
    var history: [Operation] = []
}