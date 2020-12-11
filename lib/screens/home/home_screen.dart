import 'package:flutter/material.dart';
import 'package:goals/utils/constants.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Goals', style: Theme.of(context).textTheme.headline6),
        centerTitle: true,
        backgroundColor: kBackgroundColor,
        elevation: 0,
      ),
    );
  }
}
