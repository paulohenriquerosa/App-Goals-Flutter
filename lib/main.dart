import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/home/home_screen.dart';
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
        statusBarColor: kBackgroundColor,
      ),
    );
    return MaterialApp(
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
      initialRoute: AppRoutes.HOME,
      routes: {
        AppRoutes.HOME: (ctx) => HomeScreen(),
      },
    );
  }
}
