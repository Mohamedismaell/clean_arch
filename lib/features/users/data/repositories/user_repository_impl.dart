import 'package:clean_arch/core/connections/network_info.dart';
import 'package:clean_arch/core/errors/exceptions.dart';
import 'package:clean_arch/core/errors/failure.dart';
import 'package:clean_arch/core/params/params.dart';
import 'package:clean_arch/features/users/data/datascource/user_local_data_source.dart';
import 'package:clean_arch/features/users/data/datascource/user_remote_data_source.dart';
import 'package:clean_arch/features/users/domain/entities/user_entity.dart';
import 'package:clean_arch/features/users/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class UserRepositoryImpl extends UserRepository {
  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  UserRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, UserEntity>> getUsers({
    required UserParams params,
  }) async {
    if (await networkInfo.isConnected!) {
      try {
        final usermodel = await remoteDataSource.getUsers(
          params,
        );
        localDataSource.cacheUser(usermodel);
        return Right(usermodel);
      } on ServerExceptions catch (e) {
        return Left(
          Failure(errMessage: e.errorModel.errorMessage),
        );
      }
    } else {
      try {
        final localUser = await localDataSource.getUser();
        return Right(localUser);
      } on CacheException catch (e) {
        return Left(Failure(errMessage: e.errorMessage));
      }
    }
  }
}
