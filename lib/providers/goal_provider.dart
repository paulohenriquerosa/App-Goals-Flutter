import 'dart:math';

import 'package:flutter/material.dart';
import 'package:goals/model/Goal.dart';

class GoalProvider with ChangeNotifier {
  String _image;
  List<Goal> _goals = [];

  String get image => _image;

  List<Goal> get goals => [..._goals];

  List<Goal> get completedGoals =>
      _goals.where((item) => item.completed == true).toList();
  List<Goal> get progressGoals =>
      _goals.where((item) => item.completed == false).toList();

  int get goalCount {
    return _goals.length;
  }

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
      completed: false,
      create: DateTime.now(),
      description: description,
      image: _image,
      title: title,
      id: Random().nextDouble().toString(),
    );
    _goals.add(goal);
    notifyListeners();
  }

  void completeGoal(String id) {
    final Goal goal = _goals.singleWhere((item) => item.id == id);
    _goals.remove(goal);
    _goals.add(
      Goal(
        id: goal.id,
        image: goal.image,
        title: goal.title,
        deadline: goal.deadline,
        description: goal.description,
        completed: true,
        create: goal.create,
      ),
    );
    notifyListeners();
  }
}
