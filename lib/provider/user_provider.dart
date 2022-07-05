import 'package:flutter/material.dart';
import 'package:try_amazon_app/model/user.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    id: '',
    name: '',
    email: '',
    password: '',
    address: '',
    type: '',
    token: '',
  );

  User get user => _user;

// Provider is a state management
  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }
}
