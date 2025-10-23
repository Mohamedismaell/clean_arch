import 'package:clean_arch/features/users/domain/entities/sub_enities/address_entity.dart';

class UserEntity {
  final String name;
  final String email;
  final String phone;
  final AddressEntity address;
  UserEntity({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
  });
}
