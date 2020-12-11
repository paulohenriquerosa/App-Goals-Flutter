import 'package:flutter/material.dart';
import 'package:goals/utils/constants.dart';
import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   centerTitle: true,
        //   backgroundColor: kBackgroundColor,
        //   elevation: 0,
        // ),
        body: Body(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.plus_one),
          backgroundColor: kPrimaryColor,
        ),
      ),
    );
  }
}
