import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_dimensions.dart';

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

OutlineInputBorder standardBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(AppDimensions.standardBorder),
  borderSide: const BorderSide(
    color: AppColors.primaryColor,
  ),
);
