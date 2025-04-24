import Foundation

enum CurrencyInfoConstant {
    enum Separator {
        static let horizontalInset: CGFloat = 16
        static let verticalInset: CGFloat = 0
    }

    enum TableView {
        static let defaultSpacing: CGFloat = 16
        static let labelStackViewSpacing: CGFloat = 4
        static let rateFormat = "%.4f"
        static let height: CGFloat = 60
        static let rateLabelWidth = 120
        static let defaultFontSize: CGFloat = 16
        static let nameFontSize: CGFloat = 14
    }

    enum Alert {
        static let message = "데이터를 불러올 수 없습니다."
    }
}
