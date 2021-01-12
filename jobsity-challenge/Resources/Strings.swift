// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {

  internal enum Alert {
    /// Ok
    internal static let confirmation = L10n.tr("Localizable", "alert.confirmation")
    /// Failed to load episodes
    internal static let message = L10n.tr("Localizable", "alert.message")
    /// Error
    internal static let title = L10n.tr("Localizable", "alert.title")
  }

  internal enum Favorites {
    /// Favorites
    internal static let title = L10n.tr("Localizable", "favorites.title")
  }

  internal enum Show {
    /// %d episodes
    internal static func episodes(_ p1: Int) -> String {
      return L10n.tr("Localizable", "show.episodes", p1)
    }
    /// Season %d
    internal static func season(_ p1: Int) -> String {
      return L10n.tr("Localizable", "show.season", p1)
    }
  }

  internal enum Shows {
    /// No results found :(
    internal static let emptySearch = L10n.tr("Localizable", "shows.empty_search")
    /// Your show list is empty!
    internal static let emptyShows = L10n.tr("Localizable", "shows.empty_shows")
    /// Failed to load shows
    internal static let error = L10n.tr("Localizable", "shows.error")
    /// Shows
    internal static let title = L10n.tr("Localizable", "shows.title")
  }
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
  static let bundle = Bundle(for: BundleToken.self)
}
// swiftlint:enable convenience_type
