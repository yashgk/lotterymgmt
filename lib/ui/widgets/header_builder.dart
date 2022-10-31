import 'package:flutter/material.dart';

import '../../core/constants/constants.dart';

class HeaderBuilder extends StatelessWidget {
  final String? title;
  const HeaderBuilder({this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppDimensions.sizeEighty,
      child: Text(
        title ?? "TITLE",
        textAlign: TextAlign.center,
        style: AppTextStyle.mediumText.copyWith(color: AppColors.onyxColor),
      ),
    );
  }
}
