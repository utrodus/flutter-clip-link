/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/Roboto-Black.ttf
  String get robotoBlack => 'assets/fonts/Roboto-Black.ttf';

  /// File path: assets/fonts/Roboto-BlackItalic.ttf
  String get robotoBlackItalic => 'assets/fonts/Roboto-BlackItalic.ttf';

  /// File path: assets/fonts/Roboto-Bold.ttf
  String get robotoBold => 'assets/fonts/Roboto-Bold.ttf';

  /// File path: assets/fonts/Roboto-BoldItalic.ttf
  String get robotoBoldItalic => 'assets/fonts/Roboto-BoldItalic.ttf';

  /// File path: assets/fonts/Roboto-Italic.ttf
  String get robotoItalic => 'assets/fonts/Roboto-Italic.ttf';

  /// File path: assets/fonts/Roboto-Light.ttf
  String get robotoLight => 'assets/fonts/Roboto-Light.ttf';

  /// File path: assets/fonts/Roboto-LightItalic.ttf
  String get robotoLightItalic => 'assets/fonts/Roboto-LightItalic.ttf';

  /// File path: assets/fonts/Roboto-Medium.ttf
  String get robotoMedium => 'assets/fonts/Roboto-Medium.ttf';

  /// File path: assets/fonts/Roboto-MediumItalic.ttf
  String get robotoMediumItalic => 'assets/fonts/Roboto-MediumItalic.ttf';

  /// File path: assets/fonts/Roboto-Regular.ttf
  String get robotoRegular => 'assets/fonts/Roboto-Regular.ttf';

  /// File path: assets/fonts/Roboto-Thin.ttf
  String get robotoThin => 'assets/fonts/Roboto-Thin.ttf';

  /// File path: assets/fonts/Roboto-ThinItalic.ttf
  String get robotoThinItalic => 'assets/fonts/Roboto-ThinItalic.ttf';

  /// List of all assets
  List<String> get values => [
        robotoBlack,
        robotoBlackItalic,
        robotoBold,
        robotoBoldItalic,
        robotoItalic,
        robotoLight,
        robotoLightItalic,
        robotoMedium,
        robotoMediumItalic,
        robotoRegular,
        robotoThin,
        robotoThinItalic
      ];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/ic_search.svg
  SvgGenImage get icSearch => const SvgGenImage('assets/icons/ic_search.svg');

  /// List of all assets
  List<SvgGenImage> get values => [icSearch];
}

class $AssetsIllustrationGen {
  const $AssetsIllustrationGen();

  /// File path: assets/illustration/dark_theme.svg
  SvgGenImage get darkTheme =>
      const SvgGenImage('assets/illustration/dark_theme.svg');

  /// File path: assets/illustration/email_sent.svg
  SvgGenImage get emailSent =>
      const SvgGenImage('assets/illustration/email_sent.svg');

  /// File path: assets/illustration/favorited_empty_dark.svg
  SvgGenImage get favoritedEmptyDark =>
      const SvgGenImage('assets/illustration/favorited_empty_dark.svg');

  /// File path: assets/illustration/favorited_empty_light.svg
  SvgGenImage get favoritedEmptyLight =>
      const SvgGenImage('assets/illustration/favorited_empty_light.svg');

  /// File path: assets/illustration/google_logo.svg
  SvgGenImage get googleLogo =>
      const SvgGenImage('assets/illustration/google_logo.svg');

  /// File path: assets/illustration/light_theme.svg
  SvgGenImage get lightTheme =>
      const SvgGenImage('assets/illustration/light_theme.svg');

  /// File path: assets/illustration/shorten_empty_dark.svg
  SvgGenImage get shortenEmptyDark =>
      const SvgGenImage('assets/illustration/shorten_empty_dark.svg');

  /// File path: assets/illustration/shorten_empty_light.svg
  SvgGenImage get shortenEmptyLight =>
      const SvgGenImage('assets/illustration/shorten_empty_light.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        darkTheme,
        emailSent,
        favoritedEmptyDark,
        favoritedEmptyLight,
        googleLogo,
        lightTheme,
        shortenEmptyDark,
        shortenEmptyLight
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/qr_example.png
  AssetGenImage get qrExample =>
      const AssetGenImage('assets/images/qr_example.png');

  /// List of all assets
  List<AssetGenImage> get values => [logo, qrExample];
}

class Assets {
  Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsIllustrationGen illustration = $AssetsIllustrationGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
