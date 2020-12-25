import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Images {
  final String url;
  Images({this.url});

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(url: json['urls']['raw'] as String);
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final String urlImage =
      'https://api.unsplash.com/photos?client_id=AFFCxrX9TAd7X3bMd1lNLpWIv5k4cwzknMfE9pkPuAw';

  List<Images> parseImages(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Image>((json) => Images.fromJson(json)).toList();
  }

  Future<List<Images>> loadImages(http.Client client) async {
    final response = await client.get(urlImage);
    return parseImages((response.body));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          padding: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: Color(0xFFE6E7EC),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  style: TextStyle(
                    color: Color(0xFF333333),
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Pesquisar...',
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
                color: Color(0xFFB1B2B8),
              )
            ],
          ),
        ),
        Expanded(
          child: FutureBuilder<List<Images>>(
            future: loadImages(http.Client()),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              print(snapshot.data);
              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ],
    );
  }
}
