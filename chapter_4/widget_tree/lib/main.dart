import 'package:flutter/material.dart';
import 'package:widget_tree/profile_screen.dart';

import 'flex_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // home: ProfileScreen(),
      home: FlexScreen(),
    );
  }
}
