import 'package:flutter/material.dart';
import '../../core/constants/constants.dart';
import 'header_builder.dart';

class InventoryEntryHeader extends StatelessWidget {
  const InventoryEntryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.symmetric(vertical: AppDimensions.sizeTen),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:  [
          HeaderBuilder(
            title: "RACK",
          ),
          HeaderBuilder(
            title: "PRICE",
          ),
          HeaderBuilder(
            title: "QTY",
          ),
          HeaderBuilder(
            title: "TOTAL",
          ),
        ],
      ),
    );
  }
}
