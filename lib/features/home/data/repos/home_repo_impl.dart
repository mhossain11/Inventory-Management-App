
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
  ResultFuture<List<StoreModel>> getStoreData() async{

    try{
      final result = await homeRemoteDataSrc.getStoreData();
      return Right(result);

    }on ServerException catch(e){
      return Left(ServerFailure.fromException(e));

    }

  }

}