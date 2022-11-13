import 'package:flutter/material.dart';
import 'package:lotto_mgmt/core/constants/constants.dart';

class LottoOnlineModule extends StatefulWidget {
  const LottoOnlineModule({Key? key}) : super(key: key);

  @override
  State<LottoOnlineModule> createState() => _LottoOnlineModuleState();
}

class _LottoOnlineModuleState extends State<LottoOnlineModule> {
  TextEditingController onlineCashesT1Controller = TextEditingController();
  TextEditingController onlineCashesT2Controller = TextEditingController();
  TextEditingController onlineCashesT3Controller = TextEditingController();
  TextEditingController onlineSummaryT1Controller = TextEditingController();
  TextEditingController onlineSummaryT2Controller = TextEditingController();
  TextEditingController onlineSummaryT3Controller = TextEditingController();

  FocusNode fnOnlineCashesT1 = FocusNode();
  FocusNode fnOnlineCashesT2 = FocusNode();
  FocusNode fnOnlineCashesT3 = FocusNode();
  FocusNode fnOnlineSummaryT1 = FocusNode();
  FocusNode fnOnlineSummaryT2 = FocusNode();
  FocusNode fnOnlineSummaryT3 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Lotto Online",
            style:
                AppTextStyle.largeText.copyWith(color: AppColors.primaryColor),
          ),
          //Lotto Cashes t1
          vBox(AppDimensions.sizeTen),
          Row(
            children: [
              SizedBox(
                width: size!.width * 0.1,
                child: Text(
                  "Online Cashes T1",
                  style: AppTextStyle.mediumText
                      .copyWith(color: AppColors.onyxColor),
                ),
              ),
              hBox(AppDimensions.sizeFifteen),
              SizedBox(
                width: size!.width * 0.15,
                child: TextField(
                  controller: onlineCashesT1Controller,
                  focusNode: fnOnlineCashesT1,
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
          //Lotto Cashes t2
          vBox(AppDimensions.sizeTen),
          Row(
            children: [
              SizedBox(
                width: size!.width * 0.1,
                child: Text(
                  "Online Cashes T2",
                  style: AppTextStyle.mediumText
                      .copyWith(color: AppColors.onyxColor),
                ),
              ),
              hBox(AppDimensions.sizeFifteen),
              SizedBox(
                width: size!.width * 0.15,
                child: TextField(
                  controller: onlineCashesT2Controller,
                  focusNode: fnOnlineCashesT2,
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
          //Lotto Cashes t3
          vBox(AppDimensions.sizeTen),
          Row(
            children: [
              SizedBox(
                width: size!.width * 0.1,
                child: Text(
                  "Online Cashes T3",
                  style: AppTextStyle.mediumText
                      .copyWith(color: AppColors.onyxColor),
                ),
              ),
              hBox(AppDimensions.sizeFifteen),
              SizedBox(
                width: size!.width * 0.15,
                child: TextField(
                  controller: onlineCashesT3Controller,
                  focusNode: fnOnlineCashesT3,
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

          //Lotto Summary t1
          vBox(AppDimensions.sizeTen),
          Row(
            children: [
              SizedBox(
                width: size!.width * 0.1,
                child: Text(
                  "Online Summary T1",
                  style: AppTextStyle.mediumText
                      .copyWith(color: AppColors.onyxColor),
                ),
              ),
              hBox(AppDimensions.sizeFifteen),
              SizedBox(
                width: size!.width * 0.15,
                child: TextField(
                  controller: onlineSummaryT1Controller,
                  focusNode: fnOnlineSummaryT1,
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
          //Lotto Summary t2
          vBox(AppDimensions.sizeTen),
          Row(
            children: [
              SizedBox(
                width: size!.width * 0.1,
                child: Text(
                  "Online Summary T2",
                  style: AppTextStyle.mediumText
                      .copyWith(color: AppColors.onyxColor),
                ),
              ),
              hBox(AppDimensions.sizeFifteen),
              SizedBox(
                width: size!.width * 0.15,
                child: TextField(
                  controller: onlineSummaryT2Controller,
                  focusNode: fnOnlineSummaryT2,
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
          //Lotto Summary t3
          vBox(AppDimensions.sizeTen),
          Row(
            children: [
              SizedBox(
                width: size!.width * 0.1,
                child: Text(
                  "Online Summary T3",
                  style: AppTextStyle.mediumText
                      .copyWith(color: AppColors.onyxColor),
                ),
              ),
              hBox(AppDimensions.sizeFifteen),
              SizedBox(
                width: size!.width * 0.15,
                child: TextField(
                  controller: onlineSummaryT3Controller,
                  focusNode: fnOnlineSummaryT3,
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
        ],
      ),
    );
  }
}
