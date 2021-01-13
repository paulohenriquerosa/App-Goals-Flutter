import 'dart:math';

import 'package:flutter/material.dart';
import 'package:goals/model/Goal.dart';

class GoalProvider with ChangeNotifier {
  String _image;
  List<Goal> _goals = [];

  String get image => _image;

  List<Goal> get goals => [..._goals];

  void saveImage(String image) {
    _image = image;
    notifyListeners();
  }

  void clear() {
    _image = null;
    notifyListeners();
  }

  void createGoal(String title, String description, DateTime deadline) {
    final goal = Goal(
      deadline: deadline,
      description: description,
      image: _image,
      title: title,
      id: Random().nextDouble().toString(),
    );
    _goals.add(goal);
    notifyListeners();
  }
}
