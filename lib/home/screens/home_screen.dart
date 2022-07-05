import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:try_amazon_app/provider/user_provider.dart';

class HomeScreen extends StatefulWidget {
  // route name
  static const String routeName = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // getting saved user data from provider
    final user = Provider.of<UserProvider>(context).user;

    return Scaffold(
      body: Center(
        child: Text(
          user.toJson(),
          style: const TextStyle(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
