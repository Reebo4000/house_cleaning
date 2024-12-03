import 'package:flutter/material.dart';

class UserRoleProvider with ChangeNotifier {
  String? _userRole;
  String? get userRole => _userRole;

  String setUserRole(String role) {
    _userRole = role;
    notifyListeners();
    return role;
  }
}
