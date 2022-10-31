import 'dart:html';

import 'package:flutter/material.dart';
import '../core/constants/app_dimensions.dart';
import '../core/constants/app_text_styles.dart';
import '../core/constants/helpers.dart';
import 'widgets/lotto_book_entry_header.dart';
import 'widgets/lotto_ticket_inventory.dart';

class LottoBookScreen extends StatefulWidget {
  const LottoBookScreen({super.key});

  @override
  State<LottoBookScreen> createState() => _LottoBookScreenState();
}

class _LottoBookScreenState extends State<LottoBookScreen> {
  DateTime selectedDate = DateTime.now();
  bool isBookReport = false;
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => Card(
            child: Column(
              children: [
                const LottoBookEntryHeader(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(
                      size!.width * 0.2,
                      AppDimensions.sizeFifty,
                    ),
                  ),
                  onPressed: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: selectedDate,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2025),
                    );
                    if (picked != null && picked != selectedDate) {
                      setState(() {
                        selectedDate = picked;
                      });
                      if (mounted) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const TicketInventoryScreen()));
                      }
                    }
                  },
                  child: const Text(
                    "+ ADD ENTRY",
                    style: AppTextStyle.mediumText,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
