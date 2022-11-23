import 'package:flutter/material.dart';
import 'package:flutter_layout/immutable_widget.dart';
import 'package:flutter_layout/text_layout.dart';

class BasicScreen extends StatelessWidget {
  const BasicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text('Welcome to Flutter'),
        actions: const <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(Icons.edit),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            ImmutableWidget(),
            TextLayout(),
          ],
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.lightBlue,
          child: const Center(
            child: Text("I'm a Drawer!"),
          ),
        ),
      ),
    );
  }
}
