import 'package:flutter/material.dart';
import 'package:goals/utils/constants.dart';
import 'package:intl/intl.dart';
import '../../model/Goal.dart';

class GoalDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Goal goal = ModalRoute.of(context).settings.arguments as Goal;

    double _differenceDay() {
      int totalDay = goal.deadline.difference(goal.create).inDays;
      int currentDay = goal.create.difference(DateTime.now()).inDays;
      return (currentDay * 100) / totalDay / 100;
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Objetivo',
          style: TextStyle(
            color: kPrimaryColor,
            fontWeight: FontWeight.w400,
            fontSize: 18,
          ),
        ),
        elevation: 0,
        backgroundColor: kBackgroundColor,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back),
          color: Color(0xFF090909),
        ),
      ),
      body: LayoutBuilder(builder: (ctx, constraints) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.network(
                  goal.image,
                  fit: BoxFit.cover,
                  height: 175,
                  width: double.infinity,
                ),
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    goal.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: kTextColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    'Prazo: ${DateFormat('dd/MM/yyyy').format(goal.deadline)}',
                    style: TextStyle(
                      color: kTextLightColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
              SizedBox(height: 36),
              Text(
                goal.description,
                overflow: TextOverflow.clip,
                softWrap: true,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: kTextLightColor,
                  fontSize: 14,
                ),
              ),
              Spacer(),
              Spacer(),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 4),
                    width: constraints.maxWidth,
                    alignment: Alignment.centerRight,
                    child: Text(
                      "${goal.create.difference(DateTime.now()).inDays.toString()}/${goal.deadline.difference(goal.create).inDays.toString()}",
                      style: TextStyle(color: Color(0xFF868B90)),
                    ),
                  ),
                  Container(
                    height: 12,
                    width: constraints.maxWidth,
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
              SizedBox(height: 16),
              FlatButton(
                minWidth: double.infinity,
                color: kPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                height: 50,
                onPressed: () {},
                child: Text(
                  'Concluido',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        );
      }),
    );
  }
}
