import 'package:flutter/material.dart';

import 'core/constants/helpers.dart';
import 'home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      // AuthenticationScreen(),
      builder: (context, widget) {
        setSizeConfig(context);
        return widget!;
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
