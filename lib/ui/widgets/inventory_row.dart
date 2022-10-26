import 'package:flutter/material.dart';
import 'package:lotto_mgmt/core/constants/app_colors.dart';
import 'package:lotto_mgmt/core/constants/app_dimensions.dart';
import 'package:lotto_mgmt/core/constants/app_text_styles.dart';
import 'package:lotto_mgmt/core/constants/helpers.dart';

class InventoryRow extends StatefulWidget {
  final int index;

  const InventoryRow({required this.index, Key? key}) : super(key: key);

  @override
  State<InventoryRow> createState() => _InventoryRowState();
}

class _InventoryRowState extends State<InventoryRow> {
  int total = 0;
  TextEditingController amountController = TextEditingController(text: "0");
  TextEditingController qtyController = TextEditingController(text: "0");

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: AppDimensions.sizeEighty,
          child: TextField(
            readOnly: true,
            enabled: false,
            textAlign: TextAlign.center,
            style: AppTextStyle.mediumText.copyWith(color: AppColors.onyxColor),
            decoration: InputDecoration(
              isDense: true,
              hintText: widget.index.toString(),
              border: standardBorder,
              errorBorder: standardBorder.copyWith(
                  borderSide: const BorderSide(color: AppColors.redAccent)),
            ),
          ),
        ),
        hBox(AppDimensions.sizeTen),
        SizedBox(
          width: AppDimensions.sizeEighty,
          child: TextField(
            controller: amountController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            style: AppTextStyle.mediumText.copyWith(color: AppColors.onyxColor),
            onChanged: (val) {
              setState(() {
                total = (int.parse(amountController.text) *
                    int.parse(qtyController.text));
              });
            },
            decoration: InputDecoration(
              isDense: true,
              hintText: "0",
              border: standardBorder,
              errorBorder: standardBorder.copyWith(
                  borderSide: const BorderSide(color: AppColors.redAccent)),
            ),
          ),
        ),
        hBox(AppDimensions.sizeTen),
        SizedBox(
          width: AppDimensions.sizeEighty,
          child: TextField(
            controller: qtyController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            style: AppTextStyle.mediumText.copyWith(color: AppColors.onyxColor),
            onChanged: (val) {
              setState(() {
                total = (int.parse(amountController.text) *
                    int.parse(qtyController.text));
              });
            },
            decoration: InputDecoration(
              isDense: true,
              hintText: "0",
              border: standardBorder,
              errorBorder: standardBorder.copyWith(
                  borderSide: const BorderSide(color: AppColors.redAccent)),
            ),
          ),
        ),
        hBox(AppDimensions.sizeTen),
        SizedBox(
          width: AppDimensions.sizeEighty,
          child: Text(
            total.toString(),
            textAlign: TextAlign.center,
            style: AppTextStyle.mediumText.copyWith(color: AppColors.onyxColor),
          ),
        ),
      ],
    );
  }
}
