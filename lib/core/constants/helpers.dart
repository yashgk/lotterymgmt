import 'package:flutter/material.dart';

Size? size;

void setSizeConfig(BuildContext context) {
  size = MediaQuery.of(context).size;
}

Widget vBox(double height) {
  return SizedBox(
    height: height,
  );
}

Widget hBox(double width) {
  return SizedBox(
    width: width,
  );
}