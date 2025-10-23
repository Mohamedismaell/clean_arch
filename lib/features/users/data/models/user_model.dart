import 'package:clean_arch/features/users/data/models/sub_models/address_model.dart';
import 'package:clean_arch/features/users/data/models/sub_models/company_model.dart';
import 'package:clean_arch/features/users/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  final int id;
  final String username;
  final String website;
  final CompanyModel company;

  UserModel(
    this.id,
    this.username,
    this.website,
    this.company, {
    required super.name,
    required super.email,
    required super.phone,
    required super.address,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      json['id'],
      json['username'],
      json['website'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      CompanyModel.fromJson(json['company']),
      address: AddressModel.fromJson(json['address']),
    );
  }
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'phone': phone,
      'website': website,
      'address': (address as AddressModel).toJson(),
      'company': company.toJson(),
    };
  }
}
