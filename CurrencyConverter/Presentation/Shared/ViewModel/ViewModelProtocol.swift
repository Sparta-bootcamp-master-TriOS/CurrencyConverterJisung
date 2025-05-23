protocol ViewModelProtocol {
    associatedtype Action
    associatedtype State

    var action: ((Action) -> Void)? { get }
    var state: State { get }
}
