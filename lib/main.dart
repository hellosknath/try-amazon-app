import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:try_amazon_app/common/widget/bottom_bar.dart';
import 'package:try_amazon_app/constants/global_variable.dart';
import 'package:try_amazon_app/features/auth/screens/auth_screen.dart';
import 'package:try_amazon_app/features/auth/services/auth_service.dart';
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

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    // getting user data from provider
    authService.getUserData(context);
  }

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
      // checking token. if token is exist then move home screen, otherwise authScreen
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? const BottomBar()
          : const AuthScreen(),
    );
  }
}
