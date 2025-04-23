import DataLayer
import DomainLayer
import PresentationLayer

final class DIContainer {
    let persistenceController = PersistenceController.shared
    let baseURL = AppConstant.baseURL

    lazy var currencyCacheRepository = makeCurrencyCacheRepository()
}
