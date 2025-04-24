struct CurrencyResponse: Decodable {
    let result: String
    let provider: String
    let documentation: String
    let termsOfUse: String
    let timeLastUpdateUnix: Int
    let timeLastUpdateUTC: String
    let timeNextUpdateUnix: Int
    let timeNextUpdateUTC: String
    let timeEOLUnix: Int
    let baseCode: String
    let rates: [String: Double]

    enum CodingKeys: String, CodingKey {
        case result,
             provider,
             documentation,
             termsOfUse = "terms_of_use",
             timeLastUpdateUnix = "time_last_update_unix",
             timeLastUpdateUTC = "time_last_update_utc",
             timeNextUpdateUnix = "time_next_update_unix",
             timeNextUpdateUTC = "time_next_update_utc",
             timeEOLUnix = "time_eol_unix",
             baseCode = "base_code",
             rates
    }
}
