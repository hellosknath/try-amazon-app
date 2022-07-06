import 'package:flutter/material.dart';

class AccountButton extends StatelessWidget {
  final String btnName;
  final VoidCallback onTap;
  const AccountButton({
    Key? key,
    required this.btnName,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // use expanded widget for match parent or full width
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 0.0),
          borderRadius: BorderRadius.circular(50),
          color: Colors.white,
        ),
        child: OutlinedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.black12.withOpacity(0.03),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          onPressed: onTap,
          child: Text(
            btnName,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
