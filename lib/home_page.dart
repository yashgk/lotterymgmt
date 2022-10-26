import 'package:flutter/material.dart';
import 'package:lotto_mgmt/core/constants/app_colors.dart';
import 'package:lotto_mgmt/core/constants/app_dimensions.dart';
import 'package:lotto_mgmt/core/constants/app_text_styles.dart';
import 'package:lotto_mgmt/core/constants/helpers.dart';
import 'package:lotto_mgmt/ui/about_contact_us_screen.dart';
import 'package:lotto_mgmt/ui/dashboard_screen.dart';
import 'package:lotto_mgmt/ui/how_to_use_screen.dart';
import 'package:lotto_mgmt/ui/lotto_ticket_inventory.dart';
import 'package:lotto_mgmt/ui/report_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedDestIndex = 0;
  PageController contentController = PageController(initialPage: 0);

  List<Widget> contentScreenList = const [
    DashboardScreen(),
    TicketInventoryScreen(),
    ReportScreen(),
    HowToUseScreen(),
    AboutUsScreen(),
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
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavigationRail(
              destinations: const [
                NavigationRailDestination(
                    icon: Icon(Icons.dashboard_outlined),
                    label: Text(
                      "Dashboard",
                    )),
                NavigationRailDestination(
                    icon: Icon(Icons.book_outlined),
                    label: Text(
                      "Lotto Book",
                    )),
                NavigationRailDestination(
                    icon: Icon(Icons.summarize_outlined),
                    label: Text(
                      "Reports",
                    )),
                NavigationRailDestination(
                    icon: Icon(Icons.help_center_outlined),
                    label: Text(
                      "How to Use",
                    )),
                NavigationRailDestination(
                    icon: Icon(Icons.info_outline),
                    label: Text(
                      "About Us",
                    )),
              ],
              selectedIndex: selectedDestIndex,
              onDestinationSelected: changeDestIndex,
              labelType: NavigationRailLabelType.all,
              selectedLabelTextStyle: AppTextStyle.mediumText
                  .copyWith(color: AppColors.primaryColor),
              elevation: AppDimensions.sizeFive,
              // extended: extendNavRail,
              // minExtendedWidth: 200,
              // leading: GestureDetector(
              //   onTap: () {
              //     setState(() {
              //       extendNavRail = !extendNavRail;
              //     });
              //   },
              //   child: Container(
              //     decoration: const BoxDecoration(
              //         color: AppColors.primaryColor, shape: BoxShape.circle),
              //     padding: const EdgeInsets.all(AppDimensions.sizeFive),
              //     child: Icon(
              //       extendNavRail
              //           ? Icons.arrow_back_ios_new_outlined
              //           : Icons.arrow_forward_ios_outlined,
              //       color: AppColors.whiteColor,
              //       size: AppDimensions.sizeTen,
              //     ),
              //   ),
              // ),
            ),
            Container(
                height: size!.height,
                width: size!.width - 100,
                padding: const EdgeInsets.all(AppDimensions.sizeTen),
                alignment: Alignment.center,
                child: contentScreenList[selectedDestIndex]),
          ],
        ));
  }

  void changeDestIndex(int index) {
    setState(() {
      selectedDestIndex = index;
    });
  }
}
