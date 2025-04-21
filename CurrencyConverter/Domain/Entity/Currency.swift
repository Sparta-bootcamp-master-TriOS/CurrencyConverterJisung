public struct Currency {
    public let code: String
    public let name: String
    public let rate: Double
    public var hasIncreased: Bool?

    public init(code: String, name: String, rate: Double, hasIncreased: Bool? = nil) {
        self.code = code
        self.name = name
        self.rate = rate
        self.hasIncreased = hasIncreased
    }
}
