// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(OSX)
  import AppKit.NSFont
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIFont
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "FontConvertible.Font", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias Font = FontConvertible.Font

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Fonts

// swiftlint:disable identifier_name line_length type_body_length
internal enum FontFamily {
  internal enum Gilroy {
    internal static let extraBold = FontConvertible(name: "Gilroy-ExtraBold", family: "Gilroy", path: "Gilroy-ExtraBold.otf")
    internal static let all: [FontConvertible] = [extraBold]
  }
  internal enum SFProText {
    internal static let bold = FontConvertible(name: "SFProText-Bold", family: "SF Pro Text", path: "SFProText-Bold.ttf")
    internal static let heavy = FontConvertible(name: "SFProText-Heavy", family: "SF Pro Text", path: "SFProText-Heavy.ttf")
    internal static let medium = FontConvertible(name: "SFProText-Medium", family: "SF Pro Text", path: "SFProText-Medium.ttf")
    internal static let regular = FontConvertible(name: "SFProText-Regular", family: "SF Pro Text", path: "SFProText-Regular.ttf")
    internal static let semibold = FontConvertible(name: "SFProText-Semibold", family: "SF Pro Text", path: "SFProText-Semibold.ttf")
    internal static let all: [FontConvertible] = [bold, heavy, medium, regular, semibold]
  }
  internal static let allCustomFonts: [FontConvertible] = [Gilroy.all, SFProText.all].flatMap { $0 }
  internal static func registerAllCustomFonts() {
    allCustomFonts.forEach { $0.register() }
  }
}
// swiftlint:enable identifier_name line_length type_body_length

// MARK: - Implementation Details

internal struct FontConvertible {
  internal let name: String
  internal let family: String
  internal let path: String

  #if os(OSX)
  internal typealias Font = NSFont
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Font = UIFont
  #endif

  internal func font(size: CGFloat) -> Font {
    guard let font = Font(font: self, size: size) else {
      fatalError("Unable to initialize font '\(name)' (\(family))")
    }
    return font
  }

  internal func register() {
    // swiftlint:disable:next conditional_returns_on_newline
    guard let url = url else { return }
    CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil)
  }

  fileprivate var url: URL? {
    // swiftlint:disable:next implicit_return
    return BundleToken.bundle.url(forResource: path, withExtension: nil)
  }
}

internal extension FontConvertible.Font {
  convenience init?(font: FontConvertible, size: CGFloat) {
    #if os(iOS) || os(tvOS) || os(watchOS)
    if !UIFont.fontNames(forFamilyName: font.family).contains(font.name) {
      font.register()
    }
    #elseif os(OSX)
    if let url = font.url, CTFontManagerGetScopeForURL(url as CFURL) == .none {
      font.register()
    }
    #endif

    self.init(name: font.name, size: size)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    Bundle(for: BundleToken.self)
  }()
}
// swiftlint:enable convenience_type
