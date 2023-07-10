// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Добавить в корзину
  internal static let addToCart = L10n.tr("Localizable", "add_to_cart", fallback: "Добавить в корзину")
  /// Корзина
  internal static let cart = L10n.tr("Localizable", "cart", fallback: "Корзина")
  /// Поиск
  internal static let find = L10n.tr("Localizable", "find", fallback: "Поиск")
  /// Localizable.strings
  ///   FoodStore
  /// 
  ///   Created by Andrey Pozdnyakov on 08.07.2023.
  internal static let home = L10n.tr("Localizable", "home", fallback: "Главная")
  /// Загрузка данных
  internal static let loading = L10n.tr("Localizable", "loading", fallback: "Загрузка данных")
  /// Оплатить %@ ₽
  internal static func pay(_ p1: Any) -> String {
    return L10n.tr("Localizable", "pay", String(describing: p1), fallback: "Оплатить %@ ₽")
  }
  /// %@ ₽
  internal static func price(_ p1: Any) -> String {
    return L10n.tr("Localizable", "price", String(describing: p1), fallback: "%@ ₽")
  }
  /// Аккаунт
  internal static let profile = L10n.tr("Localizable", "profile", fallback: "Аккаунт")
  /// С рыбой
  internal static let tegFour = L10n.tr("Localizable", "teg_four", fallback: "С рыбой")
  /// Все меню
  internal static let tegOne = L10n.tr("Localizable", "teg_one", fallback: "Все меню")
  /// С рисом
  internal static let tegThree = L10n.tr("Localizable", "teg_three", fallback: "С рисом")
  /// Салаты
  internal static let tegTwo = L10n.tr("Localizable", "teg_two", fallback: "Салаты")
  /// Санкт-Петербург
  internal static let testTown = L10n.tr("Localizable", "test_town", fallback: "Санкт-Петербург")
  /// · %@ г
  internal static func weight(_ p1: Any) -> String {
    return L10n.tr("Localizable", "weight", String(describing: p1), fallback: "· %@ г")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
