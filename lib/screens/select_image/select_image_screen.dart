import 'package:flutter/material.dart';
import 'package:goals/utils/constants.dart';

import 'dart:convert';

import 'package:goals/providers/goal_provider.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class SelectImageScreen extends StatefulWidget {
  @override
  _SelectImageScreenState createState() => _SelectImageScreenState();
}

class _SelectImageScreenState extends State<SelectImageScreen> {
  String urlImage1 =
      'https://api.unsplash.com/photos?client_id=AFFCxrX9TAd7X3bMd1lNLpWIv5k4cwzknMfE9pkPuAw';
  String urlImage2 =
      'https://api.unsplash.com/search/photos?client_id=AFFCxrX9TAd7X3bMd1lNLpWIv5k4cwzknMfE9pkPuAw';

  List<dynamic> _loadedImages = [];
  int _selectedImage;

  Future<void> _loadImages({search = false, value}) async {
    final response = await http
        .get(!search ? urlImage1 : "$urlImage2&query=$value&per_page=20");
    final responseParse = json.decode(response.body);
    if (search) {
      setState(() {
        _loadedImages = responseParse['results'];
      });
    } else {
      setState(() {
        _loadedImages = responseParse;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadImages();
  }

  void _saveImage() {
    if (_selectedImage != null) {
      Provider.of<GoalProvider>(context, listen: false)
          .saveImage(_loadedImages[_selectedImage]['urls']['regular']);
    }
  }

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
            onPressed: () {
              _saveImage();
              Navigator.of(context).pop();
            },
            color: Color(0xFF090909),
          ),
        ],
      ),
      body: Column(
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
                    onSubmitted: (value) async {
                      await _loadImages(value: value, search: true);
                      setState(() {
                        _selectedImage = null;
                      });
                    },
                    textInputAction: TextInputAction.search,
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
          SizedBox(height: 8),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: GridView.builder(
                itemCount: _loadedImages.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 4 / 3,
                  crossAxisCount: 2,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                ),
                itemBuilder: (ctx, i) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        if (_selectedImage != i)
                          _selectedImage = i;
                        else
                          _selectedImage = null;
                      });
                    },
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        GridTile(
                          child: Image.network(
                            _loadedImages[i]['urls']['small'],
                            loadingBuilder: (ctx, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(child: CircularProgressIndicator());
                            },
                            fit: BoxFit.cover,
                          ),
                        ),
                        if (_selectedImage == i)
                          DecoratedBox(
                            child: Center(
                              child: Icon(
                                Icons.check,
                                color: Colors.grey[100],
                                size: 60,
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(0, 0, 0, 0.7),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
