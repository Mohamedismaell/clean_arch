import 'package:clean_arch/core/database/api/api_consumer.dart';
import 'package:clean_arch/core/database/api/end_points.dart';
import 'package:clean_arch/core/params/params.dart';
import 'package:clean_arch/features/users/data/models/user_model.dart';

class UserRemoteDataSource {
  final ApiConsumer api;

  UserRemoteDataSource({required this.api});
  Future<UserModel> getUsers(UserParams params) async {
    final response = await api.get(
      '${EndPoints.users}/${params.id}',
    );
    return UserModel.fromJson(response);
  }
}
