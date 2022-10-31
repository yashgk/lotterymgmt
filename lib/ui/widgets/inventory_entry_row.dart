import 'package:flutter/material.dart';
import '../../core/constants/constants.dart';
class InventoryEntryRow extends StatefulWidget {
  final int index;

  const InventoryEntryRow({required this.index, Key? key}) : super(key: key);

  @override
  State<InventoryEntryRow> createState() => _InventoryEntryRowState();
}

class _InventoryEntryRowState extends State<InventoryEntryRow> {
  int total = 0;
  TextEditingController amountController = TextEditingController(text: "0");
  TextEditingController qtyController = TextEditingController(text: "0");

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: AppDimensions.sizeEighty,
          child: Text(
            widget.index.toString(),
            textAlign: TextAlign.center,
            style: AppTextStyle.mediumText.copyWith(color: AppColors.onyxColor),
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
