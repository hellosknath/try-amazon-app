import 'dart:io';

import 'package:flutter/material.dart';
import 'package:try_amazon_app/constants/utils.dart';

class AdminServices {
  void sellProduct({
    required BuildContext context,
    required String name,
    required String description,
    required double price,
    required double quantity,
    required String category,
    required List<File> imagaes,
  }) {
    try {} catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
