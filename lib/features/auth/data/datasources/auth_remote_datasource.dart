
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import'package:http/http.dart'as http;
import 'package:http/http.dart' as client;
import 'package:inventoryapp/core/app/cache/prefs_helper.dart';
import 'package:inventoryapp/core/extensions/string_extension.dart';
import 'package:inventoryapp/core/utils/constants/network_constants.dart';

import '../../../../core/app/cache/cache_helper.dart';
import '../../../../core/app/cache/prefs_key.dart';
import '../../../../core/di_inject/injection_container.main.dart';
import '../../../../core/enums/typedefs.dart';
import '../../../../core/error/error_response.dart';
import '../../../../core/error/exceptions.dart';
import '../../../home/domain/models/store_model.dart';
abstract class AuthRemoteDataSrc {

 const AuthRemoteDataSrc();

  Future<void>login({
    required String email,
    required String password,
});

 Future<List<StoreModel>>getStoreData();

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
     await sl<PrefsHelper>().setString(PrefsKey.userLoginToken, tokenValue);
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


  @override
  Future<List<StoreModel>> getStoreData() async{


    try{
      final uri = Uri.parse('${NetworkConstants.baseUrl}${NetworkConstants.storeList}');
      final response = await client.get(
        uri,
        headers: sl<PrefsHelper>().getToken()?.toHeaders,
      );
      final data = jsonDecode(response.body);
      print('statusCode:${response.statusCode}');
      if(response.statusCode != 200){
        final error = ErrorResponse.fromMap(data as DataMap);
        ServerException(
            message: error.errorMessage,
            statusCode: response.statusCode);
      }
      final storeList =
      (data as List).map((e) => StoreModel.fromJson(e)).toList();
      sl<PrefsHelper>().setString(PrefsKey.userStoreListLength,storeList.length.toString());
      return storeList;

    }on ServerException {
      rethrow;

    }catch(e,s){
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      throw ServerException(message: e.toString(), statusCode: 500);
    }
  }


}