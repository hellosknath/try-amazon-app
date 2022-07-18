import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:try_amazon_app/constants/error_handling.dart';
import 'package:try_amazon_app/constants/global_variable.dart';
import 'package:try_amazon_app/constants/utils.dart';
import 'package:try_amazon_app/model/product.dart';
import 'package:try_amazon_app/provider/user_provider.dart';
import 'package:http/http.dart' as http;

class SearchServices {
  Future<List<Product>> fetchSearchProduct({
    required BuildContext context,
    required String searchQuery,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Product> productList = [];
    try {
      http.Response res = await http.get(
        Uri.parse('$uri/api/products/search/$searchQuery'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
      );
      httpErrorHandling(
        response: res,
        context: context,
        onSuccess: (() {
          for (var i = 0; i < jsonDecode(res.body).length; i++) {
            productList.add(
              Product.fromJson(jsonEncode(
                jsonDecode(res.body)[i],
              )),
            );
          }
        }),
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return productList;
  }
}
