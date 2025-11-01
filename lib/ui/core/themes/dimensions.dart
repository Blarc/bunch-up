import 'package:flutter/material.dart';

abstract final class Dimensions {
  const Dimensions();

  /// Get dimensions definition based on screen size
  factory Dimensions.of(BuildContext context) =>
      switch (MediaQuery.sizeOf(context).width) {
        > 600 && < 840 => desktop,
        _ => mobile,
      };

  /// General horizontal padding used to separate UI items
  static const paddingHorizontal = 20.0;

  /// General vertical padding used to separate UI items
  static const paddingVertical = 24.0;

  /// Horizontal padding for screen edges
  double get paddingScreenHorizontal;

  /// Vertical padding for screen edges
  double get paddingScreenVertical;

  double get profilePictureSize;

  /// Horizontal symmetric padding for screen edges
  EdgeInsets get edgeInsetsScreenHorizontal =>
      EdgeInsets.symmetric(horizontal: paddingScreenHorizontal);

  /// Symmetric padding for screen edges
  EdgeInsets get edgeInsetsScreenSymmetric => EdgeInsets.symmetric(
    horizontal: paddingScreenHorizontal,
    vertical: paddingScreenVertical,
  );

  static const Dimensions desktop = _DimensionsDesktop();
  static const Dimensions mobile = _DimensionsMobile();
}

/// Mobile dimensions
final class _DimensionsMobile extends Dimensions {

  const _DimensionsMobile();
  @override
  final double paddingScreenHorizontal = Dimensions.paddingHorizontal;

  @override
  final double paddingScreenVertical = Dimensions.paddingVertical;

  @override
  final double profilePictureSize = 64.0;
}

/// Desktop/Web dimensions
final class _DimensionsDesktop extends Dimensions {

  const _DimensionsDesktop();
  @override
  final double paddingScreenHorizontal = 100;

  @override
  final double paddingScreenVertical = 64;

  @override
  final double profilePictureSize = 128;
}