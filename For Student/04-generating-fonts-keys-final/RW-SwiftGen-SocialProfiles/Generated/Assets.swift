// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

#if os(OSX)
  import AppKit.NSImage
  typealias AssetColorTypeAlias = NSColor
  typealias Image = NSImage
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIImage
  typealias AssetColorTypeAlias = UIColor
  typealias Image = UIImage
#endif

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

@available(*, deprecated, renamed: "ImageAsset")
typealias AssetType = ImageAsset

struct ImageAsset {
  fileprivate var name: String

  var image: Image {
    let bundle = Bundle(for: BundleToken.self)
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(OSX)
    let image = bundle.image(forResource: NSImage.Name(name))
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else { fatalError("Unable to load image named \(name).") }
    return result
  }
}

struct ColorAsset {
  fileprivate var name: String

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, OSX 10.13, *)
  var color: AssetColorTypeAlias {
    return AssetColorTypeAlias(asset: self)
  }
}

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
enum Asset {
  static let instagramColor = ColorAsset(name: "instagramColor")
  static let pinterestColor = ColorAsset(name: "pinterestColor")
  static let redditColor = ColorAsset(name: "redditColor")
  static let rwLogo = ImageAsset(name: "rw-logo")
  static let rwdevconBg = ImageAsset(name: "rwdevcon-bg")
  static let snapchatColor = ColorAsset(name: "snapchatColor")
  static let socialNetworkInstagram = ImageAsset(name: "socialNetworkInstagram")
  static let socialNetworkPinterest = ImageAsset(name: "socialNetworkPinterest")
  static let socialNetworkReddit = ImageAsset(name: "socialNetworkReddit")
  static let socialNetworkSnapchat = ImageAsset(name: "socialNetworkSnapchat")
  static let socialNetworkTwitter = ImageAsset(name: "socialNetworkTwitter")
  static let socialNetworkYoutube = ImageAsset(name: "socialNetworkYoutube")
  static let twitterColor = ColorAsset(name: "twitterColor")
  static let youtubeColor = ColorAsset(name: "youtubeColor")

  // swiftlint:disable trailing_comma
  static let allColors: [ColorAsset] = [
    instagramColor,
    pinterestColor,
    redditColor,
    snapchatColor,
    twitterColor,
    youtubeColor,
  ]
  static let allImages: [ImageAsset] = [
    rwLogo,
    rwdevconBg,
    socialNetworkInstagram,
    socialNetworkPinterest,
    socialNetworkReddit,
    socialNetworkSnapchat,
    socialNetworkTwitter,
    socialNetworkYoutube,
  ]
  // swiftlint:enable trailing_comma
  @available(*, deprecated, renamed: "allImages")
  static let allValues: [AssetType] = allImages
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

extension Image {
  @available(iOS 1.0, tvOS 1.0, watchOS 1.0, *)
  @available(OSX, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init!(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = Bundle(for: BundleToken.self)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(OSX)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

extension AssetColorTypeAlias {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, OSX 10.13, *)
  convenience init!(asset: ColorAsset) {
    let bundle = Bundle(for: BundleToken.self)
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(OSX)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

private final class BundleToken {}
