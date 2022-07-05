import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:try_amazon_app/constants/global_variable.dart';
import 'package:try_amazon_app/features/auth/screens/auth_screen.dart';
import 'package:try_amazon_app/provider/user_provider.dart';
import 'package:try_amazon_app/router.dart';

void main() {
  // using provider . User provider contains user informations
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Try Amazon App',
      theme: ThemeData(
        // calling apps background color from globalVariable class
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        // changing app bar background color
        colorScheme: const ColorScheme.light(
          primary: GlobalVariables.secondaryColor,
        ),
        appBarTheme: const AppBarTheme(
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.black,
            )),
      ),
      // calling router class for moving page
      onGenerateRoute: (setttings) => generateRoute(setttings),
      home: const AuthScreen(),
    );
  }
}
