/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/back.svg
  String get back => 'assets/icons/back.svg';

  /// File path: assets/icons/home.svg
  String get home => 'assets/icons/home.svg';

  /// File path: assets/icons/home_outline.svg
  String get homeOutline => 'assets/icons/home_outline.svg';

  /// File path: assets/icons/saved.svg
  String get saved => 'assets/icons/saved.svg';

  /// File path: assets/icons/saved_outline.svg
  String get savedOutline => 'assets/icons/saved_outline.svg';

  /// File path: assets/icons/search.svg
  String get search => 'assets/icons/search.svg';

  /// File path: assets/icons/search_outline.svg
  String get searchOutline => 'assets/icons/search_outline.svg';

  /// File path: assets/icons/star_50.svg
  String get star50 => 'assets/icons/star_50.svg';

  /// File path: assets/icons/star_empty.svg
  String get starEmpty => 'assets/icons/star_empty.svg';

  /// File path: assets/icons/star_full.svg
  String get starFull => 'assets/icons/star_full.svg';

  /// List of all assets
  List<String> get values => [
        back,
        home,
        homeOutline,
        saved,
        savedOutline,
        search,
        searchOutline,
        star50,
        starEmpty,
        starFull
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/LOGO1.webp
  AssetGenImage get logo1 => const AssetGenImage('assets/images/LOGO1.webp');

  /// File path: assets/images/background.webp
  AssetGenImage get background =>
      const AssetGenImage('assets/images/background.webp');

  /// File path: assets/images/background_2.webp
  AssetGenImage get background2 =>
      const AssetGenImage('assets/images/background_2.webp');

  /// File path: assets/images/background_3.webp
  AssetGenImage get background3 =>
      const AssetGenImage('assets/images/background_3.webp');

  /// File path: assets/images/background_settings.webp
  AssetGenImage get backgroundSettings =>
      const AssetGenImage('assets/images/background_settings.webp');

  /// File path: assets/images/background_t.webp
  AssetGenImage get backgroundT =>
      const AssetGenImage('assets/images/background_t.webp');

  /// File path: assets/images/logo.webp
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.webp');

  /// File path: assets/images/oris.png
  AssetGenImage get oris => const AssetGenImage('assets/images/oris.png');

  /// File path: assets/images/profile_img.jpg
  AssetGenImage get profileImg =>
      const AssetGenImage('assets/images/profile_img.jpg');

  /// File path: assets/images/splash.webp
  AssetGenImage get splash => const AssetGenImage('assets/images/splash.webp');

  /// List of all assets
  List<AssetGenImage> get values => [
        logo1,
        background,
        background2,
        background3,
        backgroundSettings,
        backgroundT,
        logo,
        oris,
        profileImg,
        splash
      ];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size = null});

  final String _assetName;

  final Size? size;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
