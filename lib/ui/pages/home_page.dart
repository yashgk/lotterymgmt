import 'package:flutter/material.dart';
import 'package:lotto_mgmt/ui/pages/report_screen.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/constants/helpers.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedDestIndex = 0;
  PageController contentController = PageController(initialPage: 0);

  List<Widget> contentScreenList = const [
    // LottoReportSummary(),

    // HowToUseScreen(),
    // AboutUsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: AppDimensions.sizeZero,
        backgroundColor: AppColors.primaryColor,
        title: const Text(
          "Lottery Management",
          style: AppTextStyle.largeText,
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: SizedBox(
              width: AppDimensions.sizeHundred,
              child: Row(
                children: [
                  const Text(
                    "Jon",
                    style: AppTextStyle.mediumText,
                  ),
                  hBox(AppDimensions.sizeFive),
                  const Icon(Icons.account_circle_outlined),
                ],
              ),
            ),
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                //log out user
              },
              child: const Text("Log Out"),
            ),
          ),
          hBox(AppDimensions.sizeFifteen)
        ],
      ),
      body: const ReportScreen(),
    );
  }
}
