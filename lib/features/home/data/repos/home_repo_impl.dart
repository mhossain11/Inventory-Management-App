
import 'package:dartz/dartz.dart';
import 'package:inventoryapp/core/enums/typedefs.dart';
import 'package:inventoryapp/core/error/failures.dart';
import 'package:inventoryapp/features/home/data/datasources/home_remote_data_src.dart';
import 'package:inventoryapp/features/home/domain/models/store_model.dart';
import 'package:inventoryapp/features/home/domain/repos/home_repo.dart';

import '../../../../core/error/exceptions.dart';

class HomeRepoImpl implements HomeRepo{
  HomeRepoImpl(this.homeRemoteDataSrc);

  HomeRemoteDataSrc homeRemoteDataSrc;

  @override
  ResultFuture<void> storeCreate({
    required String name,
    required String description,
    required String address,
    required String image}) async{

    try{
      await homeRemoteDataSrc.storeCreate(
        name: name,
        description: description,
        address: address,
        image: image,
      );
      return const Right(null);
    }on ServerException catch(e){
      return Left(ServerFailure.fromException(e));
    }

  }


}