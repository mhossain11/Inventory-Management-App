

import '../../../../core/enums/typedefs.dart';
import '../../../home/domain/models/store_model.dart';

abstract class AuthRepo{
/*
  ResultFuture<void> register({
    required String firstname,
    required String lastname,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,

});*/

  ResultFuture<void> login({
    required String email,
    required String password,
});

  ResultFuture<List<StoreModel>> getStoreData();

}