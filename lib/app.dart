import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotto_mgmt/core/controller/auth_controller.dart';
import 'package:lotto_mgmt/ui/auth/authentication_screen.dart';
import 'package:lotto_mgmt/ui/pages/landing_page.dart';
import 'core/constants/helpers.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final BeamerDelegate _routerDelegate = BeamerDelegate(
    initialPath: '/auth',
    guards: [
      BeamGuard(
        pathPatterns: ['/dashboard'],
        replaceCurrentStack: true,
        check: (context, location) {
          AuthController authController = Get.find();
          return authController.isAuthenticated;
        },
        beamToNamed: (origin, target) => '/auth',
      ),
    ],
    setBrowserTabTitle: false,
    locationBuilder: RoutesLocationBuilder(
      routes: {
        '/auth': (context, state, data) => const AuthenticationScreen(),
        '/dashboard': (context, state, data) => const LandingPage(),
      },
    ),
  );

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      routerDelegate: _routerDelegate,
      routeInformationParser: BeamerParser(),
      builder: (context, widget) {
        setSizeConfig(context);
        Get.put(AuthController());
        return widget!;
        // return FutureBuilder<bool>(
        //   future: checkIfUserLoggedIn(),
        //   builder: (context, snapshot) {
        //     if (snapshot.hasError) {
        //       print(snapshot.data);
        //       return const Center(
        //         child: Text("Error occured"),
        //       );
        //     }

        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return const Center(
        //         child: CircularProgressIndicator(),
        //       );
        //     }

        //     return widget!;
        //   },
        // );
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
