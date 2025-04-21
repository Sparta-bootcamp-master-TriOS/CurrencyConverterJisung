internal import Alamofire

public struct FetchCurrencyDataSource {
    private let baseURL: String

    public init(baseURL: String) {
        self.baseURL = baseURL
    }

    /// 환율 데이터를 가져오는 메서드 (제네릭 타입 지원)
    ///
    /// - Parameter completion: 요청 결과를 전달하는 클로저
    func fetchCurrencies<T: Decodable>(completion: @escaping (Result<T, Error>) -> Void) {
        AF.request(baseURL).responseDecodable(of: T.self) { response in
            switch response.result {
            case let .success(result):
                completion(.success(result))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
