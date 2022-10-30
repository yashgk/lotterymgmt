import 'package:flutter/material.dart';
import 'package:lotto_mgmt/ui/widgets/lotto_ticket_inventory.dart';

class LottoBookScreen extends StatefulWidget {
  const LottoBookScreen({super.key});

  @override
  State<LottoBookScreen> createState() => _LottoBookScreenState();
}

class _LottoBookScreenState extends State<LottoBookScreen> {
  bool isBookReport = false;
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => const TicketInventoryScreen(),
        );
      },
    );
  }
}
