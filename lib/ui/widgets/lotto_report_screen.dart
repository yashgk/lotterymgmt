import 'package:flutter/material.dart';
import 'package:lotto_mgmt/core/constants/app_dimensions.dart';
import 'package:lotto_mgmt/core/constants/app_text_styles.dart';
import 'package:lotto_mgmt/core/constants/helpers.dart';

class LottoReportSummary extends StatefulWidget {
  const LottoReportSummary({super.key});

  @override
  State<LottoReportSummary> createState() => _LottoReportSummaryState();
}

class _LottoReportSummaryState extends State<LottoReportSummary> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: size!.width * 0.1,
                    child: const Text(
                      "Yesterday Inventory",
                      style: AppTextStyle.mediumText,
                    ),
                  ),
                  hBox(AppDimensions.sizeFifteen),
                  SizedBox(
                    width: size!.width * 0.1,
                    child: const Text(
                      "\$ 0",
                      style: AppTextStyle.mediumText,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
