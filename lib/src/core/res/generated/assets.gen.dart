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

  /// File path: assets/icons/ic_search_dark.svg
  SvgGenImage get icSearchDark =>
      const SvgGenImage('assets/icons/ic_search_dark.svg');

  /// File path: assets/icons/ic_search_light.svg
  SvgGenImage get icSearchLight =>
      const SvgGenImage('assets/icons/ic_search_light.svg');

  /// List of all assets
  List<SvgGenImage> get values => [icSearchDark, icSearchLight];
}

class $AssetsIllustrationGen {
  const $AssetsIllustrationGen();

  /// File path: assets/illustration/email_sent.svg
  SvgGenImage get emailSent =>
      const SvgGenImage('assets/illustration/email_sent.svg');

  /// File path: assets/illustration/favorited_empty_dark.svg
  SvgGenImage get favoritedEmptyDark =>
      const SvgGenImage('assets/illustration/favorited_empty_dark.svg');

  /// File path: assets/illustration/favorited_empty_light.svg
  SvgGenImage get favoritedEmptyLight =>
      const SvgGenImage('assets/illustration/favorited_empty_light.svg');

  /// File path: assets/illustration/logo.svg
  SvgGenImage get logo => const SvgGenImage('assets/illustration/logo.svg');

  /// File path: assets/illustration/shorten_empty_dark.svg
  SvgGenImage get shortenEmptyDark =>
      const SvgGenImage('assets/illustration/shorten_empty_dark.svg');

  /// File path: assets/illustration/shorten_empty_light.svg
  SvgGenImage get shortenEmptyLight =>
      const SvgGenImage('assets/illustration/shorten_empty_light.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        emailSent,
        favoritedEmptyDark,
        favoritedEmptyLight,
        logo,
        shortenEmptyDark,
        shortenEmptyLight
      ];
}

class Assets {
  Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsIllustrationGen illustration = $AssetsIllustrationGen();
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
