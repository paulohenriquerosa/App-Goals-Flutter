import 'package:flutter/material.dart';
import 'package:goals/utils/constants.dart';
import './components/body.dart';

class SelectImageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Selecionar imagem',
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
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {},
            color: Color(0xFF090909),
          ),
        ],
      ),
      body: Body(),
    );
  }
}
