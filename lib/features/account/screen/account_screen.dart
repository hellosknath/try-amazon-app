import 'package:flutter/material.dart';
import 'package:try_amazon_app/constants/global_variable.dart';
import 'package:try_amazon_app/features/account/widget/bellow_app_bar.dart';
import 'package:try_amazon_app/features/account/widget/top_button.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            // adding gradient colors
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: GlobalVariables.appBarGradient,
              ),
            ),
            // adding amazon icon
            title: Row(
              // two container of children set letf corner and right
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    'assets/images/amazon_in.png',
                    width: 120.0,
                    height: 45.0,
                    color: Colors.black,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: Icon(
                          Icons.notifications_outlined,
                        ),
                      ),
                      Icon(
                        Icons.search,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
      body: Column(
        children: const [
          // calling others widget
          BellowAppBar(),
          TopButton(), 
        ],
      ),
    );
  }
}
