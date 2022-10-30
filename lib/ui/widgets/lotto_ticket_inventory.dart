import 'package:flutter/material.dart';
import 'package:lotto_mgmt/core/constants/app_text_styles.dart';
import 'package:lotto_mgmt/ui/widgets/inventory_header.dart';
import 'package:lotto_mgmt/ui/widgets/lotto_report_screen.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/helpers.dart';
import 'inventory_row.dart';

class TicketInventoryScreen extends StatefulWidget {
  const TicketInventoryScreen({Key? key}) : super(key: key);

  @override
  State<TicketInventoryScreen> createState() => _TicketInventoryScreenState();
}

class _TicketInventoryScreenState extends State<TicketInventoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                hBox(AppDimensions.sizeFifty),
                Expanded(
                    child: Column(
                  children: [
                    const InventoryHeader(),
                    const Divider(
                      thickness: AppDimensions.sizeTwo,
                    ),
                    ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) {
                          return const Divider(
                            thickness: AppDimensions.sizeTwo,
                          );
                        },
                        padding:
                            const EdgeInsets.only(bottom: AppDimensions.sizeFive),
                        itemCount: 25,
                        itemBuilder: (context, index) {
                          return InventoryRow(
                            index: index + 1,
                          );
                        }),
                  ],
                )),
                hBox(AppDimensions.sizeFifty),
                Expanded(
                  child: Column(
                    children: [
                      const InventoryHeader(),
                      const Divider(
                        thickness: AppDimensions.sizeTwo,
                      ),
                      ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder: (context, index) {
                            return const Divider(
                              thickness: AppDimensions.sizeTwo,
                            );
                          },
                          padding: const EdgeInsets.only(
                              bottom: AppDimensions.sizeFive),
                          itemCount: 25,
                          itemBuilder: (context, index) {
                            return InventoryRow(
                              index: index + 26,
                            );
                          }),
                    ],
                  ),
                ),
                hBox(AppDimensions.sizeFifty),
              ],
            ),
            vBox(AppDimensions.sizeTwenty),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(
                  size!.width * 0.2,
                  AppDimensions.sizeFifty,
                ),
              ),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LottoReportSummary()),
                    (route) => false);
              },
              child: const Text(
                "NEXT",
                style: AppTextStyle.mediumText,
              ),
            ),
            vBox(AppDimensions.sizeTwenty),
          ],
        ),
      ),
    );
  }
}
