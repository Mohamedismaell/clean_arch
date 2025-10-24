import 'package:clean_arch/core/params/params.dart';
import '../../../../core/connections/result.dart';
import '../../data/models/user_model.dart';

abstract class UserRepository {
  Future<Result<UserModel>> getUsers({
    required UserParams params,
  });
}
