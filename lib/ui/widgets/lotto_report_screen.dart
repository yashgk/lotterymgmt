import 'package:flutter/material.dart';
import '../../core/constants/constants.dart';

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
