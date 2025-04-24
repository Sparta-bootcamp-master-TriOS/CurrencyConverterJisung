import Foundation

/// 다양한 데이터 모델 간의 변환을 담당하는 유틸리티 구조체
///
/// API 응답, CoreData 엔티티, 도메인 모델 간의 변환 로직을 제공한다.
struct CurrencyMapper {
    private typealias Mapper = MapperConstant

    /// API 응답 모델(`CurrencyResponse`)을 도메인 모델로 매핑하는 메서드
    ///
    /// `CurrencyMeta`는 업데이트된 시간을 포함하고, `Currency` 배열은 각 통화 코드에 대한 환율과 국가명을 포함한다.
    /// 국가명은 `MapperConstant.nameMap`을 통해 매핑되며, 매핑이 없는 경우 `Mapper.noCode`가 사용된다.
    ///
    /// - Parameter response: API에서 받은 `CurrencyResponse` 객체
    /// - Returns: 도메인 모델 `CurrencyMeta`와 `Currency` 배열을 포함한 튜플
    func map(from response: CurrencyResponse) -> (CurrencyMeta, [Currency]) {
        let updatedAt = Date(timeIntervalSince1970: TimeInterval(response.timeLastUpdateUnix))
        let meta = CurrencyMeta(updatedAt: updatedAt)

        let currencies = response.rates.map { code, rate in
            Currency(
                code: code,
                name: Mapper.nameMap[code] ?? Mapper.noCode,
                rate: rate
            )
        }

        return (meta, currencies)
    }

    /// CoreData의 `CurrencyEntity`를 응답용 DTO(`CurrencyEntityResponse`)로 매핑하는 메서드
    ///
    /// - Parameter response: CoreData에 저장된 `CurrencyEntity`
    /// - Returns: 변환된 `CurrencyEntityResponse`
    func map(from response: CurrencyEntity) -> CurrencyEntityResponse {
        CurrencyEntityResponse(
            code: response.code,
            name: response.name,
            rate: response.rate
        )
    }

    /// 응답용 DTO(`CurrencyEntityResponse`)를 도메인 모델(`Currency`)로 매핑하는 메서드
    ///
    /// - Parameter response: `CurrencyEntityResponse`
    /// - Returns: 변환된 `Currency`
    func map(from response: CurrencyEntityResponse) -> Currency {
        Currency(
            code: response.code,
            name: response.name,
            rate: response.rate
        )
    }

    /// 도메인 모델(`Currency`)을 응답용 DTO(`CurrencyEntityResponse`)로 매핑하는 메서드
    ///
    /// - Parameter response: `Currency` 도메인 모델
    /// - Returns: 변환된 `CurrencyEntityResponse`
    func map(from response: Currency) -> CurrencyEntityResponse {
        CurrencyEntityResponse(
            code: response.code,
            name: response.name,
            rate: response.rate
        )
    }

    /// CoreData의 `FavoriteEntity`를 도메인 모델(`Favorite`)로 매핑하는 메서드
    ///
    /// - Parameter response: CoreData에 저장된 `FavoriteEntity`
    /// - Returns: 변환된 `Favorite` 도메인 모델
    func map(from response: FavoriteEntity) -> Favorite {
        Favorite(
            code: response.code,
            isFavorite: response.isFavorite
        )
    }
}
