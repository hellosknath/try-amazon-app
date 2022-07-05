// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:try_amazon_app/constants/error_handling.dart';
import 'package:try_amazon_app/constants/global_variable.dart';
import 'package:try_amazon_app/constants/utils.dart';
import 'package:try_amazon_app/home/screens/home_screen.dart';
import 'package:try_amazon_app/model/user.dart';
import 'package:http/http.dart' as http;
import 'package:try_amazon_app/provider/user_provider.dart';

class AuthService {
  // sign up user
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      // creating new user for saving db
      User user = User(
        id: '',
        name: name,
        password: password,
        address: '',
        type: '',
        token: '',
        email: email,
      );

      // sending request
      http.Response response = await http.post(Uri.parse('$uri/api/signup'),
          body: user.toJson(),
          headers: <String, String>{
            'content-type': 'application/json; charset=UTF-8',
          });

      // calling error handling func, showing api return status in snackbar
      httpErrorHandling(
        response: response,
        context: context,
        onSuccess: () {
          showSnackBar(
            context,
            'Account Created! Login with the same credentials.',
          );
        },
      );
    } catch (e) {
      showSnackBar(
        context,
        e.toString(),
      );
    }
  }

  // sign in user
  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      // sending request
      http.Response response = await http.post(
          Uri.parse(
            '$uri/api/signin',
          ),
          body: jsonEncode(
            {
              'email': email,
              'password': password,
            },
          ),
          headers: <String, String>{
            'content-type': 'application/json; charset=UTF-8',
          });

      // calling error handling func, showing api return status in snackbar
      httpErrorHandling(
        response: response,
        context: context,
        onSuccess: () async {
          // saving token to sharedpref database
          SharedPreferences prefs = await SharedPreferences.getInstance();
          // set data to provider
          Provider.of<UserProvider>(context, listen: false)
              .setUser(response.body);
          // set token to small db
          await prefs.setString(
            'x-auth-token',
            jsonDecode(response.body)['token'],
          );
          // move user to home screen if token saved
          Navigator.pushNamedAndRemoveUntil(
            context,
            HomeScreen.routeName,
            (route) => false,
          );
        },
      );
    } catch (e) {
      showSnackBar(
        context,
        e.toString(),
      );
    }
  }
}
