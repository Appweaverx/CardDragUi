import 'package:animate_container/theme/theme.dart';
import 'package:flutter/material.dart';


class UiConsts {
  UiConsts._();

  static const BoxDecoration gradientDecoration = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.3, 1],
      colors: CustomColors.scaffoldColors,
    ),
  );

  // static double headerHeight = 0.65.sh;
  static double headerHeight(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.65;
  }
}
