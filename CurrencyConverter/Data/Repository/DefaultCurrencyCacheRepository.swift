import DomainLayer

public final class DefaultCurrencyCacheRepository: CurrencyCacheRepository {
    private var cachedCurrencyMeta: CurrencyMeta?
    private var cachedCurrencies: [Currency]?

    public init() {}

    /// 서버에서 가져온 환율 데이터를 캐싱하는 메서드
    /// - Parameters:
    ///   - meta: 환율 메타 데이터
    ///   - currencies: 환율 목록
    public func cache(meta: CurrencyMeta, currencies: [Currency]?) {
        cachedCurrencyMeta = meta
        cachedCurrencies = currencies
    }

    /// 메모리 캐시된 환율에서 특정 통화 코드에 해당하는 환율 데이터를 반환하는 메서드
    ///
    /// - Parameter code: 통화 코드 (예: "USD", "KRW")
    /// - Returns: 해당 코드에 맞는 `Currency` 객체. 존재하지 않으면 `nil` 반환.
    public func currency(by code: String) -> Currency? {
        cachedCurrencies?.first(where: { $0.code == code })
    }
}
