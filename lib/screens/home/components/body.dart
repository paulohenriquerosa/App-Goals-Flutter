import 'package:flutter/material.dart';
import 'package:goals/providers/goal_provider.dart';
import 'package:goals/utils/constants.dart';
import 'package:provider/provider.dart';
import 'circle_progress.dart';
import 'goals_list.dart';
import '../../../model/Goal.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool _progressList = true;

  @override
  Widget build(BuildContext context) {
    List<Goal> goals = Provider.of<GoalProvider>(context).goals;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: 32),
          CircleProgress(0.5),
          SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Suas metas',
                style: TextStyle(
                  color: Color(0xFF333333),
                  fontWeight: FontWeight.w800,
                  fontSize: 14,
                ),
              ),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _progressList = true;
                        });
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Progresso',
                            style: TextStyle(
                              color: Color(
                                  _progressList ? 0xFF333333 : 0xFFD0D1D6),
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                          ),
                          if (_progressList)
                            Container(
                              margin: EdgeInsets.only(top: 4),
                              height: 6,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: kPrimaryColor,
                              ),
                            ),
                        ],
                      ),
                    ),
                    SizedBox(width: 16),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _progressList = false;
                        });
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Completas',
                            style: TextStyle(
                              color: Color(
                                  _progressList ? 0xFFD0D1D6 : 0xFF333333),
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                          ),
                          if (!_progressList)
                            Container(
                              margin: EdgeInsets.only(top: 4),
                              height: 6,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: kPrimaryColor,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 6),
          Expanded(
            child: GoalList(_progressList ? goals : goals),
          ),
        ],
      ),
    );
  }
}
