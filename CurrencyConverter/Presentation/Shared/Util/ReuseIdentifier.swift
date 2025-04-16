protocol ReuseIdentifier {
    static var identifier: String { get }
}

extension ReuseIdentifier {
    /// 타입명을 문자열로 변환하여 식별자로 사용
    static var identifier: String {
        return String(describing: self)
    }
}
