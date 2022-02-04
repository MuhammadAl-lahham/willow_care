import 'package:flutter/material.dart';
import 'package:willow_care_test/helper/size_config.dart';

class CustomWelcomeClipper extends CustomClipper<Path> {
  const CustomWelcomeClipper();

  @override
  Path getClip(Size size) {
    // path_1
    // double path_1_xs = size.width / 375.23;
    //double path_1_ys = size.height / 409.48;

    Path path_1 = Path()
      ..moveTo(375.23 * SizeConfig.perWidth, 0)
      ..lineTo(375.23 * SizeConfig.perWidth, 362.97 * SizeConfig.perHeight)
      ..cubicTo(
          375.23 * SizeConfig.perWidth,
          362.97 * SizeConfig.perHeight,
          274.6 * SizeConfig.perWidth,
          409.48 * SizeConfig.perHeight,
          180.79 * SizeConfig.perWidth,
          409.48 * SizeConfig.perHeight)
      ..cubicTo(86.98 * SizeConfig.perWidth, 409.48 * SizeConfig.perHeight, 0,
          362.97 * SizeConfig.perHeight, 0, 362.97 * SizeConfig.perHeight)
      ..lineTo(0, 0)
      ..lineTo(375.23 * SizeConfig.perWidth, 0)
      ..close();

    return path_1;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
