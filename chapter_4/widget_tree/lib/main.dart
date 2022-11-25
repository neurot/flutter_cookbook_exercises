import 'package:flutter/material.dart';

import 'package:widget_tree/deep_tree.dart';
import 'package:widget_tree/e_commerce_screen_after.dart';
import 'package:widget_tree/flex_screen.dart';
import 'package:widget_tree/profile_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.green,
          appBarTheme: AppBarTheme(
            elevation: 10,
            toolbarTextStyle: const TextTheme(
              headline6: TextStyle(fontSize: 24),
            ).bodyText2,
            titleTextStyle: const TextTheme(
              headline6: TextStyle(fontSize: 24),
            ).headline6,
          )),
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.green,
          appBarTheme: AppBarTheme(
            elevation: 10,
            toolbarTextStyle: const TextTheme(
              headline6: TextStyle(fontSize: 24),
            ).bodyText2,
            titleTextStyle: const TextTheme(
              headline6: TextStyle(fontSize: 24),
            ).headline6,
          )),
      home: const ECommerceScreen(),
      // home: DeepTree(),
      // home: ProfileScreen(),
      // home: FlexScreen(),
    );
  }
}
