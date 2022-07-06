import 'package:flutter/material.dart';
import 'package:try_amazon_app/features/account/widget/account_button.dart';

class TopButton extends StatelessWidget {
  const TopButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButton(
              btnName: 'Your Orders',
              onTap: () {},
            ),
            AccountButton(
              btnName: 'Turn Sellers',
              onTap: () {},
            ),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            AccountButton(
              btnName: 'Logout',
              onTap: () {},
            ),
            AccountButton(
              btnName: 'Your Wish List',
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}
