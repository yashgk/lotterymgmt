import 'package:flutter/material.dart';
import 'package:lotto_mgmt/ui/widgets/lotto_inventory_report/instant_details_module.dart';

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
          const InstantDetailsModule(),
          const LottoReportSummary(),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Text(
                  "Instant Details",
                  style: AppTextStyle.largeText
                      .copyWith(color: AppColors.primaryColor),
                ),
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
                            .copyWith(color: AppColors.primaryColor),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
