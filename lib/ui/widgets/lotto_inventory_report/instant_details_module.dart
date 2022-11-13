import 'package:flutter/material.dart';
import 'package:lotto_mgmt/core/constants/constants.dart';

class InstantDetailsModule extends StatefulWidget {
  const InstantDetailsModule({Key? key}) : super(key: key);

  @override
  State<InstantDetailsModule> createState() => _InstantDetailsModuleState();
}

class _InstantDetailsModuleState extends State<InstantDetailsModule> {
  TextEditingController todaySettleBookController = TextEditingController();
  TextEditingController todayBookActivatedController = TextEditingController();
  TextEditingController returnAdjustmentController = TextEditingController();
  TextEditingController terminalOneController = TextEditingController();
  TextEditingController terminalTwoController = TextEditingController();

  FocusNode fnTodaySettleBook = FocusNode();
  FocusNode fnTodayBookActivated = FocusNode();
  FocusNode fnReturnAdjustment = FocusNode();
  FocusNode fnTerminalOne = FocusNode();
  FocusNode fnTerminalTwo = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Instant Details",
            style:
                AppTextStyle.largeText.copyWith(color: AppColors.primaryColor),
          ),
          //yesterday inventory
          vBox(AppDimensions.sizeTen),
          Row(
            children: [
              SizedBox(
                width: size!.width * 0.1,
                child: Text(
                  "Yesterday Inventory",
                  style: AppTextStyle.mediumText
                      .copyWith(color: AppColors.onyxColor),
                ),
              ),
              hBox(AppDimensions.sizeFifteen),
              SizedBox(
                width: size!.width * 0.1,
                child: Text(
                  "\$ 0",
                  style: AppTextStyle.mediumText
                      .copyWith(color: AppColors.onyxColor),
                ),
              ),
            ],
          ),
          //today settle book

          vBox(AppDimensions.sizeTen),
          Row(
            children: [
              SizedBox(
                width: size!.width * 0.1,
                child: Text(
                  "Today Settle Book",
                  style: AppTextStyle.mediumText
                      .copyWith(color: AppColors.onyxColor),
                ),
              ),
              hBox(AppDimensions.sizeFifteen),
              SizedBox(
                width: size!.width * 0.15,
                child: TextField(
                  controller: todaySettleBookController,
                  focusNode: fnTodaySettleBook,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "00",
                    border: standardBorder,
                    errorBorder: standardBorder.copyWith(
                        borderSide:
                            const BorderSide(color: AppColors.redAccent)),
                  ),
                ),
              ),
            ],
          ),

          //today book activated
          vBox(AppDimensions.sizeTen),
          Row(
            children: [
              SizedBox(
                width: size!.width * 0.1,
                child: Text(
                  "Today Book Activated",
                  style: AppTextStyle.mediumText
                      .copyWith(color: AppColors.onyxColor),
                ),
              ),
              hBox(AppDimensions.sizeFifteen),
              SizedBox(
                width: size!.width * 0.15,
                child: TextField(
                  controller: todayBookActivatedController,
                  focusNode: fnTodayBookActivated,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "00",
                    border: standardBorder,
                    errorBorder: standardBorder.copyWith(
                        borderSide:
                            const BorderSide(color: AppColors.redAccent)),
                  ),
                ),
              ),
            ],
          ),

          //return adjustment
          vBox(AppDimensions.sizeTen),
          Row(
            children: [
              SizedBox(
                width: size!.width * 0.1,
                child: Text(
                  "Return Adjustment",
                  style: AppTextStyle.mediumText
                      .copyWith(color: AppColors.onyxColor),
                ),
              ),
              hBox(AppDimensions.sizeFifteen),
              SizedBox(
                width: size!.width * 0.15,
                child: TextField(
                  controller: returnAdjustmentController,
                  focusNode: fnReturnAdjustment,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "00",
                    border: standardBorder,
                    errorBorder: standardBorder.copyWith(
                        borderSide:
                            const BorderSide(color: AppColors.redAccent)),
                  ),
                ),
              ),
            ],
          ),

          //Total Inventory
          vBox(AppDimensions.sizeTen),
          Row(
            children: [
              SizedBox(
                width: size!.width * 0.1,
                child: Text(
                  "Total Inventory",
                  style: AppTextStyle.mediumText
                      .copyWith(color: AppColors.onyxColor),
                ),
              ),
              hBox(AppDimensions.sizeFifteen),
              SizedBox(
                width: size!.width * 0.1,
                child: Text(
                  "\$ 0",
                  style: AppTextStyle.mediumText
                      .copyWith(color: AppColors.onyxColor),
                ),
              ),
            ],
          ),

          //today's inventory
          vBox(AppDimensions.sizeTen),
          Row(
            children: [
              SizedBox(
                width: size!.width * 0.1,
                child: Text(
                  "Today's Inventory",
                  style: AppTextStyle.mediumText
                      .copyWith(color: AppColors.onyxColor),
                ),
              ),
              hBox(AppDimensions.sizeFifteen),
              SizedBox(
                width: size!.width * 0.1,
                child: Text(
                  "\$ 0",
                  style: AppTextStyle.mediumText
                      .copyWith(color: AppColors.onyxColor),
                ),
              ),
            ],
          ),

          //today's instant sales
          vBox(AppDimensions.sizeTen),
          Row(
            children: [
              SizedBox(
                width: size!.width * 0.1,
                child: Text(
                  "Today's Instant Sales",
                  style: AppTextStyle.mediumText
                      .copyWith(color: AppColors.onyxColor),
                ),
              ),
              hBox(AppDimensions.sizeFifteen),
              SizedBox(
                width: size!.width * 0.1,
                child: Text(
                  "\$ 0",
                  style: AppTextStyle.mediumText
                      .copyWith(color: AppColors.onyxColor),
                ),
              ),
            ],
          ),

          //Terminal 1
          vBox(AppDimensions.sizeTen),
          Row(
            children: [
              SizedBox(
                width: size!.width * 0.1,
                child: Text(
                  "Terminal 1",
                  style: AppTextStyle.mediumText
                      .copyWith(color: AppColors.onyxColor),
                ),
              ),
              hBox(AppDimensions.sizeFifteen),
              SizedBox(
                width: size!.width * 0.15,
                child: TextField(
                  controller: terminalOneController,
                  focusNode: fnTerminalOne,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "00",
                    border: standardBorder,
                    errorBorder: standardBorder.copyWith(
                        borderSide:
                            const BorderSide(color: AppColors.redAccent)),
                  ),
                ),
              ),
            ],
          ),

          //Terminal 2
          vBox(AppDimensions.sizeTen),
          Row(
            children: [
              SizedBox(
                width: size!.width * 0.1,
                child: Text(
                  "Terminal 2",
                  style: AppTextStyle.mediumText
                      .copyWith(color: AppColors.onyxColor),
                ),
              ),
              hBox(AppDimensions.sizeFifteen),
              SizedBox(
                width: size!.width * 0.15,
                child: TextField(
                  controller: terminalTwoController,
                  focusNode: fnTerminalTwo,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "00",
                    border: standardBorder,
                    errorBorder: standardBorder.copyWith(
                        borderSide:
                            const BorderSide(color: AppColors.redAccent)),
                  ),
                ),
              ),
            ],
          ),

          //instant cash
          vBox(AppDimensions.sizeTen),
          Row(
            children: [
              SizedBox(
                width: size!.width * 0.1,
                child: Text(
                  "Instant Cash",
                  style: AppTextStyle.mediumText
                      .copyWith(color: AppColors.onyxColor),
                ),
              ),
              hBox(AppDimensions.sizeFifteen),
              SizedBox(
                width: size!.width * 0.1,
                child: Text(
                  "\$ 0",
                  style: AppTextStyle.mediumText
                      .copyWith(color: AppColors.onyxColor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
