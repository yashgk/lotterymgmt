import 'package:flutter/material.dart';

class TicketInventoryScreen extends StatefulWidget {
  const TicketInventoryScreen({Key? key}) : super(key: key);

  @override
  State<TicketInventoryScreen> createState() => _TicketInventoryScreenState();
}

class _TicketInventoryScreenState extends State<TicketInventoryScreen> {
  int entrySlots = 100;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ListView.builder(
          itemBuilder: (context, index) {
            return Text(index.toString());
          },
          itemCount: 50,
          shrinkWrap: true,
        ),
        ListView.builder(
          itemBuilder: (context, index) {
            return Text(index.toString());
          },
          itemCount: 50,
          shrinkWrap: true,
        ),
      ],
    );
  }
}
