import 'package:flutter/material.dart';
import 'package:goals/utils/constants.dart';

class CircleProgress extends StatelessWidget {
  final double sizeCircle = 160;

  final int totalGoals;
  final int completedGoals;

  const CircleProgress(this.totalGoals, this.completedGoals);

  double percentage() {
    if (totalGoals == 0) return 0;
    return ((100 * completedGoals) / totalGoals / 100);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: sizeCircle,
        height: sizeCircle,
        child: Stack(
          children: [
            ShaderMask(
              shaderCallback: (rect) {
                return SweepGradient(
                  startAngle: 0.0,
                  endAngle: 3.14 * 2,
                  stops: [percentage(), percentage()],
                  center: Alignment.center,
                  colors: [kPrimaryColor, Colors.grey.withAlpha(50)],
                ).createShader(rect);
              },
              child: Container(
                width: sizeCircle,
                height: sizeCircle,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Center(
              child: Container(
                alignment: Alignment.center,
                width: sizeCircle - 25,
                height: sizeCircle - 25,
                decoration: BoxDecoration(
                  color: kBackgroundColor,
                  shape: BoxShape.circle,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Total de objetivos',
                      style: TextStyle(
                        color: Color(0xFF797E88),
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      '$completedGoals/$totalGoals',
                      style: TextStyle(
                        color: Color(0xFF090909),
                        fontSize: 28,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
