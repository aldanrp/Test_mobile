import 'package:flutter/material.dart';

MediaQueryData mediaQueryData(BuildContext context) {
  return MediaQuery.of(context);
}

EdgeInsets horizontal(BuildContext context) {
  return const EdgeInsets.symmetric(horizontal: 25);
}

Widget boxheight(double? height) {
  return SizedBox(
    height: height,
  );
}

Widget boxWidth(double? width) {
  return SizedBox(
    width: width,
  );
}

Size size(BuildContext buildContext) {
  return mediaQueryData(buildContext).size;
}

double width(BuildContext buildContext) {
  return size(buildContext).width;
}

double height(BuildContext buildContext) {
  return size(buildContext).height;
}
