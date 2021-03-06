import 'package:flutter/material.dart';
import 'package:goals/utils/constants.dart';
import '../../../model/Goal.dart';
import '../../../utils/app_routes.dart';

class GoalItem extends StatelessWidget {
  final Goal goal;

  GoalItem(this.goal);

  double _differenceDay() {
    int totalDay = goal.deadline.difference(goal.create).inDays;
    int currentDay = DateTime.now().difference(goal.create).inDays;

    return (currentDay * 100) / totalDay / 100;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8,
      ),
      child: LayoutBuilder(
        builder: (ctx, constraints) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                AppRoutes.GOAL_DETAIL,
                arguments: goal,
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Color(0xFFF0F1FC),
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        goal.image,
                        height: 80,
                        width: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        goal.title,
                        style: TextStyle(
                          color: kTextColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: [
                          Text(
                            'Falta: ',
                            style: TextStyle(
                              color: Color(0xFF868B90),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "${goal.deadline.difference(DateTime.now()).inDays.toString()} dias",
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 6),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 4),
                            width: constraints.maxWidth * 0.65,
                            alignment: Alignment.centerRight,
                            child: Text(
                              "${goal.create.difference(DateTime.now()).inDays.toString()}/${goal.deadline.difference(goal.create).inDays.toString()}",
                              style: TextStyle(color: Color(0xFF868B90)),
                            ),
                          ),
                          Container(
                            height: 10,
                            width: constraints.maxWidth * 0.65,
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withAlpha(55),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                FractionallySizedBox(
                                  widthFactor: _differenceDay(),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: kPrimaryColor,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
