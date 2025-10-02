

import 'package:flutter/cupertino.dart';
import 'package:inventoryapp/core/app/cache/prefs_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsHelper{
  final SharedPreferences? prefs;
  PrefsHelper(this.prefs);

  Future setString(String key, String value) async{
    await prefs?.setString(key, value);
  }

  Future getString(String key) async{
    return prefs?.getString(key);
  }

  Future remove(String key)async{
    await prefs?.remove(key);
  }

  Future clean()async{
    await prefs?.clear();
  }

  String? getToken() {
    final accessToken = prefs?.getString(PrefsKey.userLoginToken);

    if (accessToken != null ) {
      print(accessToken);
      debugPrint('getToken: access Token exists');
    } else {
      debugPrint('getToken: access does not exist');
    }
    return accessToken;
  }

}