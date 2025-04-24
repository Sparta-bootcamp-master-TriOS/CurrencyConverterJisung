import DataLayer
import DomainLayer
import PresentationLayer

final class DIContainer {
    /// Mock 데이터는 `PersistenceController.makeInMemory()`를 사용
    let persistenceController = PersistenceController.shared
    let baseURL = AppConstant.baseURL

    lazy var currencyCacheRepository = makeCurrencyCacheRepository()
}
