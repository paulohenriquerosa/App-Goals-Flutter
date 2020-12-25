import 'package:flutter/material.dart';
import './components/body.dart';
import 'package:goals/utils/constants.dart';

class CreateGoalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Criar objetivo',
          style: TextStyle(
            color: kPrimaryColor,
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
        backgroundColor: kBackgroundColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back),
          color: Color(0xFF090909),
        ),
      ),
      resizeToAvoidBottomInset: false,
      // resizeToAvoidBottomPadding: false,
      body: Body(),
    );
  }
}
