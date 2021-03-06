import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:try_amazon_app/constants/error_handling.dart';
import 'package:try_amazon_app/constants/global_variable.dart';
import 'package:try_amazon_app/constants/utils.dart';
import 'package:try_amazon_app/model/product.dart';
import 'package:try_amazon_app/provider/user_provider.dart';
import 'package:http/http.dart' as http;

class ProductDetailsServices {
  void rateProduct({
    required BuildContext context,
    required Product product,
    required double rating,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      http.Response response = await http.post(
          Uri.parse(
            '$uri/api/rate-product',
          ),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': userProvider.user.token,
          },
          body: jsonEncode(
            {
              'id': product.id!,
              'rating': rating,
            },
          ));

      httpErrorHandling(response: response, context: context, onSuccess: () {});
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
