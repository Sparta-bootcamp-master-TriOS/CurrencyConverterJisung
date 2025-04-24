import UIKit

enum AlertManager {
    typealias Const = SharedConstant.Alert

    /// 에러 메시지를 표시하는 Alert 생성 메서드
    ///
    /// - Parameters:
    ///   - message: Alert에 표시할 에러 메시지
    ///   - action: 확인 버튼을 눌렀을 때 실행할 액션 (옵셔널)
    /// - Returns: 구성된 `UIAlertController` 객체
    static func errorAlert(message: String, action: (() -> Void)? = nil) -> UIAlertController {
        let alert = UIAlertController(title: Const.error, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Const.confirm, style: .default) { _ in
            action?()
        })

        return alert
    }
}
