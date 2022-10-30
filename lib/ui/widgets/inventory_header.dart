import 'package:flutter/material.dart';
import 'package:lotto_mgmt/core/constants/app_colors.dart';
import 'package:lotto_mgmt/core/constants/app_dimensions.dart';
import 'package:lotto_mgmt/core/constants/app_text_styles.dart';
import 'package:lotto_mgmt/core/constants/helpers.dart';

class InventoryHeader extends StatelessWidget {
  const InventoryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimensions.sizeTen),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: AppDimensions.sizeEighty,
            child: Text(
              "RACK",
              textAlign: TextAlign.center,
              style:
                  AppTextStyle.mediumText.copyWith(color: AppColors.onyxColor),
            ),
          ),
          hBox(AppDimensions.sizeTen),
          SizedBox(
            width: AppDimensions.sizeEighty,
            child: Text(
              "PRICE",
              textAlign: TextAlign.center,
              style:
                  AppTextStyle.mediumText.copyWith(color: AppColors.onyxColor),
            ),
          ),
          hBox(AppDimensions.sizeTen),
          SizedBox(
            width: AppDimensions.sizeEighty,
            child: Text(
              "QTY",
              textAlign: TextAlign.center,
              style:
                  AppTextStyle.mediumText.copyWith(color: AppColors.onyxColor),
            ),
          ),
          hBox(AppDimensions.sizeTen),
          SizedBox(
            width: AppDimensions.sizeEighty,
            child: Text(
              "TOTAL",
              textAlign: TextAlign.center,
              style:
                  AppTextStyle.mediumText.copyWith(color: AppColors.onyxColor),
            ),
          ),
        ],
      ),
    );
  }
}
