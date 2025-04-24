import CoreData
import DomainLayer

public final class DefaultCurrencyRepository: CurrencyRepository {
    private let fetchCurrencyDataSource: FetchCurrencyDataSource
    private let saveCurrencyDataSource: SaveCurrencyDataSource

    private let mapper = CurrencyMapper.shared

    public init(
        fetchCurrencyDataSource: FetchCurrencyDataSource,
        saveCurrencyDataSource: SaveCurrencyDataSource
    ) {
        self.fetchCurrencyDataSource = fetchCurrencyDataSource
        self.saveCurrencyDataSource = saveCurrencyDataSource
    }

    /// 서버에서 최신 환율 데이터를 가져오는 메서드
    ///
    /// - Parameter completion: 결과를 반환하는 클로저. 성공 시 `(CurrencyMeta, [Currency])`를 반환하고 실패 시 `Error`를 반환한다.
    public func fetch(completion: @escaping (Result<(meta: CurrencyMeta, currencies: [Currency]), Error>) -> Void) {
        fetchCurrencyDataSource.execute { [weak self] (result: Result<CurrencyResponse, Error>) in
            guard let self else { return }

            switch result {
            case let .success(response):
                let (meta, currencies) = self.mapper.map(from: response)

                self.save(meta, currencies)

                completion(.success((meta, currencies)))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }

    /// CoreData에 최신 환율 데이터를 저장하는 메서드
    ///
    /// - Parameters:
    ///   - currencies: 환율 목록
    ///   - meta: 환율 메타 정보
    private func save(_ meta: CurrencyMeta, _ currencies: [Currency]) {
        let currencyEntities = currencies.map { mapper.map(from: $0) }

        saveCurrencyDataSource.execute(currencies: currencyEntities, meta: meta)
    }
}
