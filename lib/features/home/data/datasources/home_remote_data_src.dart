import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:inventoryapp/core/utils/constants/network_constants.dart';
import 'package:inventoryapp/features/home/domain/models/store_model.dart';

import '../../../../core/app/cache/prefs_helper.dart';
import '../../../../core/app/cache/prefs_key.dart';
import '../../../../core/di_inject/injection_container.main.dart';
import '../../../../core/error/error_response.dart';
import '../../../../core/error/exceptions.dart';

abstract class HomeRemoteDataSrc{

  Future<List<StoreModel>>getStoreData();
}



class HomeRemoteDataSrcImp implements HomeRemoteDataSrc{
  HomeRemoteDataSrcImp(this.client);
  final http.Client client;
  @override
  Future<List<StoreModel>> getStoreData() async{


    try{
      final uri = Uri.parse('${NetworkConstants.baseUrl}${NetworkConstants.storeList}');
      final response = await client.get(
          uri,
        headers: NetworkConstants.headers,
      );
        final data = jsonDecode(response.body);

        if(response.statusCode != 200){
          final error = ErrorResponse.fromMap(data);
          ServerException(
              message: error.errorMessage,
              statusCode: response.statusCode);
        }
      final storeList =
      (data as List).map((e) => StoreModel.fromJson(e)).toList();
        sl<PrefsHelper>().setString(PrefsKey.userStoreListLength,storeList.length.toString());
        return data.map((e) => StoreModel.fromJson(e)).toList();

    }on ServerException {
      rethrow;

    }catch(e,s){
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      throw ServerException(message: e.toString(), statusCode: 500);
    }
  }

}