import 'package:flutter/material.dart';
import '../../core/constants/constants.dart';
import 'header_builder.dart';

class LottoBookEntryHeader extends StatelessWidget {
  const LottoBookEntryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.symmetric(vertical: AppDimensions.sizeTen),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:  [
          HeaderBuilder(title: "ACTION",),
          HeaderBuilder(title: "DATE",),
          HeaderBuilder(title: "YTD'S INV.",),
          HeaderBuilder(title: "TODAY BOOK",),
          HeaderBuilder(title: "TODAY'S INV.",),
          HeaderBuilder(title: "INSTANT SALES",),
          HeaderBuilder(title: "VALIDATION",),
          HeaderBuilder(title: "INSTANT CASH",),
          HeaderBuilder(title: "LOTTO CASH",),
          HeaderBuilder(title: "TOTAL CASH",),
          HeaderBuilder(title: "CASH ON HAND",),
          HeaderBuilder(title: "CASH FROM MACHINE",),
          HeaderBuilder(title: "BANK DEPOSITE",),
          HeaderBuilder(title: "CLOSING BALANCE",),
          
        ],
      ),
    );
  }
}


