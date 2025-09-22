


import 'package:dartz/dartz.dart';

import '../extensions/failures.dart';

typedef DataMap = Map<String, dynamic>;
typedef ResultFuture<T> = Future<Either<Failure, T>>;
