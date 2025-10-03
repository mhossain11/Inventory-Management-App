

import 'package:inventoryapp/core/enums/typedefs.dart';
import 'package:inventoryapp/features/home/domain/models/store_model.dart';

abstract class HomeRepo{

 ResultFuture<void>storeCreate({
   required String name,
   required String description,
   required String address,
   required String image,
});
}