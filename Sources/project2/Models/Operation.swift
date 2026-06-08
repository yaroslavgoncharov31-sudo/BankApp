struct Operation: Codable {
    let type: OperationType
    let amount: Double
    let title: String?
    let description: String?
}