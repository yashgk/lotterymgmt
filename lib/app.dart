import 'package:flutter/material.dart';
import 'package:lotto_mgmt/core/constants/shared_prefs.dart';
import 'package:lotto_mgmt/ui/auth/authentication_screen.dart';
import 'package:lotto_mgmt/ui/pages/home_page.dart';
import 'core/constants/helpers.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class MyApp extends StatefulWidget {
  final ValueNotifier<GraphQLClient>? client;
  const MyApp({Key? key, this.client}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool hasToken = false;

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: widget.client,
      child: FutureBuilder<bool>(
          future: getHomeWidget(),
          builder: (context, data) {
            if (data.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return MaterialApp(
              home: data.data! ? const HomePage() : const AuthenticationScreen(),
              builder: (context, widget) {
                setSizeConfig(context);
                return widget!;
              },
              debugShowCheckedModeBanner: false,
            );
          }),
    );
  }

  initialize() async {
    await getHomeWidget();
  }

  Future<bool> getHomeWidget() async {
    try {
      String? token = await SharedPreference.get(SharedPreference.kToken);
      if (token != null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
