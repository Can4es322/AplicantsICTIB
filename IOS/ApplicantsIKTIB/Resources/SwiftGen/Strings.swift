// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Согласиться и продолжить
  internal static let additionalTextButton = L10n.tr("Localizable", "additionalTextButton")
  /// Добавьте информацию
  internal static let additionalTitle1 = L10n.tr("Localizable", "additionalTitle1")
  /// про абитуриента
  internal static let additionalTitle2 = L10n.tr("Localizable", "additionalTitle2")
  /// Войти в профиль
  internal static let authorizationTextButton = L10n.tr("Localizable", "authorizationTextButton")
  /// Авторизация
  internal static let authorizationTitle = L10n.tr("Localizable", "authorizationTitle")
  /// Дата рождения
  internal static let birthdayTextField = L10n.tr("Localizable", "birthdayTextField")
  /// Город
  internal static let cityTextField = L10n.tr("Localizable", "cityTextField")
  /// Не получили код? Помощь
  internal static let codeNotRecived = L10n.tr("Localizable", "codeNotRecived")
  /// Код отправлен повторно 
  internal static let codeRepeatSend = L10n.tr("Localizable", "codeRepeatSend")
  /// Введите одноразовый код
  internal static let enterCode = L10n.tr("Localizable", "enterCode")
  /// Войти как гость
  internal static let enterGuest = L10n.tr("Localizable", "enterGuest")
  /// Проверьте правильность указанного номера
  internal static let errorText = L10n.tr("Localizable", "errorText")
  /// Детали
  internal static let eventPostTitle = L10n.tr("Localizable", "eventPostTitle")
  /// Я пойду
  internal static let eventsButton = L10n.tr("Localizable", "eventsButton")
  /// Описание:
  internal static let eventsDescription = L10n.tr("Localizable", "eventsDescription")
  /// Все
  internal static let eventsNavigationAll = L10n.tr("Localizable", "eventsNavigationAll")
  /// Я иду
  internal static let eventsNavigationRecerved = L10n.tr("Localizable", "eventsNavigationRecerved")
  /// Ближайшие
  internal static let eventsNewsTitle = L10n.tr("Localizable", "eventsNewsTitle")
  /// События
  internal static let eventsTitle = L10n.tr("Localizable", "eventsTitle")
  /// Ваш код
  internal static let infoCodeTextField = L10n.tr("Localizable", "infoCodeTextField")
  /// После ввода номера телефона,
  /// вам придет одноразовый код.
  internal static let infoTextCode = L10n.tr("Localizable", "infoTextCode")
  /// ВАШ НОМЕР ТЕЛЕФОНА
  internal static let infoTextField = L10n.tr("Localizable", "infoTextField")
  /// Укажите ваш номер телефона
  internal static let infoTextNumberPhone = L10n.tr("Localizable", "infoTextNumberPhone")
  /// Фамилия
  internal static let lastNameTextField = L10n.tr("Localizable", "lastNameTextField")
  /// Отчество
  internal static let middleNameTextField = L10n.tr("Localizable", "middleNameTextField")
  /// Имя
  internal static let nameTextField = L10n.tr("Localizable", "nameTextField")
  /// Продолжая пользоваться приложением,
  ///  Вы соглашаетесь с Политикой конфиденциальности и даете согласие на Обработку Ваших Данных.
  internal static let politicalInfo = L10n.tr("Localizable", "politicalInfo")
  /// Персональные данные
  internal static let profeilePersonData = L10n.tr("Localizable", "profeilePersonData")
  /// О нас
  internal static let profileAboutUs = L10n.tr("Localizable", "profileAboutUs")
  /// 3 балла
  internal static let profileCount = L10n.tr("Localizable", "profileCount")
  /// Посещенные мероприятия
  internal static let profileEventVisit = L10n.tr("Localizable", "profileEventVisit")
  /// Выход
  internal static let profileExit = L10n.tr("Localizable", "profileExit")
  /// Связаться с поддержкой
  internal static let profileHelp = L10n.tr("Localizable", "profileHelp")
  /// Скиба Анна Александровна
  internal static let profileName = L10n.tr("Localizable", "profileName")
  /// Мои заказы
  internal static let profileOrder = L10n.tr("Localizable", "profileOrder")
  /// Профиль
  internal static let profileTitle = L10n.tr("Localizable", "profileTitle")
  /// Регистрация
  internal static let registrationTextButton = L10n.tr("Localizable", "registrationTextButton")
  /// Отправить код повторно
  internal static let repeatCodeButton = L10n.tr("Localizable", "repeatCodeButton")
  /// Школа
  internal static let schoolTextField = L10n.tr("Localizable", "schoolTextField")
  /// Класс
  internal static let succesRegistrationButton = L10n.tr("Localizable", "succesRegistrationButton")
  /// Ура!
  /// Регистрация прошла
  /// успешно.
  internal static let succesRegistrationTitle = L10n.tr("Localizable", "succesRegistrationTitle")
  /// Продолжить
  internal static let textAuthorizationButton = L10n.tr("Localizable", "textAuthorizationButton")
  /// Продолжить
  internal static let textCodeButton = L10n.tr("Localizable", "textCodeButton")
  /// На номер 
  internal static let textPart1 = L10n.tr("Localizable", "textPart1")
  /// был отправлен код для входа в приложение
  internal static let textPart2 = L10n.tr("Localizable", "textPart2")
  /// Зарегистрироваться
  internal static let textRegistrationButton = L10n.tr("Localizable", "textRegistrationButton")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
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
