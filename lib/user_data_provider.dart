import 'package:fancardplus/user_data.dart';
import 'package:flutter/foundation.dart';

class UserDataProvider extends ChangeNotifier {
  UserData? _userData;

  UserData? get userData => _userData;

  void updateUserData({
    String? newPhoneNumber,
    String? newEmail,
  }) {
    if (_userData == null) {
      return;
    }

    if (newPhoneNumber != null) {
      _userData!.phoneNumber = newPhoneNumber;
    }

    if (newEmail != null) {
      _userData!.email = newEmail;
    }

    notifyListeners();
  }
}
