import 'package:flutter/material.dart';
import 'package:lotto_mgmt/core/constants/app_dimensions.dart';
import 'package:lotto_mgmt/core/constants/helpers.dart';
import 'package:lotto_mgmt/ui/widgets/inventory_row.dart';

class TicketInventoryScreen extends StatefulWidget {
  const TicketInventoryScreen({Key? key}) : super(key: key);

  @override
  State<TicketInventoryScreen> createState() => _TicketInventoryScreenState();
}

class _TicketInventoryScreenState extends State<TicketInventoryScreen> {
  // final List<PlutoColumn> columns = [
  //   PlutoColumn(
  //     title: 'Rack',
  //     field: 'rack',
  //     type: PlutoColumnType.number(),
  //     readOnly: true,
  //   ),
  //   PlutoColumn(
  //     title: 'Price',
  //     field: 'price',
  //     type: PlutoColumnType.number(
  //       negative: false,
  //     ),
  //   ),
  //   PlutoColumn(
  //     title: 'Qty',
  //     field: 'qty',
  //     type: PlutoColumnType.number(
  //       negative: false,
  //     ),
  //   ),
  //   PlutoColumn(
  //     title: 'Total',
  //     field: 'total',
  //     readOnly: true,
  //     type: PlutoColumnType.number(
  //       negative: false,
  //     ),
  //   ),
  // ];
  // final List<PlutoRow> firstHalfRows = [];
  // final List<PlutoRow> secondHalfRows = [];
  // int entrySlots = 100;
  //
  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Row(
          children: [
            const Spacer(),
            Expanded(
                child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) {
                      return const Divider(
                        thickness: AppDimensions.sizeTwo,
                      );
                    },
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return InventoryRow(
                        index: index + 1,
                      );
                    })),
            hBox(AppDimensions.sizeTwenty),
            Expanded(
                child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) {
                      return const Divider(
                        thickness: AppDimensions.sizeTwo,
                      );
                    },
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return InventoryRow(
                        index: index + 1,
                      );
                    })),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
