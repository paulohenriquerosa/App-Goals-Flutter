import 'package:flutter/material.dart';
import 'package:goals/model/Goal.dart';
import 'goal_item.dart';

class GoalList extends StatelessWidget {
  final List<Goal> goals;

  GoalList(this.goals);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: goals.length,
      itemBuilder: (ctx, index) {
        return GoalItem(goals[index]);
      },
    );
  }
}
