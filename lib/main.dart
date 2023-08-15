import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'app.dart';

void main() async {
  final HttpLink httpLink = HttpLink(
    // 'http://127.0.0.1:4000/graphql',
    'https://grafbaseapi-master-yashgk.grafbase.app/graphql',
  );

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(),
    ),
  );

  runApp(MyApp(
    client: client,
  ));
}
