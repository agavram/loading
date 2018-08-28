import 'package:flutter/material.dart';
import 'package:loading_card/loading_card.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Example Loading'),
        ),
        body: Center(
          // Can be placed alone or in a ListView builder
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return LoadingCard();
              }),
        ),
      ),
    );
  }
}
