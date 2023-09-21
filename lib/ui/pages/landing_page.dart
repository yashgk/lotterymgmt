import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:lotto_mgmt/core/prefs/pref_utils.dart';
import 'package:lotto_mgmt/ui/pages/about_us_page.dart';
import 'package:lotto_mgmt/ui/pages/home_page.dart';
import 'package:lotto_mgmt/ui/pages/how_to_use_page.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/constants/helpers.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int selectedTab = 0;

  List<Widget> pages = const [HomePage(), HowToUsePage(), AboutUsPage()];

  onTabChange(int index) {
    if (index != selectedTab) {
      setState(() {
        selectedTab = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: AppDimensions.sizeZero,
        backgroundColor: AppColors.primaryColor,
        title: const Text(
          "Management",
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
              onTap: () async {
                bool isLoggedOut = await PrefUtils.clearAll();
                if (isLoggedOut) {
                  goToAuth();
                }
              },
              child: const Text("Log Out"),
            ),
          ),
          hBox(AppDimensions.sizeFifteen)
        ],
      ),
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: selectedTab,
            onDestinationSelected: (index) => onTabChange(index),
            labelType: NavigationRailLabelType.all,
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                label: Text('Home'),
                icon: Icon(Icons.home),
              ),
              NavigationRailDestination(
                label: Text('How to Use'),
                icon: Icon(Icons.integration_instructions),
              ),
              NavigationRailDestination(
                label: Text('About Us'),
                icon: Icon(Icons.info),
              ),
            ],
          ),
          Expanded(
            child: pages[selectedTab],
          ),
        ],
      ),
    );
  }

  void goToAuth() {
    print('going to auth');
    context.beamToNamed('/auth');

    // Navigator.pushAndRemoveUntil(
    //     context,
    //     MaterialPageRoute(builder: (context) => const AuthenticationScreen()),
    //     (route) => false);
  }
}
