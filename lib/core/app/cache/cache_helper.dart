import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CacheHelper {
    const CacheHelper(this._prefs);

    final SharedPreferences _prefs;
    static const _accessTokenKey = 'user-access-token';

    Future<bool> cacheAccessToken(String token) async {
        try {
            final result = await _prefs.setString(_accessTokenKey, token);
            return result;
        } catch (_) {
            return false;
        }
    }


    String? getAccessAllToken() {
        final accessToken = _prefs.getString(_accessTokenKey);
        if (accessToken != null ) {
            print(accessToken);
            debugPrint('getSessionToken: access Token exists');
        }   else{
            debugPrint('getSessionToken: access does not exist');
            debugPrint("accessToken2:${accessToken.toString()}");
        }

        return accessToken;
    }


    String? getToken() {
        final accessToken = _prefs.getString(_accessTokenKey);

        if (accessToken != null ) {
            print(accessToken);
            debugPrint('getToken: access Token exists');
        } else {
            debugPrint('getToken: access does not exist');
        }
        return accessToken;
    }

    Future<void> setString(String key, String value) async{
        await _prefs.setString(key, value);
    }

    Future<String?> getString(String key) async{
        final result = _prefs.getString(key);
        return result;
    }

    Future<void> remove(String key)async{
        await _prefs.remove(key);
    }

    Future<void> clean()async{
        await _prefs.clear();
    }


}
