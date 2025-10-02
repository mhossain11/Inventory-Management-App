import 'package:inventoryapp/core/app/cache/prefs_helper.dart';
import 'package:inventoryapp/core/app/cache/prefs_key.dart';

import '../di_inject/injection_container.main.dart';

extension StringExt on String{

  Map<String,String> get toHeaders {

    return{
      'Authorization': 'Bearer $this',
      'Content-Type': 'application/json; charset=UTF-8',
    };
  }



  Map<String, String> get toHeader {
    String? token = sl<PrefsHelper>().getToken();

    
     if (token != null && token.isNotEmpty) {
      return {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      };
    }else{
       return {"Content-Type": "application/json"};
     }

   

  }





}