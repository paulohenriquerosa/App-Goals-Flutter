import 'package:flutter/material.dart';
import 'package:goals/utils/constants.dart';
import '../../../model/Goal.dart';
import '../../../utils/app_routes.dart';

class GoalItem extends StatelessWidget {
  final Goal goal;

  GoalItem(this.goal);

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
              height: 112,
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
                      horizontal: 16,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        goal.image,
                        height: 80,
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
                            '16 dias',
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
                              '32/145',
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
                                  widthFactor: .5,
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
