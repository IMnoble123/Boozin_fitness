import 'package:boozinfitnessapp/shared/extensions/theams.dart';
import 'package:flutter/material.dart';

class ImagePathDark implements ImagePath {
  @override
  String get splashBoozin => "assets/images/light_boozn.png";
  @override
  String get iconFootSteps => "assets/icons/footstep.png";
  @override
  String get iconKcal => "assets/icons/cal.png";
}

class ImagePathLight implements ImagePath {
  @override
  String get splashBoozin => "assets/images/Boozn.png";
  @override
  String get iconFootSteps => "assets/icons/black_footsteps.png";
  @override
  String get iconKcal => "assets/icons/black_cal.png";
}

class ImagePathCommon {
  static const String splashI = "assets/images/imgone.png";
}

abstract class ImagePath {
  String get splashBoozin;
  String get iconFootSteps;
  String get iconKcal;

  factory ImagePath(BuildContext context) => context.themeValue(
        light: ImagePathLight(),
        dark: ImagePathDark(),
      );
}
