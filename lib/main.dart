import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goals/providers/goal_provider.dart';
import 'package:provider/provider.dart';
import 'screens/home/home_screen.dart';
import 'screens/goal_detail/goal_detail_screen.dart';
import 'screens/create_goal/create_goal_screen.dart';
import 'screens/select_image/select_image_screen.dart';
import 'utils/constants.dart';
import 'utils/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: kPrimaryColor,
        statusBarColor: kPrimaryColor,
        statusBarBrightness: Brightness.dark,
      ),
    );
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: ChangeNotifierProvider(
        create: (ctx) => GoalProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Goals',
          theme: ThemeData(
            canvasColor: kBackgroundColor,
            textTheme: ThemeData.dark().textTheme.copyWith(
                  headline6: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          routes: {
            AppRoutes.HOME: (ctx) => HomeScreen(),
            AppRoutes.GOAL_DETAIL: (ctx) => GoalDetailScreen(),
            AppRoutes.CREATE_GOAL: (ctx) => CreateGoalScreen(),
            AppRoutes.SELECT_IMAGE: (ctx) => SelectImageScreen(),
          },
        ),
      ),
    );
  }
}
