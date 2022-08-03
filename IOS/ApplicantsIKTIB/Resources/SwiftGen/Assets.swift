// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetColorTypeAlias = ColorAsset.Color
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
  internal static let accentColor = ColorAsset(name: "AccentColor")
  internal static let bg = ColorAsset(name: "bg")
  internal static let black1 = ColorAsset(name: "black1")
  internal static let blue1 = ColorAsset(name: "blue1")
  internal static let blue2 = ColorAsset(name: "blue2")
  internal static let gray1 = ColorAsset(name: "gray1")
  internal static let gray2 = ColorAsset(name: "gray2")
  internal static let gray3 = ColorAsset(name: "gray3")
  internal static let gray4 = ColorAsset(name: "gray4")
  internal static let gray5 = ColorAsset(name: "gray5")
  internal static let gray6 = ColorAsset(name: "gray6")
  internal static let red = ColorAsset(name: "red")
  internal static let avatar = ImageAsset(name: "avatar")
  internal static let date = ImageAsset(name: "date")
  internal static let desk = ImageAsset(name: "desk")
  internal static let info = ImageAsset(name: "info")
  internal static let map = ImageAsset(name: "map")
  internal static let message = ImageAsset(name: "message")
  internal static let money = ImageAsset(name: "money")
  internal static let order = ImageAsset(name: "order")
  internal static let person = ImageAsset(name: "person")
  internal static let tabEvent = ImageAsset(name: "tabEvent")
  internal static let tabProfile = ImageAsset(name: "tabProfile")
  internal static let time = ImageAsset(name: "time")
  internal static let upcomingEvent = ImageAsset(name: "upcomingEvent")
  internal static let succesReg = ImageAsset(name: "succesReg")
  internal static let authorization = ImageAsset(name: "authorization")
  internal static let back = ImageAsset(name: "back")
  internal static let aEvent = ImageAsset(name: "AEvent")
  internal static let aNews = ImageAsset(name: "ANews")
  internal static let aProfile = ImageAsset(name: "AProfile")
  internal static let event = ImageAsset(name: "Event")
  internal static let mapIcon = ImageAsset(name: "MapIcon")
  internal static let news = ImageAsset(name: "News")
  internal static let user = ImageAsset(name: "User")
  internal static let eventImg = ImageAsset(name: "eventImg")
  internal static let example = ImageAsset(name: "example")
  internal static let example1 = ImageAsset(name: "example1")
  internal static let logo2 = ImageAsset(name: "logo2")
  internal static let profi = ImageAsset(name: "profi")
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal final class ColorAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  internal private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  #if os(iOS) || os(tvOS)
  @available(iOS 11.0, tvOS 11.0, *)
  internal func color(compatibleWith traitCollection: UITraitCollection) -> Color {
    let bundle = BundleToken.bundle
    guard let color = Color(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }
  #endif

  fileprivate init(name: String) {
    self.name = name
  }
}

internal extension ColorAsset.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Image = UIImage
  #endif

  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, macOS 10.7, *)
  internal var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if os(iOS) || os(tvOS)
  @available(iOS 8.0, tvOS 9.0, *)
  internal func image(compatibleWith traitCollection: UITraitCollection) -> Image {
    let bundle = BundleToken.bundle
    guard let result = Image(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
  #endif
}

internal extension ImageAsset.Image {
  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, *)
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
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
