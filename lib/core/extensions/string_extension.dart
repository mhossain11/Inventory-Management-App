import 'package:inventoryapp/core/app/cache/cache_helper.dart';
import '../di_inject/injection_container.main.dart';

extension StringExt on String{

  Map<String,String> get toBearerHeader {

    return{
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "Bearer $this",
    };
  }



  Map<String, String> get toHeader {
    String? token = sl<CacheHelper>().getToken();

    
     if (token != null && token.isNotEmpty) {
      return {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      };
    }else{
       return {"Content-Type": "application/json"};
     }

   

  }





}