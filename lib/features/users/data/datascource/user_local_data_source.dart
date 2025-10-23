import 'dart:convert';
import 'package:clean_arch/core/database/cache/cache_helper.dart';
import 'package:clean_arch/core/errors/exceptions.dart';
import 'package:clean_arch/features/users/data/models/user_model.dart';

class UserLocalDataSource {
  final CacheHelper cache;
  UserLocalDataSource({required this.cache});
  cacheUser(UserModel? userModel) {
    if (userModel != null) {
      cache.saveData(
        key: 'CacheUser',
        value: json.encode(userModel.toJson()),
      );
    } else {
      throw CacheException(errorMessage: 'No Cached Data');
    }
  }

  Future<UserModel> getUser() {
    final data = cache.getDataString(key: 'CacheUser');
    if (data != null) {
      return Future.value(
        UserModel.fromJson(json.decode(data)),
      );
    } else {
      throw CacheException(errorMessage: 'No Cached Data');
    }
  }
}
