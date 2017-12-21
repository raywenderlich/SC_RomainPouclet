// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// swiftlint:disable identifier_name line_length type_body_length
enum L10n {
  /// My Social Networks Profiles
  static let applicationTitle = L10n.tr("Localizable", "application_title")
  /// Cancel
  static let profileConfirmCancel = L10n.tr("Localizable", "profile_confirm_cancel")
  /// Are you sure you want to visit %@? This will open a browser.
  static func profileConfirmMessage(_ p1: String) -> String {
    return L10n.tr("Localizable", "profile_confirm_message", p1)
  }
  /// Let's Go!
  static let profileConfirmOk = L10n.tr("Localizable", "profile_confirm_ok")
  /// Open Profile?
  static let profileConfirmTitle = L10n.tr("Localizable", "profile_confirm_title")
}
// swiftlint:enable identifier_name line_length type_body_length

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
