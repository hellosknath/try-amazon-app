import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:try_amazon_app/constants/global_variable.dart';
import 'package:try_amazon_app/provider/user_provider.dart';

class BellowAppBar extends StatelessWidget {
  const BellowAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // gettting user from provider
    final users = Provider.of<UserProvider>(context).user;

    return Container(
      decoration: const BoxDecoration(
        gradient: GlobalVariables.appBarGradient,
      ),
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
              text: 'Hello, ',
              style: const TextStyle(
                fontSize: 22,
                color: Colors.black,
              ),
              children: [
                TextSpan(
                  // taking user name from provider
                  text: users.name,
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
