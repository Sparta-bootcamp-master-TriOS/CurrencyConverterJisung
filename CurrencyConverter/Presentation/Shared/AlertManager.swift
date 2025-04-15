import UIKit

enum AlertManager {
    typealias Const = SharedConstant.Alert

    static func errorAlert(message: String, action: (() -> Void)? = nil) -> UIAlertController {
        let alert = UIAlertController(title: Const.error, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Const.confirm, style: .default) { _ in
            action?()
        })

        return alert
    }
}
