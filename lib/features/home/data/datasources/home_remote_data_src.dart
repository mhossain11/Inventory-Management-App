import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:inventoryapp/core/enums/typedefs.dart';
import 'package:inventoryapp/core/extensions/string_extension.dart';
import 'package:inventoryapp/core/utils/constants/network_constants.dart';
import 'package:inventoryapp/features/home/domain/models/store_model.dart';

import '../../../../core/app/cache/prefs_helper.dart';
import '../../../../core/app/cache/prefs_key.dart';
import '../../../../core/di_inject/injection_container.main.dart';
import '../../../../core/error/error_response.dart';
import '../../../../core/error/exceptions.dart';

abstract class HomeRemoteDataSrc{
  HomeRemoteDataSrc();
  Future<void>storeCreate({
    required String name,
    required String description,
    required String address,
    required String image,
});

}



class HomeRemoteDataSrcImp implements HomeRemoteDataSrc{
  HomeRemoteDataSrcImp(this.client);
  final http.Client client;

  @override
  Future<void> storeCreate({
    required String name,
    required String description,
    required String address,
    required String image}) async{


    try{
      var uri = Uri.parse('${NetworkConstants.baseUrl}${NetworkConstants.storeCreate}');
      var response =await client.post(uri,
          body: jsonEncode({
            'name':name,
            'description':description,
            'address':address,
            'image':image,
          }),
          headers: sl<PrefsHelper>().getToken()?.toBearerHeader,
          );
      final data = jsonDecode(response.body) as DataMap;

      if(response.statusCode != 200){
        final errorResponse = ErrorResponse.fromMap(data);
        throw ServerException(
            message: errorResponse.errorMessage,
            statusCode: response.statusCode);
      }
    }on ServerException {
      rethrow;
    }catch(e,s){
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      throw ServerException(message: e.toString(), statusCode: 500);

    }
  }



}