import Alamofire

struct DefaultCurrencyDataSource: CurrencyDataSource {
    private let baseURL: String

    init(baseURL: String) {
        self.baseURL = baseURL
    }

    func fetchCurrency<T: Decodable>(completion: @escaping (Result<T, Error>) -> Void) {
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
