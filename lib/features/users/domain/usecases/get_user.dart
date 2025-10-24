import 'package:clean_arch/core/params/params.dart';
import 'package:clean_arch/features/users/domain/repositories/user_repository.dart';
import '../../../../core/connections/result.dart';
import '../../data/models/user_model.dart';

class GetUser {
  final UserRepository repository;
  GetUser({required this.repository});

  Future<Result<UserModel>> call({
    required UserParams params,
  }) {
    return repository.getUsers(params: params);
  }
}
