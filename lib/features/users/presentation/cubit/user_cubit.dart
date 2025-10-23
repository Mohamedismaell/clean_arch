import 'package:bloc/bloc.dart';
import 'package:clean_arch/core/params/params.dart';
import 'package:clean_arch/features/users/domain/entities/user_entity.dart';
import 'package:clean_arch/features/users/domain/usecases/get_user.dart';

import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit({required this.getUser}) : super(UserInitial());
  final GetUser getUser;

  Future<void> eitherFailureOrSuccess(int id) async {
    final failureOrSuccess = await getUser.call(
      params: UserParams(id: id.toString()),
    );

    failureOrSuccess.fold(
      (errMessage) => emit(
        UserError(errMessage: errMessage.errMessage),
      ),
      (user) => emit(UserLoaded(user: user)),
    );
  }

  // eitherFailureOrSuccess(int id) async {
  //   final failureOrSuccess = await
  //   GetUser(
  //       repository: UserRepositoryImpl(
  //       remoteDataSource: UserRemoteDataSource(
  //       api: DioConsumer(dio: Dio()),
  //       ),
  //       localDataSource: UserLocalDataSource(
  //         cache: CacheHelper(),
  //       ),
  //       networkInfo: NetworkInfoImpl(
  //         connectionChecker: DataConnectionChecker(),
  //       ),
  //     ),
  //   ).call(params: UserParams(id: id.toString()));
  //   failureOrSuccess.fold(
  //     (errMessage) => emit(
  //       UserError(errMessage: errMessage.errMessage),
  //     ),
  //     (user) => emit(UserLoaded(user: user)),
  //   );
  // }
}
