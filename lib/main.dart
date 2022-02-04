import 'package:flutter/material.dart';

import 'helper/app_colors.dart';
import 'ui/welcome_page/welcome_page.dart';
import 'utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Willow care test',
        theme:
        ThemeData(primaryColor: primaryColor1),
        initialRoute: WelcomePage.route,
        onGenerateRoute: AppRouter.generateRoute,
        debugShowCheckedModeBanner: false
    );
  }
}
