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


}



class HomeRemoteDataSrcImp implements HomeRemoteDataSrc{
  HomeRemoteDataSrcImp(this.client);
  final http.Client client;


}