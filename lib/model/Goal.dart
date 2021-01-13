import 'package:flutter/material.dart';

class Goal {
  final String id;
  final String title;
  final String image;
  final String description;
  final bool completed;
  final DateTime create;
  final DateTime deadline;

  Goal({
    @required this.id,
    @required this.image,
    @required this.title,
    @required this.deadline,
    @required this.description,
    @required this.completed,
    @required this.create,
  });
}
