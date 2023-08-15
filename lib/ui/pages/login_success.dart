import 'package:flutter/material.dart';

class LoginSuccess extends StatelessWidget {
  const LoginSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: Center(
        child: Text(
          "🎉Welcome, You are ready to add some entries!",
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
