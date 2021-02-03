import 'package:flutter/material.dart';
import 'package:react_link_app/utils/http_utils.dart';
import 'package:react_link_app/utils/models/userprofile.dart';

class UserProvider extends ChangeNotifier {
  UserProfile userProfile;

  Future<UserProfile> init() async {
    userProfile = await HttpUtils.getUserProfile();
    notifyListeners();
    return userProfile;
  }
}
