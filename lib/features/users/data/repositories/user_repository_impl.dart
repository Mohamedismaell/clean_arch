import 'package:clean_arch/core/connections/network_info.dart';
import 'package:clean_arch/core/connections/result.dart';
import 'package:clean_arch/core/errors/exceptions.dart';
import 'package:clean_arch/core/errors/failure.dart';
import 'package:clean_arch/core/params/params.dart';
import 'package:clean_arch/features/users/data/datascource/user_local_data_source.dart';
import 'package:clean_arch/features/users/data/datascource/user_remote_data_source.dart';
import 'package:clean_arch/features/users/data/models/user_model.dart';
import 'package:clean_arch/features/users/domain/repositories/user_repository.dart';

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
  Future<Result<UserModel>> getUsers({
    required UserParams params,
  }) async {
    if (await networkInfo.isConnected!) {
      try {
        final usermodel = await remoteDataSource.getUsers(
          params,
        );
        localDataSource.cacheUser(usermodel);
        // return Right(usermodel);
        return Result.ok(usermodel);
      } on ServerExceptions catch (e) {
        // return Left(
        //   ,
        // );
        return Result.error(
          Failure(errMessage: e.errorModel.errorMessage),
        );
      }
    } else {
      try {
        final localUser = await localDataSource.getUser();
        return Result.ok(localUser);
      } on CacheException catch (e) {
        return Result.error(
          Failure(errMessage: e.errorMessage),
        );
      }
    }
  }
}
