import Foundation

struct CurrencyMapper {
    private typealias Mapper = MapperConstant

    /// 환율 응답 데이터를 도메인 모델로 매핑하는 메서드
    ///
    /// `CurrencyResponse` 객체를 도메인에서 사용하는 `CurrencyMeta`와 `Currency` 목록으로 변환한다.
    /// 각 통화 코드에 대한 이름은 `MapperConstant.nameMap`을 참조하여 매핑되며,
    /// 이름이 없는 경우 기본 문자열(`Mapper.noCode`)이 사용된다.
    ///
    /// - Parameter response: API로부터 받은 환율 응답 데이터
    /// - Returns: 변환된 `CurrencyMeta`와 `Currency` 배열의 튜플
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

    func map(from response: CurrencyEntity) -> CurrencyEntityResponse {
        CurrencyEntityResponse(
            code: response.code!,
            name: response.name!,
            rate: response.rate
        )
    }

    func map(from response: CurrencyEntityResponse) -> Currency {
        Currency(
            code: response.code,
            name: response.name,
            rate: response.rate
        )
    }

    func map(from response: Currency) -> CurrencyEntityResponse {
        CurrencyEntityResponse(
            code: response.code,
            name: response.name,
            rate: response.rate
        )
    }

    func map(from response: FavoriteEntity) -> Favorite {
        Favorite(
            code: response.code!,
            isFavorite: response.isFavorite
        )
    }
}
