import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:weeding_planner/models/user.dart';

class SharedPrefs {
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  Future<dynamic> getUserData() async {
    final sharedPreferences = await prefs;
    User user = User.fromJSON(jsonDecode(sharedPreferences.getString('user')));

    return user;
  }

  Future setUserData(User user) async {
    final sharedPreferences = await prefs;

    sharedPreferences.setString('user', jsonEncode(user.toJSON()));
  }

  Future clear() async {}
}
