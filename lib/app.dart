import 'package:flutter/material.dart';
import 'package:lotto_mgmt/ui/auth/authentication_screen.dart';
import 'core/constants/helpers.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const AuthenticationScreen(),
      builder: (context, widget) {
        setSizeConfig(context);
        return widget!;
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
