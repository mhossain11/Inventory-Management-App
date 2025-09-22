
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import'package:http/http.dart'as http;
import 'package:inventoryapp/core/utils/constants/network_constants.dart';

import '../../../../core/app/cache/cache_helper.dart';
import '../../../../core/di_inject/injection_container.main.dart';
import '../../../../core/extensions/error_reponse.dart';
import '../../../../core/extensions/exceptions.dart';
abstract class AuthRemoteDataSrc {

 const AuthRemoteDataSrc();

  Future<void>login({
    required String email,
    required String password,
});

/*  Future<void>register ({
    required String email,
    required String password,
  });*/
}

class AuthRemoteDataSrcImp implements AuthRemoteDataSrc{

  const AuthRemoteDataSrcImp(this._client);

  final http.Client _client;


  @override
  Future<void> login({required String email, required String password}) async{
   try{
     final uri = Uri.parse('${NetworkConstants.baseUrl}${NetworkConstants.login}');
     final response =await _client.post(uri,body: jsonEncode({
       'email':email,
       'password':password,
     }),
     headers: NetworkConstants.headers,
     );

     final payload = jsonDecode(response.body);

     if(response.statusCode != 200 ){
       final errorResponse = ErrorResponse.fromMap(payload);
       throw ServerException(
           message: errorResponse.errorMessage,
           statusCode: response.statusCode);
     }
     final tokenValue = payload['access'];
     await sl<CacheHelper>().cacheAccessToken(tokenValue);
   }on ServerException {
     rethrow;
   }catch(e,s){
     debugPrint(e.toString());
     debugPrintStack(stackTrace: s);
     throw ServerException(message: e.toString(), statusCode: 500);

   }


  }

/*  @override
  Future<void> register({required String email, required String password}) {
    // TODO: implement register
    throw UnimplementedError();
  }*/


}